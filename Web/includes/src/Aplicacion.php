<?php

namespace tfg\src;
use mysqli;

class Aplicacion
{
	private function __construct()
	{}

	private static $instancia;

	public static function getInstance() {
		if (  !self::$instancia instanceof self) {
			self::$instancia = new static();
		}
		return self::$instancia;
	}


	private $bdDatosConexion;
	private $isInicializada = false;
	private $conn;	
	
	/*Inicializar la conexión*/
	public function init($bdDatosConexion)
	{
        if (!$this->isInicializada) {
    	    $this->bdDatosConexion = $bdDatosConexion;
    		$this->isInicializada = true;
        }
	}
	
	/*Apagar la conexion*/
	public function shutdown()
	{
	    $this->compruebaInstanciaInicializada();
	    if ($this->conn !== null && ! $this->conn->connect_errno) {
	        $this->conn->close();
	    }
	}

	/*Comprobar si se ha inicializado bien*/
	private function compruebaInstanciaInicializada()
	{
	    if (!$this->isInicializada) {
	        echo "Aplicacion no inicializada";
	        exit();
	    }
	}
	
	/*Conectarse a la base de datos*/
	public function getConexionBd()
	{
	    $this->compruebaInstanciaInicializada();
		if (!$this->conn ) {
			/*Datos de la conexión*/
			$bdHost = $this->bdDatosConexion['host'];
			$bdUser = $this->bdDatosConexion['user'];
			$bdPass = $this->bdDatosConexion['pass'];
			$bd = $this->bdDatosConexion['bd'];
			
			$conn = new mysqli($bdHost, $bdUser, $bdPass, $bd);
			if ( $conn->connect_errno ) {
				echo "Error de conexión a la BD ({$conn->connect_errno}):  {$conn->connect_error}";
				exit();
			}
			if (!$conn->set_charset("utf8mb4")) {
				echo "Error al configurar la BD ({$conn->errno}):  {$conn->error}";
				exit();
			}
			$this->conn = $conn;
		}
		return $this->conn;
	}
}