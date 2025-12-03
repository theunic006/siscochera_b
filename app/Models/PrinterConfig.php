<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrinterConfig extends Model
{
    use HasFactory;

    protected $table = 'printer_configs';

    protected $fillable = [
        'user_id',
        'company_id',
        'printer_name',
        'printer_url',
        'token',
        'is_active',
        'description',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Relación con el usuario
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Relación con la empresa
     */
    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    /**
     * Scope para obtener solo configuraciones activas
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope para buscar por usuario y empresa
     */
    public function scopeForUserAndCompany($query, $userId, $companyId)
    {
        return $query->where('user_id', $userId)
                     ->where('company_id', $companyId);
    }
}
