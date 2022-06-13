
<?php
const PERFILES_VALIDOS = ['admin','socio','mozo','bartender','cervecero','cocinero'];


require_once './exceptions/claveInvalidaException.php';
require_once './globals.php';


function validarClave($clave){

    $number = preg_match('@[0-9]@', $clave);
    $uppercase = preg_match('@[A-Z]@', $clave);
    $lowercase = preg_match('@[a-z]@', $clave);
    $specialChars = preg_match('@[^\w]@', $clave);
    
    return (strlen($clave) >= 8 && $number && $uppercase && $lowercase && $specialChars);
}

function validarPerfil($perfil){
    return in_array($perfil, PERFILES);
}

function validarDNI($dni){
    return is_numeric($dni) && strlen($dni) == 8;
}

?>