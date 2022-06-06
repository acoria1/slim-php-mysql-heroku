<?php

/**
 * empleado
 * 
 * @SuppressWarnings(PHPMD)
 */
class Empleado
{
    public $id;
    public $nombre;
    public $apellido;
    public $rol;
    public $dni;
    public $email;
    public $fecha_nacimiento;
    public $direccion;


    function __construct($nombre, $apellido, $rol, $dni, $email, $fecha_nacimiento, $direccion)
    {
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->rol = $rol;
        $this->dni = $dni;
        $this->email = $email;
        $this->fecha_nacimiento = $fecha_nacimiento;
        $this->direccion = $direccion;
    }

    public function crearEmpleado()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta(
        "INSERT INTO empleados (nombre, apellido, rol, dni, email, fecha_nacimiento, direccion, activo) 
        VALUES (:nombre, :apellido, :rol, :dni, :email, :fecha_nacimiento, :direccion, 'Y')");
        $claveHash = password_hash($this->clave, PASSWORD_DEFAULT);
        $consulta->bindValue(':nombre', $this->nombre, PDO::PARAM_STR);
        $consulta->bindValue(':apellido', $this->apellido, PDO::PARAM_STR);
        $consulta->bindValue(':rol', $this->rol, PDO::PARAM_STR);
        $consulta->bindValue(':dni', $this->dni, PDO::PARAM_STR);
        $consulta->bindValue(':email', $this->email, PDO::PARAM_STR);
        $consulta->bindValue(':fecha_nacimiento', date_format($this->fecha_nacimiento, 'Y-m-d'));
        $consulta->bindValue(':direccion', $this->direccion, PDO::PARAM_STR);
        
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }

    public static function obtenerTodos()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, nombre, apellido, rol, dni, email, fecha_nacimiento, direccion, activo, fecha_de_alta, fecha_de_baja FROM empleados");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'empleado');
    }

    public static function obtenerEmpleado($idEmpleado)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, nombre, apellido, rol, dni, email, fecha_nacimiento, direccion, activo, fecha_de_alta, fecha_de_baja FROM empleados WHERE id = :id");
        $consulta->bindValue(':id', $idEmpleado, PDO::PARAM_INT);
        $consulta->execute();

        return $consulta->fetchObject('empleado');
    }

    public static function modificarEmpleado($empleado){
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE empleados SET id_empleado = :id_empleado WHERE empleado = :empleado");
        $consulta->bindValue(':id_empleado', $id_empleado, PDO::PARAM_INT);
        $consulta->bindValue(':empleado', $empleado, PDO::PARAM_STR);
        $consulta->execute();
    } 


    public static function darDeBajaEmpleado($idEmpleado)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE empleados SET activo = 'N', fecha_de_baja = :fecha_de_baja WHERE id = :id");
        $fecha = new DateTime(date("d-m-Y"));
        $consulta->bindValue(':id', $idEmpleado, PDO::PARAM_INT);
        $consulta->bindValue(':fecha_de_baja', date_format($fecha, 'Y-m-d H:i:s'));
        $consulta->execute();
    }

    public static function reactivarEmpleado($idEmpleado)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE empleados SET activo = 'Y' WHERE id = :id");
        $consulta->bindValue(':id', $idEmpleado, PDO::PARAM_INT);
        $consulta->execute();
    }
}