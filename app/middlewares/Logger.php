<?php

use GuzzleHttp\Psr7\Response;

class Logger
{
    public static function LogOperacion($request, $handler)
    {
        $requestType = $request->getMethod();
        $response = $handler->handle($request);
        $response->getBody()->write('la operacion fue hecha por: ' . $requestType);
        return $response;
    }

    //Ejercitación en clase:
    //
    public static function VerificarCredenciales($request, $handler)
    {
        $requestType = $request->getMethod();
        //$response = $handler->handle($request);
        $response = new Response();

        switch ($requestType) {
            case 'GET':
                $response->getBody()->write('la operacion fue hecha por: ' . $requestType . 'no se verificaron credenciales');
                break;
            case 'POST':
                $responseMessage = 'la operacion fue hecha por: ' . $requestType . ". ";
                $parsedData = $request->getParsedBody();
                $nombre = $parsedData['name'];
                $perfil = $parsedData['profile'];

                if ($perfil === 'admin'){
                    $responseMessage .= "Bienvenido" . $nombre . " !!";
                    $response = $handler->handle($request);
                }else {
                    $responseMessage .= "usuario no autorizado";
                }
                $responseMessage = json_encode(array("message" => $responseMessage),JSON_UNESCAPED_UNICODE);
                $response->getBody()->write($responseMessage);
            default:
                # code...
                break;
        }
        
        return $response->withHeader('Content-Type', 'application/json');
    }

    public static function VerificarCredencialesJSON($request, $handler)
    {
        $requestType = $request->getMethod();
        $response = $handler->handle($request);

        switch ($requestType) {
            case 'GET':
                $status = 200;
                $response->getBody()->write(json_encode(array("message" => "API => $requestType", "status" => $status),JSON_UNESCAPED_UNICODE));   
                break;
            case 'POST':                
                $parsedData = $request->getParsedBody();
                $nombre = json_decode($parsedData['obj_json'])->nombre;
                $perfil = json_decode($parsedData['obj_json'])->perfil;
                //
                if ($perfil === 'admin'){
                    $responseMessage = 'la operacion fue hecha por: ' . $requestType . ". ";
                    $responseMessage .= "API => $requestType";
                    $status = 200;
                }else {
                    $responseMessage = "Error. $nombre no tiene permisos de administrador";
                    $status = 403;
                }
                $responseMessageJson = json_encode(array("message" => $responseMessage),JSON_UNESCAPED_UNICODE);
                $response->getBody()->write($responseMessageJson);
            default:
                # code...
                break;
        }
        return $response->withHeader('Content-Type', 'application/json')->withStatus($status);
    }
}