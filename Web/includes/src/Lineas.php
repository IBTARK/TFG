<?php

namespace tfg\src;

class Lineas {

    private $conn;
    private $lineas = [];
    private $estaciones = [];
    private $infoEstacion = null;
    private $lineaSeleccionada;
    private $estacionSeleccionada;

    public function __construct() {
        $this->lineaSeleccionada = $_GET['linea'] ?? null;
        $this->estacionSeleccionada = $_GET['estacion'] ?? null;

        $this->establecerConexion();
        $this->cargarLineas();

        if ($this->lineaSeleccionada) {
            $this->cargarEstaciones($this->lineaSeleccionada);
        }

        if ($this->estacionSeleccionada) {
            $this->cargarInfoEstacion($this->estacionSeleccionada);
        }
    }

    private function establecerConexion() {
        try {
            $this->conn = new \PDO("mysql:host=" . BD_HOST . ";dbname=" . BD_NAME, BD_USER, BD_PASS);
            $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            echo "Error al conectar con la base de datos: " . $e->getMessage();
            exit;
        }
    }

    private function cargarLineas() {
        $stmt = $this->conn->prepare("SELECT id, nombre, color FROM lineas ORDER BY id");
        $stmt->execute();
        $this->lineas = $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    private function cargarEstaciones($lineaId) {
        $stmt = $this->conn->prepare("
            SELECT e.id, e.nombre
            FROM estaciones e
            JOIN estaciones_lineas el ON e.id = el.estacion_id
            WHERE el.linea_id = :linea_id
            ORDER BY el.orden
        ");
        $stmt->bindParam(':linea_id', $lineaId);
        $stmt->execute();
        $this->estaciones = $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    private function cargarInfoEstacion($estacionId) {
        $stmt = $this->conn->prepare("
            SELECT e.*, GROUP_CONCAT(DISTINCT l.nombre ORDER BY l.id SEPARATOR ', ') as lineas
            FROM estaciones e
            LEFT JOIN estaciones_lineas el ON e.id = el.estacion_id
            LEFT JOIN lineas l ON el.linea_id = l.id
            WHERE e.id = :estacion_id
            GROUP BY e.id
        ");
        $stmt->bindParam(':estacion_id', $estacionId);
        $stmt->execute();
        $this->infoEstacion = $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public function generar() {
        /*$html = <<<EOS
        <section class="card contenedor-busqueda">
        <div class="contenedor-lineas">
            <h2>Líneas del Metro de Madrid</h2>
            <div class="selector-lineas">
        EOS;

        foreach ($this->lineas as $linea) {
            $activa = ($this->lineaSeleccionada == $linea['id']) ? 'linea-activa' : '';
            $html .= <<<EOS
                <a href="?linea={$linea['id']}" class="boton-linea {$activa}" style="background-color: #{$linea['color']}">
                    {$linea['nombre']}
                </a>
            EOS;
        }

        $html .= <<<EOS
            </div>
            <div class="contenedor-estaciones">
        EOS;

        if (!empty($this->estaciones)) {
            $html .= '<div class="lista-estaciones">';
            foreach ($this->estaciones as $estacion) {
                //$icono = $estacion['accesibilidad'] ? '<span class="accesible" title="Estación accesible">♿</span>' : '';
                $activa = ($this->estacionSeleccionada == $estacion['id']) ? 'estacion-activa' : '';
                $html .= <<<EOS
                    <a href="?linea={$this->lineaSeleccionada}&estacion={$estacion['id']}" class="estacion-item {$activa}">
                        <span class="nombre-estacion">{$estacion['nombre']}</span>
                    <!--aqui iria el icono-->
                    </a>
                    
                EOS;
            }
            $html .= '</div>';
        }

        if ($this->infoEstacion) {
            //$accesoTexto = $this->infoEstacion['accesibilidad'] ? 'Accesible' : 'No completamente accesible';
            //$accesoClass = $this->infoEsstacion['accesibilidad'] ? 'accesible' : 'no-accesible';

            $html .= <<<EOS
                <div class="detalle-estacion">
                    <h3>{$this->infoEstacion['nombre']}</h3>
                    <div class="info-estacion">
                        <div class="dato-estacion">
                            <span class="etiqueta">Líneas:</span>
                            <span class="valor">{$this->infoEstacion['lineas']}</span>
                        </div>
                        <div class="dato-estacion">
                            <span class="etiqueta">Dirección:</span>
                            <span class="valor">{$this->infoEstacion['direccion']}</span>
                        </div>
                        <div class="dato-estacion descripcion">
                            <span class="etiqueta">Descripción:</span>
                            <p class="valor">{$this->infoEstacion['descripcion']}</p>
                        </div>
                    </div>
                </div>
                </section>
            EOS;
        }

        $html .= <<<EOS
            </div>
        </div>
        
        EOS;

        return $html;
        */
            $html = <<<HTML
        <section class="card lineas-page">
        <h2>Líneas del Metro de Madrid</h2>

        <!-- Barra de chips ————————————————————————-->
        <div class="chips-lineas">
HTML;

    foreach ($this->lineas as $l) {
        $activa = $this->lineaSeleccionada == $l['id'] ? 'chip-activo' : '';
        $html  .= '<a href="?linea='.$l['id'].'" '
               .  'class="chip-linea '.$activa.'" '
               .  'style="--clr:#'.$l['color'].'">'.$l['nombre'].'</a>';
    }

    $html .= '</div><div class="zona-estaciones">';

    if ($this->estaciones) {
        //$html .= '<ul class="lista-estaciones-scroll">';
        $html .= '<ul class="lista-estaciones-scroll esquema">';
        foreach ($this->estaciones as $e) {
            $activa = $this->estacionSeleccionada == $e['id'] ? 'est-activa' : '';
            $html  .= '<li><a class="'.$activa.'" '
                   .  'href="?linea='.$this->lineaSeleccionada.'&estacion='.$e['id'].'">'
                   .  $e['nombre'].'</a></li>';
        }
        $html .= '</ul>';
    }

    if ($this->infoEstacion) {
        $inf = $this->infoEstacion;            
        $html .= <<<HTML
        <div class="detalle-estacion-card">
            <h3>{$inf['nombre']}</h3>
            <dl>
                <dt>Líneas</dt><dd>{$inf['lineas']}</dd>
                <dt>Dirección</dt><dd>{$inf['direccion']}</dd>
            </dl>
            <hr>
            <p>{$inf['descripcion']}</p>
        </div>
HTML;
    }

    $html .= '</div></section>';
    return $html;
    }
}
?>
