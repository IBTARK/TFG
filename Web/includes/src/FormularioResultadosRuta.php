<?php
namespace tfg\src;

use PDO;
use Exception;

class FormularioResultadosRuta extends Formulario {

    private $origenId;
    private $destinoId;
    private $opciones;
    private $opcionesIds = [];
    private $siglasLinea = []; 

    private $rutas = [];
    private $estacionOrigen;
    private $estacionDestino;

    public function __construct(){
        parent::__construct('formResultadosRuta');
    }

    public function procesaFormulario(&$datos)
    {

        $this->origenId = isset($datos['origen']) ? $datos['origen'] : '';
        $this->destinoId = isset($datos['destino']) ? $datos['destino'] : '';
        $this->opcionesIds = isset($datos['opciones']) ? $datos['opciones'] : [];

        if (empty($this->origenId) || empty($this->destinoId)) {
            $this->errores[] = "Se deben seleccionar tanto origen como destino.";
            return;
        }
        
        try {
            $conn = new PDO("mysql:host=".BD_HOST.";dbname=".BD_NAME, BD_USER, BD_PASS);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $stmtOrigen = $conn->prepare("SELECT nombre FROM estaciones WHERE id = :id");
            $stmtOrigen->bindParam(':id', $this->origenId);
            $stmtOrigen->execute();
            $this->estacionOrigen = $stmtOrigen->fetch(PDO::FETCH_ASSOC);

            $stmtDestino = $conn->prepare("SELECT nombre FROM estaciones WHERE id = :id");
            $stmtDestino->bindParam(':id', $this->destinoId);
            $stmtDestino->execute();
            $this->estacionDestino = $stmtDestino->fetch(PDO::FETCH_ASSOC);

            $stmtSiglas = $conn->query("SELECT id, siglas FROM lineas");
            $this->siglasLinea = $stmtSiglas->fetchAll(PDO::FETCH_KEY_PAIR);

            if ($this->opcionesIds) {
                $placeholders = implode(',', array_fill(0, count($this->opcionesIds), '?'));
                $stmt = $conn->prepare("SELECT descripcion FROM caracteristicas WHERE id IN ($placeholders)");
                $stmt->execute($this->opcionesIds);
                $this->opciones = $stmt->fetchAll(PDO::FETCH_COLUMN);
            }

            $this->rutas = $this->llamaApiRutas(
                $this->origenId,
                $this->destinoId,
                $this->opcionesIds
            );
            if ($this->rutas === null) {
                $this->errores[] = "No se pudo obtener la ruta. Inténtalo de nuevo más tarde.";
            }
        } catch (Exception $e) {
            $this->errores[] = "Error al consultar la base de datos: " . $e->getMessage();
        }
    }

    private function llamaApiRutas(int $source, int $dest, array $filters): ?array
    {
        $query  = http_build_query([
            'source'      => $source,
            'destination' => $dest,
        ], '', '&', PHP_QUERY_RFC3986);

        foreach ($filters as $f) {
            $query .= '&filters='.rawurlencode($f);
        }

        $url = "http://127.0.0.1:8000/api/routes?$query";

        $ch = curl_init($url);
        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT        => 5,
            CURLOPT_HTTPGET        => true,
        ]);

        $response  = curl_exec($ch);
        $httpCode  = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        if ($response === false) {
            error_log("cURL error al llamar $url : $curlError");
            return null;
        }

        if ($httpCode < 200 || $httpCode >= 300) {
            error_log("API /routes devolvió $httpCode. Cuerpo: $response");
            return null;
        }

        $data = json_decode($response, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            error_log("JSON inválido de /routes: ".json_last_error_msg());
            return null;
        }

        */
        return $this->transformaRutas($data, $filters);
    }

    private function transformaRutas(array $data, array $filters): array
    {
        $out = [];
        $wantAcc = in_array(10, $filters);

        foreach ($data as $idx => $r) {

            $lines   = [];
            $trans   = 0;
            $prevLn  = null;
            $segTime = [];

            $path = $r['path'];
            $last = count($path) - 1;

            for ($i = 0; $i <= $last; $i++) {
                $ln = (int)$path[$i]['line'];

                if (!in_array($ln, $lines, true)) $lines[] = $ln;
                if ($prevLn !== null && $ln !== $prevLn) $trans++;
                $prevLn = $ln;

                if ($i < $last) {
                    $segTime[] = $this->tiempoEntre(
                        $path[$i]['station_id'],
                        $path[$i+1]['station_id'],
                        $ln
                    );         
                }
            }

            $out[] = [
                'id'            => $idx + 1,
                'tiempo'        => $r['time'],
                'transbordos'   => $trans,
                'accesibilidad' => $wantAcc,
                'lineas'        => $lines,
                'descripcion'   => $r['description'],
                'trayecto'      => $path,
                'segment_times' => $segTime       
            ];
        }
    return $out;
    }

    private function sigla(int $id): string
    {
    return $this->siglasLinea[$id]  ?? (string)$id;          
    }

    public function generaCamposFormulario(&$datos)
    {
            $htmlErrores = !empty($this->errores)
                ? self::generaListaErroresGlobales($this->errores)
                : '';

            $origen  = htmlspecialchars($this->estacionOrigen['nombre']  ?? '');
            $destino = htmlspecialchars($this->estacionDestino['nombre'] ?? '');

            $html = <<<HTML
        {$htmlErrores}
        <section class="card contenedor-busqueda">
        <div class="contenedor-resultados">
            <h2>Resultados de Ruta</h2>
            <div class="info-busqueda">
                <p><strong>Origen:</strong> {$origen}</p>
                <p><strong>Destino:</strong> {$destino}</p>
            </div>
        HTML;

            $opcTexto = !empty($this->opciones)
                ? implode(', ', array_map('htmlspecialchars', $this->opciones))
                : 'Sin preferencias';

            foreach ($this->rutas as $ruta) {
                $chips = '';
                foreach ($ruta['lineas'] as $l) {
                    $num   = (int)$l;
                    $chips .= '<span class="linea-icono linea-'.$num.'">'.$this->sigla($num).'</span>';
                }

                $icoAcc = $ruta['accesibilidad']
                    ? '<span class="accesible" title="Ruta totalmente accesible">♿</span>'
                    : '';
                $det  = "<div class=\"ruta-detalles\" id=\"detalles-ruta-{$ruta['id']}\">\n";
                $det .= "  <div class=\"detalle-descripcion\"><p>" .
                        htmlspecialchars($ruta['descripcion']) . "</p></div>\n";

                $det .= "  <ul class=\"lista-trayecto\">\n";
                $path    = $ruta['trayecto'];
                $times   = $ruta['segment_times'];
                $lastIdx = count($path) - 1;

                foreach ($path as $i => $stop) {
                    $ln   = (int)$stop['line'];
                    $name = htmlspecialchars($stop['station_name']);

                    $extra = '';
                    if ($i < $lastIdx) {
                        $min   = $times[$i];
                        $label = $min !== null ? $min . ' min' : '?';
                        $extra = "<span class=\"tiempo-tramo\">({$label})</span>";
                    }

                    $det .= '<li><span class="linea-icono linea-'.$ln.'">' . $this->sigla($ln) .
                            '</span> <span class="nombre-estacion">'.$name.'</span>'.$extra."</li>\n";
                }
                $det .= "  </ul>\n";
                $det .= "</div>\n";  

                // aqui implementaremos el mapa
            
                $html .= <<<HTML
            <div class="ruta-item" data-ruta-id="{$ruta['id']}">
                <div class="ruta-principal">
                    <div class="ruta-tiempo">{$ruta['tiempo']} min</div>
                    <div class="ruta-info">
                        <p><strong>Preferencias seleccionadas:</strong> {$opcTexto}</p>
                        <div class="ruta-lineas">{$chips}</div>
                        <div class="ruta-transbordos">
                            {$ruta['transbordos']} transbordos {$icoAcc}
                        </div>
                    </div>
                    <div class="ruta-accion">
                        <button class="boton-ver-detalles"
                                data-ruta-id="{$ruta['id']}">Ver detalles</button>
                    </div>
                </div>
            {$det}
        </div>
        HTML;
            } 

            $html .= <<<HTML
            </div>          
        </section>       

            <div class="acciones-resultados">
            <a href="index.php" class="boton-volver btn btn-primary" id="btnVolver"><i class="fa-solid fa-route"></i> Nueva búsqueda </a>
            </div>

                <script src="./js/resultadosRuta.js"></script>
        HTML;

    return $html;
    }

    
    private function tiempoEntre(int $id1, int $id2, int $linea): ?int
    {
        $key = $id1 < $id2 ? "$id1:$id2:$linea" : "$id2:$id1:$linea";
        static $cache = [];
        if (isset($cache[$key])) return $cache[$key];

        try {
            $pdo = new PDO(
                "mysql:host=" . BD_HOST . ";dbname=" . BD_NAME,
                BD_USER,
                BD_PASS,
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            );

            $sql = "
                SELECT tiempo
                FROM conexiones
                WHERE linea = :linea
                AND (
                        (estacion_origen = :o1 AND estacion_destino = :d1)
                    OR (estacion_origen = :d1 AND estacion_destino = :o1)
                )
                LIMIT 1";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                ':linea' => $linea,
                ':o1'    => $id1,
                ':d1'    => $id2,
            ]);

            $min = $stmt->fetchColumn();
            $cache[$key] = $min !== false ? (int)$min : null;
            return $cache[$key];

        } catch (Exception $e) {
            error_log("tiempoEntre() error: " . $e->getMessage());
            return null;
        }
    }
}
?>
