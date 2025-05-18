<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">        
    <title><?= $tituloPagina ?></title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"> 

    <link rel="stylesheet" href="<?= RUTA_CSS ?>/estilos.css">
    <link rel="icon" href="<?= RUTA_IMGS ?>/MetroMadridLogo.png">
</head>

<body>
        <?php require RAIZ_APP.'/vistas/comun/cabecera.php'; ?>
    <main class="wrapper">
            <article>
                <?= $contenidoPrincipal ?>
            </article>
        </main>
    </div>

</body>
</html>
