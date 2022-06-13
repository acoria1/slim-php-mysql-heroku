<?php

class perfilInvalidoException extends Exception
{
    // Redefinición del constructor
    public function __construct($message = null, $code = 0, Exception $previous = null) {

        parent::__construct($message, $code, $previous);

    }

    // representación de cadena personalizada del objeto
    public function __toString() {
        return __CLASS__ . ": [{$this->code}]: {$this->message}\n";
    }

}