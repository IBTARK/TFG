<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Estaciones';

$contenidoPrincipal = <<<EOS
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Good Stations</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e3f2fd;
            text-align: center;
        }
        header {
            background-color: #2196f3;
            color: white;
            padding: 20px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 15px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        .lines-container {
            margin: 20px;
        }
        .line {
            background-color: #ffeb3b;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .stations, .station-info {
            margin: 20px;
        }
        #station-list {
            list-style-type: none;
            padding: 0;
        }
        #station-list li {
            padding: 10px;
            background-color: #bbdefb;
            margin: 5px;
            cursor: pointer;
        }
        #station-details {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <main>
        <section class="lines">
            <h2>Selecciona una línea:</h2>
            <div class="lines-container">
                <button class="line" data-line="1">1</button>
                <button class="line" data-line="2">2</button>
                <button class="line" data-line="3">3</button>
                <!-- Agregar más líneas según sea necesario -->
            </div>
        </section>
        
        <section class="stations">
            <h2>Estaciones</h2>
            <ul id="station-list"></ul>
        </section>

        <section class="station-info">
            <h2>Información de la Estación</h2>
            <div id="station-details">Selecciona una estación para ver los detalles.</div>
        </section>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const stationsData = {
                1: ["Pinar de Chamartín", "Chamartín", "Tetuán", "Cuatro Caminos"],
                2: ["Las Rosas", "Manuel Becerra", "Banco de España", "Sol"],
                3: ["Villaverde Alto", "Legazpi", "Callao", "Moncloa"]
            };
            
            document.querySelectorAll(".line").forEach(button => {
                button.addEventListener("click", function() {
                    const lineNumber = this.dataset.line;
                    const stationList = document.getElementById("station-list");
                    stationList.innerHTML = "";
                    
                    stationsData[lineNumber].forEach(station => {
                        const li = document.createElement("li");
                        li.textContent = station;
                        li.addEventListener("click", function() {
                            document.getElementById("station-details").textContent = `Información de la estación: `;
                        });
                        stationList.appendChild(li);
                    });
                });
            });
        });
    </script>
</body>
</html>
EOS;

require __DIR__.'/includes/vistas/plantillas/plantilla.php';