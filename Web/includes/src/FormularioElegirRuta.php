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

        $iconos = [
            1 => 'fa-broom', 
            2 => 'fa-expand',
            3 => 'fa-people-roof', 
            4 => 'fa-circle', 
            5 => 'fa-wheelchair', 
            6 => 'fa-building',
            7 => 'fa-angles-up', 
            8 => 'fa-shield',
            9 => 'fa-lightbulb', 
            10 => 'fa-face-smile', 
            11 => 'fa-elevator', 
        ];

        $html = '';
        foreach ($this->caracteristicas as $caracteristica) {
            $id   = (int)$caracteristica['id'];
            $desc = htmlspecialchars($caracteristica['descripcion']);
            $icon = $iconos[$id] ?? 'fa-circle';
            $html .= <<<HTML
                <div class="opcion">
                    <input type="checkbox" id="opcion-$id" name="opciones[]" value="$id">
                    <label for="opcion-$id"><i class="fa-solid $icon"></i> $desc</label>
                </div>
            HTML;
        }
        return $html;
    }


    public function generar() {
       /* $opcionesOrigen = $this->generarOpcionesEstaciones();
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
        */
        $opcionesEstaciones    = $this->generarOpcionesEstaciones();
        $opcionesCaracteristicas = $this->generarOpcionesCaracteristicas();

        return <<<HTML

        <section class="card contenedor-busqueda">
            <h2>Calcula tu trayecto</h2>

            <form id="formRuta" action="resultadosRuta.php" method="post">

                <div class="selector-estaciones">
                    <div class="grupo-select">
                        <label for="origen">Estación de Origen:</label>
                        <select id="origen" name="origen" required>
                            $opcionesEstaciones
                        </select>
                    </div>

                    <div class="grupo-select">
                        <label for="destino">Estación de Destino:</label>
                        <select id="destino" name="destino" required>
                            $opcionesEstaciones
                        </select>
                    </div>
                </div>

                <div class="menu-opciones">
                    <h3>Preferencias</h3>
                    <div class="opciones-viaje">
                        $opcionesCaracteristicas
                    </div>
                </div>

                

           
        </section>
        <div class="boton-buscar">
                    <button type="submit" class="btn btn-primary" id="btnBuscar">
                        <i class="fa-solid fa-route"></i> Buscar Ruta
                    </button>
                </div>
                 </form>
        <script src="./js/buscaRuta.js"></script>
        HTML;
    }

    protected function procesaFormulario(&$datos) {
        $this->errores = [];

        if (empty($datos['origen']) || empty($datos['destino'])) {
            $this->errores[] = "Debe seleccionar ambas estaciones.";
        }
    }
}
?>
