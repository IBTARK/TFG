<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Elegir Ruta';

$formulario = new FormularioElegirRuta();
$htmlFormulario = $formulario->generar();

$contenidoPrincipal = $htmlFormulario;

require __DIR__.'/includes/vistas/plantillas/plantilla.php';
?>