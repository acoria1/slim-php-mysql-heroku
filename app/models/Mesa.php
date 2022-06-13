<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Usuario
 * 
 * @SuppressWarnings(PHPMD)
 */
class Mesa extends Model
{   
    use SoftDeletes;

    protected $primaryKey = 'id';
    protected $table = 'mesas';
    protected $keyType = 'int';
    public $incrementing = true;
    // public $timestamps = false;

    const CREATED_AT = 'fecha_alta';
    const DELETED_AT = 'fecha_baja';  
    const UPDATED_AT = 'fecha_modificacion';  

    protected $fillable = [
        'codigo', 'estado'
    ];

    protected $attributes = [
        'estado' => 'cerrada'
    ];

    static function validarCodigo($codigo){
        return strlen($codigo) === 5 && ctype_alnum($codigo);
    }
    
    static function validarEstado($estado){
        return in_array($estado, ESTADOS_MESA);
    }
}