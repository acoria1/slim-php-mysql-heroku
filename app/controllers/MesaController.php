<?php
require_once './models/Mesa.php';
require_once './interfaces/IApiUsable.php';
require_once './functions/validateKeys.php';
require_once './functions/validateValues.php';
require_once './errors/errorMessages.php';
require_once './exceptions/estadoMesaException.php';
require_once './exceptions/codigoMesaException.php';



use \App\Models\Mesa as Mesa;

/**
 * MesaController
 * 
 * @SuppressWarnings(PHPMD)
 */
class MesaController implements IApiUsable
{
    public function cargarUno($request, $response, $args)
    {
      $parametros = $request->getParsedBody();

        if(key_exists('codigo',$parametros)){

          $codigo = $parametros['codigo'];
          
          $mesaExistente = Mesa::firstWhere('codigo',$codigo);

          //si no existe:
          if(!isset($mesaExistente)){

            // Creamos la mesa
            $mesa = new Mesa();

            if(Mesa::validarCodigo($codigo)){
                $mesa->codigo = $codigo;
                if(key_exists('estado', $parametros)){
                    $mesa->estado = $parametros['estado'];
                }

                $mesa->save();

                $payload = json_encode(array("mensaje" => "Mesa creada con exito", "ID" => $mesa->id)); 
            } else {
                $payload = json_encode(array("mensaje" => getCodigoError()));  
            }
          } else  {
            $payload = json_encode(array("mensaje" => "La Mesa ya existe"));            
          }
        } else {
          $payload = json_encode(array("mensaje" => "No se recibió código de identificacion"));
        }

      $response->getBody()->write($payload);
      return $response
        ->withHeader('Content-Type', 'application/json');
    }

    public function traerUno($request, $response, $args)
    {
        // Buscamos mesa por codigo
        $codigo = $args['codigo'];
        $mesa = Mesa::firstWhere('codigo',$codigo);

        if(isset($mesa)){
          $payload = json_encode($mesa);
        } else {
          $payload = json_encode(array("mensaje" => "La Mesa no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function traerTodos($request, $response, $args)
    {
        $lista = Mesa::all();

        $payload = json_encode(array("listaMesas" => $lista));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
    
    public function modificarUno($request, $response, $args)
    { 
      $parametros = $request->getParsedBody();

      $mesaId = $parametros['id'];

      // Conseguimos el objeto
      $mesa = Mesa::firstWhere('id',$mesaId);
  
      // Si existe
      if (isset($mesa)) {

        try {
            if(key_exists('codigo', $parametros)){
                if(Mesa::validarCodigo($parametros['codigo'])){
                    $mesa->codigo = $parametros['codigo'];
                } else {
                    throw new codigoMesaException(getCodigoError());
                }
            }
    
            if(key_exists('estado', $parametros)){
                if(Mesa::validarEstado($parametros['estado'])){
                    $mesa->estado = $parametros['estado'];
                } else {
                    throw new estadoMesaException(getEstadoMesaError());
                }
            }

            $mesa->save();
            $payload = json_encode(array("mensaje" => "Mesa modificada con exito"));

        } 
        catch (Exception $ex) {
            $payload = json_encode(array("mensaje" => $ex->getMessage()));
        }
      } else {
        //La Mesa no existe
        $payload = json_encode(array("mensaje" => "Mesa no encontrada"));
      }
  
      $response->getBody()->write($payload);
      return $response
        ->withHeader('Content-Type', 'application/json');
    }

    public function borrarUno($request, $response, $args){
        $parametros = $request->getParsedBody();

        $id = $parametros['id'];

        $mesa = Mesa::firstWhere('id',$id);

        if(isset($mesa)){          
          $mesa->delete();
          $payload = json_encode(array("mensaje" => "Mesa dada de baja con exito"));
        } else {
          $payload = json_encode(array("mensaje" => "La Mesa no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

}
