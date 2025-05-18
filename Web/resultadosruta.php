<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Metro de Madrid - Resultados de Ruta';

$formulario = new FormularioResultadosRuta();

$formulario->procesaFormulario($_POST);
$resultados = $formulario->generaCamposFormulario($_POST);

$contenidoPrincipal = <<<EOS
    $resultados
    EOS;

require __DIR__.'/includes/vistas/plantillas/plantilla.php';
?>
