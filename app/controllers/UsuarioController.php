<?php
require_once './models/Usuario.php';
require_once './interfaces/IApiUsable.php';

/**
 * UsuarioController
 * 
 * @SuppressWarnings(PHPMD)
 */
class UsuarioController extends Usuario implements IApiUsable
{
    public function cargarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $usuario = $parametros['usuario'];
        $clave = $parametros['clave'];
        $perfil = $parametros['perfil'];
        $id_empleado = $parametros['id_empleado'];

        // Creamos el usuario
        $usr = new Usuario($usuario, $clave, $perfil, $id_empleado);
        
        $id = $usr->crearUsuario();

        $payload = json_encode(array("mensaje" => "Usuario creado con exito ${id}"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function traerUno($request, $response, $args)
    {
        // Buscamos usuario por nombre
        $usr = $args['usuario'];
        $usuario = Usuario::obtenerUsuario($usr);
        $payload = json_encode($usuario);

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function traerTodos($request, $response, $args)
    {
        $lista = Usuario::obtenerTodos();
        $payload = json_encode(array("listaUsuario" => $lista));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
    
    public function modificarUno($request, $response, $args)
    { 
        parse_str(file_get_contents("php://input"),$put_vars);
        
        $usuario = $put_vars['usuario'];
        $nuevaClave = $put_vars['nuevaClave'];
        $perfil = $put_vars['perfil'];
        $id_empleado = $put_vars['id_empleado'];

        Usuario::modificarPerfil($usuario, $perfil);
        Usuario::modificarClave($usuario, $nuevaClave);
        Usuario::modificarIdEmpleado($usuario, $id_empleado);

        $payload = json_encode(array("mensaje" => "Usuario modificado con exito"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function borrarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $usuario = $parametros['usuario'];
        Usuario::darDeBajaUsuario($usuario);

        $payload = json_encode(array("mensaje" => "Usuario dado de baja con exito"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function reactivarUno($request, $response, $args){
      $parametros = $request->getParsedBody();

        $usuario = $parametros['usuario'];
        Usuario::reactivarUsuario($usuario);

        $payload = json_encode(array("mensaje" => "Usuario reactivado con exito"));

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
