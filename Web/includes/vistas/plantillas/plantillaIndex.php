<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title><?= $tituloPagina ?></title>
    <link rel="stylesheet" type="text/css" href="<?= RUTA_CSS ?>/estilos.css" media="all"/>
	<link rel="icon" type="image/x-icon" href="<?= RUTA_IMGS ?>/MetroMadridLogo.png"/>
</head>
<body>
    <div id="contenedor">
    <?php
	require(RAIZ_APP.'/vistas/comun/cabeceraIndex.php');
	?>
    <main>
        <article>
            <?= $contenidoPrincipal ?>
        </article>
    </main>
    </div>
</body>
</html>