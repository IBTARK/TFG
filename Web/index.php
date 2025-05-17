<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Metro de Madrid - Inicio';
$contenidoPrincipal = <<<EOS
<div class="contenedor-inicio">
    <div class="logo-principal">
        <img src="./images/MetroMadridLogo.png" alt="Logo Metro de Madrid" id="logoMetroPrincipal">
    </div>
    <div class="contenedor-boton">
        <a href="buscarRuta.php" class="boton-entrar">Entrar</a>
    </div>
</div>
EOS;

require __DIR__.'/includes/vistas/plantillas/plantillaIndex.php';
?>
