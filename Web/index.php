<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Metro de Madrid';

$contenidoPrincipal = <<<EOS
    <button id="botonInicio" onclick="elegirRuta.php">Comenzar</button>
EOS;
require __DIR__.'/includes/vistas/plantillas/plantilla.php';