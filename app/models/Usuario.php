<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Usuario
 * 
 * @SuppressWarnings(PHPMD)
 */
class Usuario extends Model
{   
    use SoftDeletes;

    protected $primaryKey = 'id';
    protected $table = 'usuarios';
    protected $keyType = 'int';
    public $incrementing = true;
    // public $timestamps = false;

    const CREATED_AT = 'fecha_alta';
    const DELETED_AT = 'fecha_baja';  
    const UPDATED_AT = 'fecha_modificacion';  

    protected $fillable = [
        'usuario', 'clave','email', 'perfil','id_empleado'
    ];
}