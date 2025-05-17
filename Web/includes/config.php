<?php
namespace tfg\src;

spl_autoload_register(function ($class) {
    
    $prefix = 'tfg\\';

    // Directorio base para el prefijo del espacio de nombres
    $base_dir = './includes/';
    
    $len = strlen($prefix);
    if (strncmp($prefix, $class, $len) !== 0) {
        return;
    }

    $relative_class = substr($class, $len);

    $file = $base_dir . str_replace('\\', '/', $relative_class) . '.php';

    if (file_exists($file)) {
        require $file;
    }
});

define('BD_HOST', 'localhost');
define('BD_USER', 'rutasmetro');
define('BD_PASS', 'metromadrid');
define('BD_NAME', 'tfgmetro');

define('RAIZ_APP', __DIR__);
define('RUTA_APP', '/Web');
define('RUTA_IMGS', RUTA_APP.'/images');
define('RUTA_CSS', RUTA_APP.'/css');
define('RUTA_JS', RUTA_APP.'/js');

ini_set('default_charset', 'UTF-8');
setLocale(LC_ALL, 'es_ES.UTF.8');
date_default_timezone_set('Europe/Madrid');

$app =Aplicacion::getInstance();
$app->init(['host'=>BD_HOST, 'bd'=>BD_NAME, 'user'=>BD_USER, 'pass'=>BD_PASS]);
register_shutdown_function([$app, 'shutdown']);
?>