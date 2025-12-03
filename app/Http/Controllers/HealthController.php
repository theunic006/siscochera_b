<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cache;
use Throwable;

class HealthController extends Controller
{
    public function app()
    {
        return response()->json([
            'status' => 'ok',
            'app' => [
                'name' => config('app.name'),
                'env' => config('app.env'),
                'debug' => (bool) config('app.debug'),
                'url' => config('app.url'),
                'timezone' => config('app.timezone'),
            ],
            'cache' => [
                'store' => config('cache.default'),
            ],
            'time' => now()->toIso8601String(),
        ], 200);
    }

    public function db()
    {
        $default = Config::get('database.default');
        $connectionName = $default ?: 'mysql';
        $connected = false;
        $version = null;
        $database = null;
        $error = null;

        try {
            $conn = DB::connection($connectionName);
            $pdo = $conn->getPdo();
            $connected = true;
            $version = $pdo->getAttribute(\PDO::ATTR_SERVER_VERSION);
            $database = $conn->getDatabaseName();
            // simple query to ensure it's responsive
            $conn->select('SELECT 1');
        } catch (Throwable $e) {
            $error = $e->getMessage();
        }

        $status = $connected ? 200 : 500;
        return response()->json([
            'database' => [
                'default_connection' => $connectionName,
                'database' => $database,
                'connected' => $connected,
                'server_version' => $version,
                'host' => Config::get("database.connections.$connectionName.host"),
                'port' => Config::get("database.connections.$connectionName.port"),
                'driver' => Config::get("database.connections.$connectionName.driver"),
                'error' => $error,
            ],
            'time' => now()->toIso8601String(),
        ], $status);
    }
}
