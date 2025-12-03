<?php

namespace App\Http\Controllers;

use App\Models\PrinterConfig;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class PrinterConfigController extends Controller
{
    /**
     * Obtener la configuración de impresora del usuario autenticado
     */
    public function getUserPrinterConfig(Request $request)
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Usuario no autenticado'
            ], 401);
        }

        $config = PrinterConfig::where('user_id', $user->id)
            ->where('company_id', $user->id_company)
            ->where('is_active', true)
            ->first();

        if (!$config) {
            // Si no existe configuración personal, usar la de la empresa como fallback
            $company = $user->company;
            
            return response()->json([
                'success' => true,
                'data' => [
                    'user_id' => $user->id,
                    'company_id' => $user->id_company,
                    'printer_name' => $company->imp_input ?? 'T21',
                    'printer_url' => 'http://localhost:3001',
                    'token' => $company->ngrok ?? null,
                    'is_active' => false,
                    'description' => 'Configuración de empresa (no personalizada)',
                    'is_default' => true
                ]
            ]);
        }

        return response()->json([
            'success' => true,
            'data' => [
                'id' => $config->id,
                'user_id' => $config->user_id,
                'company_id' => $config->company_id,
                'printer_name' => $config->printer_name,
                'printer_url' => $config->printer_url,
                'token' => $config->token,
                'is_active' => $config->is_active,
                'description' => $config->description,
                'is_default' => false
            ]
        ]);
    }

    /**
     * Crear o actualizar la configuración de impresora del usuario
     */
    public function saveUserPrinterConfig(Request $request)
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Usuario no autenticado'
            ], 401);
        }

        $validated = $request->validate([
            'printer_name' => 'required|string|max:255',
            'printer_url' => 'required|url|max:255',
            'token' => 'nullable|string|max:500',
            'description' => 'nullable|string|max:500',
            'is_active' => 'boolean',
        ]);

        // Buscar configuración existente
        $config = PrinterConfig::where('user_id', $user->id)
            ->where('company_id', $user->id_company)
            ->first();

        if ($config) {
            // Actualizar existente
            $config->update([
                'printer_name' => $validated['printer_name'],
                'printer_url' => $validated['printer_url'],
                'token' => $validated['token'] ?? $config->token,
                'description' => $validated['description'] ?? $config->description,
                'is_active' => $validated['is_active'] ?? true,
            ]);
        } else {
            // Crear nueva
            $config = PrinterConfig::create([
                'user_id' => $user->id,
                'company_id' => $user->id_company,
                'printer_name' => $validated['printer_name'],
                'printer_url' => $validated['printer_url'],
                'token' => $validated['token'] ?? null,
                'description' => $validated['description'] ?? null,
                'is_active' => $validated['is_active'] ?? true,
            ]);
        }

        return response()->json([
            'success' => true,
            'message' => 'Configuración de impresora guardada correctamente',
            'data' => [
                'id' => $config->id,
                'user_id' => $config->user_id,
                'company_id' => $config->company_id,
                'printer_name' => $config->printer_name,
                'printer_url' => $config->printer_url,
                'token' => $config->token,
                'is_active' => $config->is_active,
                'description' => $config->description,
            ]
        ]);
    }

    /**
     * Desactivar la configuración de impresora del usuario
     */
    public function deactivatePrinterConfig(Request $request)
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Usuario no autenticado'
            ], 401);
        }

        $config = PrinterConfig::where('user_id', $user->id)
            ->where('company_id', $user->id_company)
            ->first();

        if (!$config) {
            return response()->json([
                'success' => false,
                'message' => 'No se encontró configuración de impresora'
            ], 404);
        }

        $config->update(['is_active' => false]);

        return response()->json([
            'success' => true,
            'message' => 'Configuración de impresora desactivada'
        ]);
    }

    /**
     * Probar la conexión con la impresora configurada
     */
    public function testPrinterConnection(Request $request)
    {
        $user = Auth::user();
        
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Usuario no autenticado'
            ], 401);
        }

        $config = PrinterConfig::where('user_id', $user->id)
            ->where('company_id', $user->id_company)
            ->where('is_active', true)
            ->first();

        if (!$config) {
            return response()->json([
                'success' => false,
                'message' => 'No hay configuración de impresora activa'
            ], 404);
        }

        // Intentar conectar al servicio local
        try {
            $ch = curl_init($config->printer_url . '/status');
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);
            $response = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);

            if ($httpCode === 200) {
                return response()->json([
                    'success' => true,
                    'message' => 'Conexión exitosa con el servicio de impresión',
                    'printer_url' => $config->printer_url,
                    'printer_name' => $config->printer_name
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'No se pudo conectar con el servicio de impresión',
                    'http_code' => $httpCode
                ], 503);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al intentar conectar: ' . $e->getMessage()
            ], 500);
        }
    }
}
