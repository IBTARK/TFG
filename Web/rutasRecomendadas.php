<?php

namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Elegir Ruta';

$formRuta=new RecomendacionesRutas();
$htmlForm=$formRuta->gestiona();

$contenidoPrincipal = <<<EOS
    $htmlForm
EOS;

$contenidoPrincipal = '';

require __DIR__.'/includes/vistas/plantillas/plantilla.php';