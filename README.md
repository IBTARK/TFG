# Instalación de la página web

Para poder utilizar la página web se necesita de un host donde alojarla. En nuestro caso, hemos utilizado la herramienta XAMPP.

Pueden descargar XAMPP [aquí](https://www.apachefriends.org/es/index.html).

## Cómo utilizar XAMPP

Para poder utilizar XAMPP correctamente se deben seguir los siguientes pasos que se explican a continuación.

### Alojar el código de la web

Una vez se haya descargado XAMPP, encontrará un directorio con el mismo nombre. Dentro de éste, podrá localizar el directorio htdocs, donde se alojará el código de la web.

Después de eso, necesitará comprobar el archivo config.php, que se encuentra en la ruta relativa a htdocs TFG/Web/includes. En él, tendrá que comprobar que los parámetros de configuración son correctos, en especial el parámetro RUTA_APP, ya que si desea utilizar una localización diferente, deberá ajustarlo para el correcto funcionamiento de la web.

### Base de datos

Para importar la base de datos, se necesita utilizar el panel de control de XAMPP. En él, deberá activar Apache y MySQL pulsando el botón de start. Asegúrese de que no existan programas en su dispositivo que puedan generar conflicto con estas dos herramientas, ya que éstos podrían bloquear el puerto donde se alojan (80 y 443 para Apache, 3306 para MySQL).

Una vez que ambos estén activos, deberá escribir en el navegador "localhost". Se le redigirá a la URL [localhost/dashboard](http://localhost/dashboard/). Cuando lo haga, pulse en phpmyadmin para acceder al administrador de la base de datos.

#### Importar base de datos

Para poder importar la base de datos, deberán pulsar en el botón "Importar" e importar primero el archivo tfgmetro.sql, que contiene la estructura de la base de datos y a continuación el de metroDatos.sql, que contiene los datos de ésta.

*Nota: recomendamos desabilitar la opción de "Habilite la revisión de las claves foráneas" para evitar problemas con la importación.*

#### Importar usuario

Para poder utilizar la base de datos, se necesita de un usuario que tenga las credenciales para ello. Puede importarlo directamente desde el archivo dbUser.sql, que se encuentra en la ruta TFG/Web/includes/db. 

*Nota: En caso de que esto no funcione, puede crearlo manualmente desde el apartado de Cuentas de Usuarios de phpmyadmin. Para ello, pulse en "Agregar cuenta de usuario" y concédale todos los permisos en la base de datos tfgmetro.*

## Cómo utilizar la página web

Una vez importada la base de datos y teniendo Apache y MySQL activados, procedemos a acceder a la página web. Según la configuración actual del config.php, la URL de la web es [localhost/TFG/Web/index.php](http://localhost/TFG/Web/index.php). 

Al acceder a esa URL nos encontraremos con el panel para poder elegir la ruta que deseemos. En él, se deben elegir la estación de origen y destino (obligatorias) y las opciones extras que se ofrecen (opcionales). Después pulsamos en el botón de "Buscar Ruta" para que la web nos muestre sus recomendaciones. En las recomendaciones, podemos pulsar en el botón "Ver detalles" para ver más información de cada ruta. Si queremos realizar una ruta distinta, pulsamos en el botón "Nueva Búsqueda" para volver al panel de "Buscar Ruta".

Además, utilizando la barra de navegación podemos llegar a la página de [Estaciones](http://localhost/TFG/Web/lineasMetro.php), donde se puede consultar información sobre una estación en concreto. Para ello, seleccionamos primero la línea en la que se encuentra dicha estación y acto seguido, la estación correspondiente.

Por último, gracias otra vez a la barra de navegación podemos ir a la página de [Acerca](http://localhost/TFG/Web/acerca.php), donde se puede ver información sobre el proyecto.