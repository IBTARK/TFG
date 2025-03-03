<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Metro de Madrid';

$contenidoPrincipal = <<<EOS
    <div class="logo-index">
    <img src="./images/MetroMadridLogo.png" alt="LogoMetro" id="logoIndex">
    </div>  
    <div class="logo-cam-index">
    <img src="./images/EmblemaCAM.png" alt="LogoCam" id="LogoCamIndex">
    </div>
    <form id="botonEntrar" action="elegirRuta.php" method="POST">
        <button type="submit">Elegir Ruta</button>
    </form>
EOS;
require __DIR__.'/includes/vistas/plantillas/plantilla.php';