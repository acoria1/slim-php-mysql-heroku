<?php

function array_keys_exist($keys,$array){
    //
    $result = true;
    
    if(is_array($keys) && is_array($array)){
        foreach ($keys as $value) {
            if (!array_key_exists($value,$array)){
                $result = false;
                break;
            }
        }
    } else {
        $result = false;
    }
    //
    return $result;
}

