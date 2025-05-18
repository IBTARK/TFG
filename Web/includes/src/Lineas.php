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
            $html = <<<HTML
        <section class="card lineas-page">
        <h2>Líneas del Metro de Madrid</h2>

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
