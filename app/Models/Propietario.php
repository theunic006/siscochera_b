<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Propietario extends Model
{
    use HasFactory;
    protected $table = 'propietarios';

    protected $fillable = [
        'idvehiculo',
        'nombres',
        'apellidos',
        'telefono',
        'email',
        'tipo_documento',
        'documento',
        'razon_social',
        'direccion',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Relación: Un propietario pertenece a un vehículo
     */
    public function vehiculo()
    {
        return $this->belongsTo(Vehiculo::class, 'idvehiculo', 'id');
    }

}
