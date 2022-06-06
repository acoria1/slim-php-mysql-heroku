<?php

/**
 * Usuario
 * 
 * @SuppressWarnings(PHPMD)
 */
class Usuario
{
    public $id;
    public $usuario;
    public $clave;
    public $perfil;
    public $id_empleado;
    public $activo;
    public $fecha_de_alta;
    public $fecha_de_baja;

    function __construct($usuario, $clave, $perfil, $id_empleado = "")
    {
        $this->usuario = $usuario;
        $this->clave = $clave;
        $this->perfil = $perfil;
        $this->id_empleado = $id_empleado;
    }

    public function crearUsuario()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta(
        "INSERT INTO usuarios (usuario, clave, perfil, id_empleado) 
        VALUES (:usuario, :clave, :perfil, :id_empleado)");
        $claveHash = password_hash($this->clave, PASSWORD_DEFAULT);
        $consulta->bindValue(':usuario', $this->usuario, PDO::PARAM_STR);
        $consulta->bindValue(':clave', $claveHash);
        $consulta->bindValue(':perfil', $this->perfil, PDO::PARAM_STR);
        $consulta->bindValue(':id_empleado', $this->id_empleado, PDO::PARAM_INT);
        
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }

    public static function obtenerTodos()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, usuario, clave, perfil, id_empleado, activo, fecha_de_alta, fecha_de_baja FROM usuarios");
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'Usuario');
    }

    public static function obtenerUsuario($usuario)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT id, usuario, clave, perfil, id_empleado, activo, fecha_de_alta, fecha_de_baja FROM usuarios WHERE usuario = :usuario");
        $consulta->bindValue(':usuario', $usuario, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('Usuario');
    }

    public static function modificarPerfil($usuario, $perfil)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE usuarios SET perfil = :perfil WHERE usuario = :usuario");
        $consulta->bindValue(':perfil', $perfil, PDO::PARAM_STR);
        $consulta->bindValue(':usuario', $usuario, PDO::PARAM_STR);
        $consulta->execute();
    }


    public static function modificarClave($usuario, $clave){
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE usuarios SET clave = :clave WHERE usuario = :usuario");
        $claveHash = password_hash($clave, PASSWORD_DEFAULT);
        $consulta->bindValue(':clave', $claveHash, PDO::PARAM_STR);
        $consulta->bindValue(':usuario', $usuario, PDO::PARAM_STR);
        $consulta->execute();
    }

    public static function modificarIdEmpleado($usuario, $id_empleado){
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE usuarios SET id_empleado = :id_empleado WHERE usuario = :usuario");
        $consulta->bindValue(':id_empleado', $id_empleado, PDO::PARAM_INT);
        $consulta->bindValue(':usuario', $usuario, PDO::PARAM_STR);
        $consulta->execute();
    }


    public static function darDeBajaUsuario($usuario)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE usuarios SET activo = 'N', fecha_de_baja = :fecha_de_baja WHERE usuario = :usuario");
        $fecha = new DateTime(date("d-m-Y"));
        $consulta->bindValue(':usuario', $usuario, PDO::PARAM_STR);
        $consulta->bindValue(':fecha_de_baja', date_format($fecha, 'Y-m-d H:i:s'));
        $consulta->execute();
    }

    public static function reactivarUsuario($usuario)
    {
        $objAccesoDato = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDato->prepararConsulta("UPDATE usuarios SET activo = 'Y' WHERE usuario = :usuario");
        $consulta->bindValue(':usuario', $usuario, PDO::PARAM_STR);
        $consulta->execute();
    }
}