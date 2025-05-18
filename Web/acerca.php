<?php
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Acerca del Proyecto';
$contenidoPrincipal = <<<EOS
<section class="card contenedor-busqueda">
<div class="contenedor-acerca">
    <h2>Acerca del Proyecto</h2>
    
    <div class="descripcion-proyecto">
        <h3>Good Stations - Metro de Madrid</h3>
        <p>
            Este proyecto tiene como objetivo desarrollar una aplicación web que persona-
            lice las rutas de transporte público en el Metro de Madrid utilizando opiniones y
            valoraciones de usuarios. Se usarán técnicas de Procesamiento de Lenguaje Natural
            para analizar y clasificar las reseñas de los usuarios para optimizar el trayecto según
            diversas preferencias y criterios específicos. Ejemplos de estos criterios son solicitar
            que los trasbordos se realicen en estaciones, preferir líneas con valoraciones positivas
            y evitar aquellas con valoraciones negativas, minimizar el tiempo en estaciones con
            alta percepción de inseguridad o priorizar rutas que pasen por estaciones destacadas
            por su accesibilidad para personas con movilidad reducida.
        </p>
        
        <h3>Características principales</h3>
        <ul>
            <li>Búsqueda de rutas entre estaciones del Metro de Madrid</li>
            <li>Filtrado por preferencias: Mal olor, estaciones valoraciones positivas, suciedad, etc</li>
            <li>Información detallada sobre las estaciones y líneas del metro</li>
            <li>Interfaz intuitiva y accesible</li>
            <li>Diseño adaptativo para diferentes dispositivos</li>
        </ul>
        
        <h3>Tecnologías utilizadas</h3>
        <ul>
            <li>PHP para el desarrollo del backend</li>
            <li>MySQL para la base de datos</li>
            <li>HTML5, CSS3 y JavaScript para el frontend</li>
        </ul>
    </div>
    
    <div class="equipo-proyecto">
        <h3>Equipo de desarrollo</h3>
        <div class="miembros">
            <div class="miembro">
                <h4>Nombre del Estudiante</h4>
                    <p>José María Martín Dasilva (GII)</p>
                    <p>Daniel Pérez García (GII)</p>
                    <p>Francisco Prieto Gallego (GII)</p>
                    <p>Ibon Malles Altolaguirre (GII)</p>
            </div>
            <div class="miembro">
                <h4>Nombre del Tutor</h4>
                <p>Manuel Núñez García</p>
                <p>Manuel Méndez Hurtado</p>
            </div>
            <!-- Puedes añadir más miembros según sea necesario -->
        </div>
    </div>
    
    <div class="contacto-acerca">
        <h3>Contacto</h3>
        <p>Para más información sobre este proyecto, puedes contactar a través de:</p>
        <p><strong>Email:</strong> <li>josema09@ucm.es</li> <li>ibmalles@ucm.es </li> <li>fpriet01@ucm.es</li> <li>danper09@ucm.es</li></p>
    </div>
</div>
</section>
EOS;

require __DIR__.'/includes/vistas/plantillas/plantilla.php';
?>
