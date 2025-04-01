<?php

namespace tfg\src;

class FormularioElegirRuta extends Formulario {
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
            <legend>Calcula tu trayecto</legend>

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

            <div class="opciones-extra">
                <h3>Opciones Extra</h3>
                <input type="checkbox" id="trasbordo" name="trasbordo" value="trasbordo">
                <label for="Trasbordo">Trasbordo</label>
                <input type="checkbox" id="movReducida" name="movReducida" value="movReducida">
                <label for="movReducida">Movilidad Reducida</label>
            </div>

            <button type="submit">Buscar</button>
        </fieldset>
        </form>
        EOF;
        return $html;
    }
}