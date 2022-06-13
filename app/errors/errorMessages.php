<?php

function getClaveError(){
    return "la clave debe tener al menos 8 caracteres y debe contener: un número, una mayúscula, una minúscula, y un caracter especial";
}

function getDNIError(){
    return "El dni ingresado no cumple con el formato adecuado: numero de 8 caracteres";
}

function getCodigoError(){
    return "El código es inválido. Solo puede contener números y letras y debe tener 5 caracteres";
}

function getEstadoMesaError(){
    return "El estado de la mesa no es válido";
}
