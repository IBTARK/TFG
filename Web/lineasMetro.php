<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Líneas y estaciones';

$lineas = new Lineas();
$generaLineas = $lineas->generar();

$contenidoPrincipal = <<<EOS
    $generaLineas
EOS;

require __DIR__.'/includes/vistas/plantillas/plantilla.php';
?>
