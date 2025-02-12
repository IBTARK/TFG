<?php

namespace tfg\src;
use mysqli;

class Aplicacion
{
	private static $instancia;

	public static function getInstance() {
		if (!self::$instancia instanceof self) {
			self::$instancia = new static();
		}
		return self::$instancia;
	}

    private $conn;
	private $dbDataConnection;
	private $inicializada = false;

	private function __construct() {}
	
	public function init($dbDataConnection) {
        if (!$this->inicializada) {
    	    $this->dbDataConnection = $dbDataConnection;
    		$this->inicializada = true;
        }
	}
	
	public function shutdown() {
	    $this->isInitialized();
	    if ($this->conn !== null && ! $this->conn->connect_errno) {
	        $this->conn->close();
	    }
	}

	private function isInitialized() {
	    if (! $this->inicializada) {
	        echo "Aplicacion no inicializada";
	        exit();
	    }
	}
	

	public function getDBConnection() {
	    $this->isInitialized();
		if (! $this->conn ) {
			$dbHost = $this->dbDataConnection['host'];
			$dbUser = $this->dbDataConnection['user'];
			$dbPass = $this->dbDataConnection['pass'];
			$db = $this->dbDataConnection['bd'];
			
			$conn = new mysqli($dbHost, $dbUser, $dbPass, $db);
			if ($conn->connect_errno) {
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