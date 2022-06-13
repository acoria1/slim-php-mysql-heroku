<?php
require_once './models/Usuario.php';
require_once './interfaces/IApiUsable.php';
require_once './functions/validateKeys.php';
require_once './functions/validateValues.php';
require_once './exceptions/perfilInvalidoException.php';
require_once './exceptions/claveInvalidaException.php';
require_once './errors/errorMessages.php';
require_once './interfaces/IApiSoftUsable.php';


use \App\Models\Usuario as Usuario;

/**
 * UsuarioController
 * 
 * @SuppressWarnings(PHPMD)
 */
class UsuarioController implements IApiUsable, IApiSoftUsable
{
    public function cargarUno($request, $response, $args)
    {
      $parametros = $request->getParsedBody();

        if(array_keys_exist(['usuario','clave','email','perfil'],$parametros)){

          $usuario = $parametros['usuario'];
          
          $usuarioExistente = Usuario::withTrashed()->firstWhere('usuario',$usuario);

          //si no existe:
          if(!isset($usuarioExistente)){

            $clave = $parametros['clave'];
            $email = $parametros['email'];
            $perfil = $parametros['perfil'];

            if (validarClave($clave) && validarPerfil($perfil)){
              // Creamos el usuario
              $usr = new Usuario();
              $usr->usuario = $usuario;
              $usr->clave = password_hash($parametros['clave'], PASSWORD_DEFAULT);
              $usr->email = $email;
              $usr->perfil = $perfil;

              if(isset($parametros['id_empleado'])){
                $usr->id_empleado = $parametros['id_empleado'];
              }           
              
              $usr->save();

              $payload = json_encode(array("mensaje" => "Usuario creado con exito", "id de usuario" => $usr->id));

            } else {
              $payload = json_encode(array("mensaje" => "Clave o perfil inválidos"));   
            }    

          } else  {
            $payload = json_encode(array("mensaje" => "El Usuario ya existe"));            
          }
        } else {
          $payload = json_encode(array("mensaje" => "Parámetros inválidos"));
        }

      $response->getBody()->write($payload);
      return $response
        ->withHeader('Content-Type', 'application/json');
    }

    public function traerUno($request, $response, $args)
    {
        // Buscamos usuario por nombre
        $usuario = $args['usuario'];
        $usr = Usuario::firstWhere('usuario',$usuario);

        if(isset($usr)){
          $payload = json_encode($usr);
        } else {
          $payload = json_encode(array("mensaje" => "El usuario no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function traerTodos($request, $response, $args)
    {
        $lista = Usuario::all();

        $payload = json_encode(array("listaUsuarios" => $lista));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
    
    public function modificarUno($request, $response, $args)
    { 
      $parametros = $request->getParsedBody();

      $usuarioId = $parametros['id'];

      // Conseguimos el objeto
      $usr = Usuario::firstWhere('id',$usuarioId);
  
      // Si existe
      if (isset($usr)) {
        $parametrosPermitidos = array('clave', 'perfil', 'id_empleado', 'email');

        // si la clave es inválida tendremos una exepción y no modificaremos el usuario.
        try {        
        //por cada parámetro recibido
          foreach ($parametros as $key => $value) {

            // si el parámetro es uno de los permitidos, modificamos su valor.
            if(in_array($key,$parametrosPermitidos)){

              //si es un cambio de clave, validaremos la clave
              switch ($key) {
                case 'clave':
                  //validar clave
                  if (!validarClave($value)){
                    throw new claveInvalidaException(getClaveError());
                  }
                  // si la clave es válida, la modificamos
                  $usr->clave = password_hash($value, PASSWORD_DEFAULT);
                  break;
                case 'perfil':
                  // validar perfil
                  if(validarPerfil($value)){
                    $usr->perfil = $value;
                  } else {
                    throw new perfilInvalidoException("perfil inválido");
                  }
                  break;
                default:
                  $usr[$key] = $value;
                  break;
              }
            }            
          }
          $usr->save();
          $payload = json_encode(array("mensaje" => "Usuario modificado con exito"));
        } catch (Exception $ex) {
          // si la clave o el perfil no son válidos, cancelar modificación.
          $payload = json_encode(array("mensaje" => $ex->__toString()));
        }
      } else {
        //El usuario no existe
        $payload = json_encode(array("mensaje" => "Usuario no encontrado"));
      }
  
      $response->getBody()->write($payload);
      return $response
        ->withHeader('Content-Type', 'application/json');
    }

    public function desactivarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $id = $parametros['id'];

        $usr = Usuario::withTrashed()->firstWhere('id',$id);

        if(isset($usr)){

          if(!$usr->trashed()){
            $usr->delete();
            $payload = json_encode(array("mensaje" => "Usuario desactivado con exito"));
          } else {
            $payload = json_encode(array("mensaje" => "El usuario ya está desactivado"));
          }

        } else {
          $payload = json_encode(array("mensaje" => "El usuario no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function reactivarUno($request, $response, $args){
      $parametros = $request->getParsedBody();

        $id = $parametros['id'];
        
        $trashedUsr = Usuario::onlyTrashed()->firstWhere('id',$id);

        if(isset($trashedUsr)){

          $trashedUsr->restore();
          $payload = json_encode(array("mensaje" => "Usuario reactivado con exito"));

        } else if (Usuario::find($id) != null){

          $payload = json_encode(array("mensaje" => "El usuario ya se encuentra activo"));

        } else {

          $payload = json_encode(array("mensaje" => "El usuario no existe"));

        }
        
        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function borrarUno($request, $response, $args){
        $parametros = $request->getParsedBody();

        $id = $parametros['id'];

        $usr = Usuario::withTrashed()->firstWhere('id',$id);

        if(isset($usr)){          
          $usr->forceDelete();
          $payload = json_encode(array("mensaje" => "Usuario dado de baja con exito"));
        } else {
          $payload = json_encode(array("mensaje" => "El usuario no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    //hechos con fines didácticos
    public function CargarCualquierCosa($request, $response,  $args){
      //
      $response->getBody()->write(json_encode(array("message" => "Hola, no hice nada ññññ :)"),JSON_UNESCAPED_UNICODE));
      //
      return $response->withHeader('Content-Type', 'application/json');
    }
}
