<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('printer_configs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('company_id')->constrained('companies')->onDelete('cascade');
            $table->string('printer_name'); // Nombre de la impresora (ej: "T21", "EPSON TM-T20")
            $table->string('printer_url')->default('http://localhost:3001'); // URL del servicio local
            $table->string('token')->nullable(); // Token para ngrok o autenticación
            $table->boolean('is_active')->default(true); // Si esta configuración está activa
            $table->text('description')->nullable(); // Descripción opcional
            $table->timestamps();

            // Índices para búsquedas rápidas
            $table->index(['user_id', 'company_id']);
            $table->unique(['user_id', 'company_id', 'printer_name'], 'unique_user_company_printer');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('printer_configs');
    }
};
