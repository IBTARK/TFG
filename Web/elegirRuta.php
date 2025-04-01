<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Elegir Ruta';

$rutas=new RecomendacionesRutas();
$htmlForm=$rutas->generarRecomendacion();

$contenidoPrincipal = <<<EOS
    $htmlForm
EOS;

require __DIR__.'/includes/vistas/plantillas/plantilla.php';