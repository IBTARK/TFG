<?php

namespace tfg\src;

class RecomendacionesRutas {
    private $origen;
    private $destino;
    private $trasbordo;
    private $movilidadReducida;

    public function __construct($origen, $destino) {
        $this->origen = $origen;
        $this->destino = $destino;
    }

    public function getOrigen() {
        return $this->origen;
    }

    public function getDestino() {
        return $this->destino;
    }

    public function generarRecomendacion(&$datos) {
        //$origen = $datos['origen'] ?? '';
        //$destino = $datos['destino'] ?? '';

        $origen = "Aeropuerto-T4";
        $destino = "Nuevos Ministerios";

        return <<<HTML
        <div class="caja-ruta">
            <div class="route-origen">Origen: {$origen}</div>
                <i class="fas fa-arrow-right"></i>
            <div class="route-destino">Destino: {$destino}</div>
        </div>
        HTML;
    }
}