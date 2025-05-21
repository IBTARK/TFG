# Instalación de la página web

Para poder utilizar la página web se necesita de un host donde alojarla. En nuestro caso, hemos utilizado la herramienta XAMPP.

Pueden descargar XAMPP [aquí](https://www.apachefriends.org/es/index.html).

## Cómo utilizar XAMPP

Para poder utilizar XAMPP correctamente se deben seguir los siguientes pasos que se explican a continuación.

### Alojar el código de la web

Una vez se haya descargado XAMPP, encontrará un directorio con el mismo nombre. Dentro de éste, podrá localizar el directorio htdocs, donde se alojará el código de la web.

Después de eso, necesitará comprobar el archivo config.php, que se encuentra en la ruta relativa a htdocs TFG/Web/includes. En él, tendrá que comprobar que los parámetros de configuración son correctos, en especial el parámetro RUTA_APP, ya que si desea utilizar una localización diferente, deberá ajustarlo para el correcto funcionamiento de la web.

### Base de datos

Para importar la base de datos, se necesita utilizar el panel de control de XAMPP. En él, deberá activar Apache y MySQL pulsando el botón de start. Asegúrese de que no existan programas en su dispositivo que puedan generar conflicto con estas dos herramientas, ya que estas podrían bloquear el puerto donde se alojan (80 y 443 para Apache, 3306 para MySQL).

Una vez que ambos estén activos, deberá escribir en el navegador "localhost". Se le redigirá a la URL [localhost/dashboard](http://localhost/dashboard/). Cuando lo haga, pulse en phpmyadmin para acceder al administrador de la base de datos.

#### Importar usuario

Para poder utilizar la base de datos, se necesita de un usuario que tenga las credenciales para ello. Puede importarlo directamente desde el archivo dbUser.sql, que se encuentra en la ruta TFG/Web/includes/db. 

*Nota: En caso de que esto no funcione, puede crearlo manualmente desde el apartado de Cuentas de Usuarios de phpmyadmin. Para ello, *