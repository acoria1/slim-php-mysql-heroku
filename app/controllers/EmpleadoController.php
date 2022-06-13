<?php
require_once './models/Empleado.php';
require_once './interfaces/IApiUsable.php';
require_once './interfaces/IApiSoftUsable.php';
require_once './functions/validateKeys.php';
require_once './functions/validateValues.php';
require_once './errors/errorMessages.php';


use \App\Models\Empleado as Empleado;

/**
 * EmpleadoController
 * 
 * @SuppressWarnings(PHPMD)
 */
class EmpleadoController implements IApiUsable, IApiSoftUsable
{
    public function cargarUno($request, $response, $args)
    {
      $parametros = $request->getParsedBody();

        if(array_keys_exist(['nombre','apellido','rol','email', 'dni','fecha_nacimiento','direccion'],$parametros)){

          $dni = $parametros['dni'];
          
          if(validarDNI($dni)){

            $empleadoExistente = Empleado::withTrashed()->firstWhere('dni',$dni);

            //si no existe:
            if(!isset($empleadoExistente)){
            
              // Creamos el empleado
              $emp = new Empleado();
              $emp->dni = $dni;
              $emp->nombre = $parametros['nombre'];
              $emp->apellido = $parametros['apellido'];
              $emp->rol = $parametros['rol'];
              $emp->email = $parametros['email'];
              $emp->fecha_nacimiento = $parametros['fecha_nacimiento'];
              $emp->direccion = $parametros['direccion'];
              
              $emp->save();

              $payload = json_encode(array("mensaje" => "Empleado creado con exito", "id de empleado" => $emp->id));

            } else  {
              $payload = json_encode(array("mensaje" => "El Empleado ya existe"));            
            }
          } else {
            $payload = json_encode(array("mensaje" => getDNIError()));
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
        // Buscamos empleado por nombre
        $dni = $args['dni'];
        $emp = Empleado::firstWhere('dni',$dni);

        if(isset($emp)){
          $payload = json_encode($emp);
        } else {
          $payload = json_encode(array("mensaje" => "El empleado no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function traerTodos($request, $response, $args)
    {
        $lista = Empleado::all();

        $payload = json_encode(array("listaEmpleados" => $lista));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
    
    public function modificarUno($request, $response, $args)
    { 
      $parametros = $request->getParsedBody();

      $empleadoId = $parametros['id'];

      // Conseguimos el objeto
      $emp = Empleado::firstWhere('id',$empleadoId);

      // Si existe
      if (isset($emp)) {

        //si no vino dni, o vino y está bien, hacemos la modificacion
        if(!(key_exists('dni',$parametros) && !validarDNI($parametros['dni']))){

          $parametrosPermitidos = array('nombre','apellido','rol','dni','fecha_nacimiento','direccion');

          //por cada parámetro recibido
          foreach ($parametros as $key => $value) {
            // si el parámetro es uno de los permitidos, modificamos su valor.
            if(in_array($key,$parametrosPermitidos)){
              $emp[$key] = $value;
            }
          }
          try {
            $emp->save();
            $payload = json_encode(array("mensaje" => "Empleado modificado con exito"));
          } catch (Exception){
            $payload = json_encode(array("mensaje" => "Ya existe un empleado en la base de datos con ese DNI"));
          }       
        } else {
          //El DNI recibido no es válido
          $payload = json_encode(array("mensaje" => getDNIError()));
        }
      }
      else {
        //El usuario no existe
        $payload = json_encode(array("mensaje" => "Empleado no encontrado"));
      }      
  
      $response->getBody()->write($payload);
      return $response
        ->withHeader('Content-Type', 'application/json');
    }

    public function desactivarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $id = $parametros['id'];

        $emp = Empleado::withTrashed()->firstWhere('id',$id);

        if(isset($emp)){

          if(!$emp->trashed()){
            $emp->delete();
            $payload = json_encode(array("mensaje" => "Empleado desactivado con exito"));
          } else {
            $payload = json_encode(array("mensaje" => "El empleado ya está desactivado"));
          }

        } else {
          $payload = json_encode(array("mensaje" => "El empleado no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function reactivarUno($request, $response, $args){
      $parametros = $request->getParsedBody();

        $id = $parametros['id'];
        
        $trashedEmp = Empleado::onlyTrashed()->firstWhere('id',$id);

        if(isset($trashedEmp)){

          $trashedEmp->restore();
          $payload = json_encode(array("mensaje" => "Empleado reactivado con exito"));

        } else if (Empleado::find($id) != null){

          $payload = json_encode(array("mensaje" => "El empleado ya se encuentra activo"));

        } else {

          $payload = json_encode(array("mensaje" => "El empleado no existe"));

        }
        
        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function borrarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $id = $parametros['id'];

        $emp = Empleado::withTrashed()->firstWhere('id',$id);

        if(isset($emp)){
            $emp->forceDelete();
            $payload = json_encode(array("mensaje" => "Empleado dado de baja con exito"));
        } else {
          $payload = json_encode(array("mensaje" => "El empleado no existe"));
        }

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

}
