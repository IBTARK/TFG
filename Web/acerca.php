<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Acerca';

$contenidoPrincipal = <<<EOS

    <div class="acerca">
        <p>Esta aplicación web forma parte del Trabajo de Fin de Grado de Ingeniería Informática realizado 
        por los alumnos Ibón Malles Altolaguirre, Francisco Prieto Gallego, Daniel Pérez García y José María Martín Dasilva.</p>
    </div>

EOS;

require __DIR__.'/includes/vistas/plantillas/plantilla.php';