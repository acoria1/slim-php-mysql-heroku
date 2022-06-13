<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Empleado
 * 
 * @SuppressWarnings(PHPMD)
 */
class Empleado extends Model
{   
    use SoftDeletes;

    protected $primaryKey = 'id';
    protected $table = 'empleados';
    protected $keyType = 'int';
    public $incrementing = true;
    // public $timestamps = false;

    const CREATED_AT = 'fecha_alta';
    const DELETED_AT = 'fecha_baja';  
    const UPDATED_AT = 'fecha_modificacion';  

    protected $fillable = [
        'nombre', 'apellido','rol', 'dni','fecha_nacimiento','direccion'
    ];
}