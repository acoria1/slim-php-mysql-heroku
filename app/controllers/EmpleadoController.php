<?php
require_once './models/Empleado.php';
require_once './interfaces/IApiUsable.php';

/**
 * EmpleadoController
 * 
 * @SuppressWarnings(PHPMD)
 */
class EmpleadoController extends Empleado implements IApiUsable
{
    public function cargarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $nombre = $parametros['nombre'];
        $apellido = $parametros['apellido'];
        $rol = $parametros['rol'];
        $dni = $parametros['dni'];
        $email = $parametros['email'];
        $fecha_nacimiento = $parametros['fecha_nacimiento'];
        $direccion = $parametros['direccion'];

        // Creamos el empleado
        $nuevoEmpleado = new Empleado($nombre, $apellido, $rol, $dni, $email, $fecha_nacimiento, $direccion);

        $id = $nuevoEmpleado->crearEmpleado();

        $payload = json_encode(array("mensaje" => "Empleado creado con exito ${id}"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function traerUno($request, $response, $args)
    {
        // Buscamos empleado por nombre
        $id_empleado = $args['id_empleado'];
        $empleado = Empleado::obtenerEmpleado($id_empleado);
        $payload = json_encode($empleado);

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function traerTodos($request, $response, $args)
    {
        $lista = Empleado::obtenerTodos();
        $payload = json_encode(array("listaEmpleado" => $lista));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
    
    public function modificarUno($request, $response, $args)
    { 
        parse_str(file_get_contents("php://input"),$put_vars);
        
        $empleado = $put_vars['empleado'];
        $nuevaClave = $put_vars['nuevaClave'];
        $perfil = $put_vars['perfil'];
        $id_empleado = $put_vars['id_empleado'];

        //Empleado::modificarEmpleado();

        $payload = json_encode(array("mensaje" => "Empleado modificado con exito"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function borrarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $id_empleado = $parametros['id_empleado'];
        Empleado::darDeBajaEmpleado($id_empleado);

        $payload = json_encode(array("mensaje" => "Empleado dado de baja con exito"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function reactivarUno($request, $response, $args){
      $parametros = $request->getParsedBody();

        $id_empleado = $parametros['id_empleado'];
        Empleado::reactivarEmpleado($id_empleado);

        $payload = json_encode(array("mensaje" => "Empleado reactivado con exito"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
}
