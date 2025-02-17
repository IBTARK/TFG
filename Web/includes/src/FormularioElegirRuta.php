<?php

namespace tfg\src;

class FormularioElegirRuta {
    public function __construct(){
        parent::__construct('formelegirruta', ['urlRedireccion' => 'rutasRecomendadas.php', 'enctype' => 'multipart/form-data']);        	
    }

    protected function generaCamposFormulario(&$datos){
        $origen = $datos['origen'] ?? '';
        $destino = $datos['destino'] ?? '';

        $htmlErroresGlobales = self::generaListaErroresGlobales($this->errores);
        $erroresCampos = self::generaErroresCampos(['origen', 'destino'],
                                                    $this->errores, 'span', array('class' => 'error'));

        $html = <<<EOF
        $htmlErroresGlobales
        <form action="procesar_formulario.php" method="POST">
        <fieldset>
            <legend>Seleccione su viaje</legend>

            <label for="origen">Origen:</label>
            <select id="origen" name="origen">
                <option value="">Seleccione Estación</option>
                <option value="aeropuerto-t4">Aeropuerto-T4</option>
            </select>

            <label for="destino">Destino:</label>
            <select id="destino" name="destino">
                <option value="">Seleccione Estación</option>
                <option value="aeropuerto-t4">Aeropuerto-T4</option>
            </select>

            <button type="submit">Buscar</button>
        </fieldset>
        </form>
        EOF;
        return $html;
    }
}