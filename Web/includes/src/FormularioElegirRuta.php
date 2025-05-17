<?php
namespace tfg\src;

class FormularioElegirRuta extends Formulario {

    private $estaciones = [];
    private $caracteristicas = [];

    public function __construct() {
        parent::__construct('formElegirRuta', ['urlRedireccion' => null]);
        $this->cargarEstaciones();
        $this->cargarCaracteristicas();
    }

    private function cargarEstaciones() {
        try {
            $conn = new \PDO("mysql:host=" . BD_HOST . ";dbname=" . BD_NAME, BD_USER, BD_PASS);
            $conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

            $stmt = $conn->prepare("SELECT id, nombre FROM estaciones ORDER BY nombre");
            $stmt->execute();
            $this->estaciones = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            $this->estaciones = [];
            echo "Error al conectar con la base de datos: " . $e->getMessage();
        }
    }

    private function cargarCaracteristicas() {
        try {
            $conn = new \PDO("mysql:host=" . BD_HOST . ";dbname=" . BD_NAME, BD_USER, BD_PASS);
            $conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

            $stmt = $conn->prepare("SELECT id, descripcion FROM caracteristicas");
            $stmt->execute();
            $this->caracteristicas = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            $this->caracteristicas = [];
            echo "Error al conectar con la base de datos: " . $e->getMessage();
        }
    }

    private function generarOpcionesEstaciones() {
        $html = '<option value="">Seleccione estación...</option>';
        foreach ($this->estaciones as $estacion) {
            $id = htmlspecialchars($estacion['id']);
            $nombre = htmlspecialchars($estacion['nombre']);
            $html .= "<option value=\"$id\">$nombre</option>";
        }
        return $html;
    }

    private function generarOpcionesCaracteristicas() {
        $html = '';
        foreach ($this->caracteristicas as $caracteristica) {
            $id = htmlspecialchars($caracteristica['id']);
            $descripcion = htmlspecialchars($caracteristica['descripcion']);
            $html .= <<<HTML
                <div class="opcion">
                    <input type="checkbox" id="opcion-$id" name="opciones[]" value="$id">
                    <label for="opcion-$id">$descripcion</label>
                </div>
            HTML;
        }
        return $html;
    }


    public function generar() {
        $opcionesOrigen = $this->generarOpcionesEstaciones();
        $opcionesDestino = $opcionesOrigen;
        $opcionesCaracteristicas = $this->generarOpcionesCaracteristicas();

        $html = <<<EOF
        <div class="contenedor-busqueda">
            <h2>Calcula tu trayecto</h2>
            <div class="formulario-busqueda">
                <form id="formRuta" action="resultadosRuta.php" method="post">
                <div class="selector-estaciones">
                    <div class="grupo-select">
                        <label for="origen">Estación de Origen:</label>
                        <select id="origen" name="origen" required>
                            $opcionesOrigen
                        </select>
                    </div>
                    <div class="grupo-select">
                        <label for="destino">Estación de Destino:</label>
                        <select id="destino" name="destino" required>
                            $opcionesDestino
                        </select>
                    </div>
                </div>

                <div class="menu-opciones">
                    <h3>Preferencias</h3>
                    <div class="opciones-viaje">
                        $opcionesCaracteristicas
                    </div>
                </div>

                <div class="boton-buscar">
                    <button type="submit">Buscar Ruta</button>
                </div>
                </form>
            </div>
        </div>
        <script src="./js/buscaRuta.js"></script>
        EOF;

        return $html;
    }

    protected function procesaFormulario(&$datos) {
        // Este formulario probablemente redirige, pero aquí se pueden validar entradas si lo necesitas.
        $this->errores = [];

        if (empty($datos['origen']) || empty($datos['destino'])) {
            $this->errores[] = "Debe seleccionar ambas estaciones.";
        }
        // Validaciones adicionales si lo ves necesario.
    }
}
?>
