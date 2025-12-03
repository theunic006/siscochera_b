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
        // Verificar si la columna no existe antes de agregarla
        if (!Schema::hasColumn('printer_configs', 'token')) {
            Schema::table('printer_configs', function (Blueprint $table) {
                $table->string('token')->nullable()->after('printer_url');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('printer_configs', 'token')) {
            Schema::table('printer_configs', function (Blueprint $table) {
                $table->dropColumn('token');
            });
        }
    }
};
