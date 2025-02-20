<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Metro de Madrid';

$contenidoPrincipal = <<<EOS
    <form action="elegirRuta.php" method="POST">
        <button type="submit">Elegir Ruta</button>
    </form>
EOS;
require __DIR__.'/includes/vistas/plantillas/plantilla.php';