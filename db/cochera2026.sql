-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2025 a las 23:16:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cochera2026`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `numero_documento` varchar(45) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefono` varchar(11) DEFAULT NULL,
  `estado` enum('activo','suspendido','inactivo','pendiente') NOT NULL DEFAULT 'activo' COMMENT 'Estado de la company: activo, suspendido, inactivo, pendiente',
  `capacidad` int(11) DEFAULT NULL,
  `ngrok` text DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `imp_input` varchar(45) DEFAULT NULL,
  `imp_output` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `nombre`, `ubicacion`, `logo`, `descripcion`, `email`, `telefono`, `estado`, `capacidad`, `ngrok`, `ruc`, `token`, `imp_input`, `imp_output`, `created_at`, `updated_at`) VALUES
(4, 'MEDINA CONGORA MAYRA SANDY', 'Mercado de colores 102', 'companies/garage.png', 'ninguno', 'cochera@gmail.com', '32164987', 'activo', 95, 'https://semisynthetic-monophonic-bryce.ngrok-free.dev/servlocal/api/ingresos/', '10426503293', '344.wUlqHz28sGiuYodfeqnnSsU7HX45wtLEUMi2IVQvyMa5GUpbc2THOu9zTSb8wJdYgTWybPmLMh7TwoMQeKbljfNKWgvdKUMUObQUFwtGcQ4tGO2Ns5t1fH27', 'T20', 'T20', '2025-10-02 00:00:00', '2025-11-01 17:18:02'),
(33, 'cochera lima', 'lima', 'companies/caic3kEhftB1SxQrYpPjgj16IHByrwfjMXa1WJ57.png', 'ninguno', NULL, NULL, 'pendiente', 20, NULL, NULL, NULL, NULL, NULL, '2025-11-06 17:57:48', '2025-11-06 17:57:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `hora_ingreso` time NOT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `id_vehiculo` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `fecha_ingreso`, `hora_ingreso`, `id_user`, `id_empresa`, `id_vehiculo`, `created_at`, `updated_at`) VALUES
(188, '2025-11-02', '23:38:39', 1, 4, 47, '2025-11-03 04:38:39', '2025-11-03 04:38:39'),
(190, '2025-11-03', '00:37:04', 1, 4, 53, '2025-11-03 05:37:04', '2025-11-03 05:37:04'),
(191, '2025-11-03', '00:47:26', 5, 4, 54, '2025-11-03 05:47:26', '2025-11-03 05:47:26'),
(192, '2025-11-03', '00:47:34', 5, 4, 55, '2025-11-03 05:47:34', '2025-11-03 05:47:34'),
(193, '2025-11-03', '00:49:11', 5, 4, 56, '2025-11-03 05:49:11', '2025-11-03 05:49:11'),
(195, '2025-11-03', '05:23:24', 5, 4, 58, '2025-11-03 10:23:24', '2025-11-03 10:23:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_24_154249_create_suscribers_table', 1),
(5, '2025_09_24_155230_create_personal_access_tokens_table', 1),
(6, '2025_09_25_160721_create_empresas_table', 1),
(7, '2025_09_25_162144_add_columns_to_empresas_table', 1),
(8, '2025_09_25_162350_rename_empresas_table_to_companies', 1),
(9, '2025_09_25_164918_create_roles_table', 1),
(10, '2025_09_25_170325_add_missing_columns_to_users_table', 1),
(11, '2025_09_25_175206_add_estado_column_to_companies_table', 1),
(12, '2025_09_25_175210_add_estado_column_to_companies_table', 1),
(13, '2025_09_25_183354_add_estado_column_to_roles_table', 1),
(14, '2025_09_25_211717_create_tipo_vehiculos_table', 1),
(15, '2025_09_25_212450_add_nombre_valor_columns_to_tipo_vehiculos_table', 1),
(16, '2025_09_25_212519_add_unique_index_to_nombre_in_tipo_vehiculos', 1),
(17, '2025_09_25_213239_create_propietarios_table', 1),
(18, '2025_09_25_213258_create_vehiculos_table', 1),
(19, '2025_09_25_214101_add_columns_to_propietarios_table', 1),
(20, '2025_09_25_214105_fix_vehiculos_table', 1),
(21, '2025_09_25_214651_create_vehiculo_propietario_table', 1),
(22, '2025_09_25_214655_create_tolerancia_table', 1),
(23, '2025_09_26_002043_remove_tipo_vehiculo_relationship_from_tolerancia_table', 1),
(24, '2025_09_27_190000_create_registros_table', 1),
(25, '2025_09_27_200000_create_ingresos_table', 1),
(26, '2025_10_01_000000_create_observaciones_table', 1),
(27, '2025_10_01_000000_create_salidas_table', 1),
(28, '2025_10_04_uniq_tolerancia_descripcion_empresa', 2),
(29, '2025_10_04_make_tolerancia_notnull', 3),
(30, '2025_10_04_force_uniq_tolerancia_descripcion_empresa', 4),
(31, '2025_10_04_uniq_tipo_vehiculos_nombre_empresa', 5),
(32, '2025_10_22_015204_create_permissions_table', 6),
(33, '2025_10_22_015229_create_user_permissions_table', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observaciones`
--

CREATE TABLE `observaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `id_vehiculo` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `observaciones`
--

INSERT INTO `observaciones` (`id`, `tipo`, `descripcion`, `id_vehiculo`, `id_usuario`, `id_empresa`, `created_at`, `updated_at`) VALUES
(19, 'Ninguno', 'se fue sin pagar nada x2', 45, 1, 4, '2025-10-13 23:07:43', '2025-10-13 23:07:43'),
(22, 'Grave', 'cds', 45, 41, 4, '2025-10-22 18:33:34', '2025-10-22 18:33:34'),
(23, 'Leve', 'sd sa dsa', 45, 1, 4, '2025-10-27 21:06:30', '2025-10-27 21:06:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `module`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ver Dashboard', 'dashboard.view', 'Permite ver el dashboard principal', 'Dashboard', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(2, 'Ver Usuarios', 'users.view', 'Permite ver la lista de usuarios', 'Usuarios', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(6, 'Ver Roles', 'roles.view', 'Permite ver la lista de roles', 'Roles', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(10, 'Ver Registros', 'registros.view', 'Permite ver la lista de registros', 'Registros', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(14, 'Ver Ingresos', 'ingresos.view', 'Permite ver la lista de ingresos', 'Ingresos', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(15, 'Crear Ingresos', 'ingresos.create', 'Permite crear nuevos ingresos', 'Ingresos', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(16, 'Editar Ingresos', 'ingresos.edit', 'Permite editar ingresos existentes', 'Ingresos', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(17, 'Eliminar Ingresos', 'ingresos.delete', 'Permite eliminar ingresos', 'Ingresos', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(18, 'Ver Tolerancias', 'tolerancias.view', 'Permite ver la configuración de tolerancias', 'Tolerancias', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(20, 'Ver Tipos de Vehículo', 'tipos-vehiculo.view', 'Permite ver la lista de tipos de vehículo', 'Tipos de Vehículo', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(24, 'Ver Vehículos', 'vehiculos.view', 'Permite ver la lista de vehículos', 'Vehículos', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(28, 'Ver Reportes', 'reportes.view', 'Permite ver y generar reportes', 'Reportes', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(29, 'Exportar Reportes', 'reportes.export', 'Permite exportar reportes', 'Reportes', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(30, 'Ver Salidas', 'salidas.view', 'Permite ver la lista de salidas', 'Salidas', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(32, 'Ver Observaciones', 'observaciones.view', 'Permite ver la lista de observaciones', 'Observaciones', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57'),
(36, 'Ver Permisos', 'permissions.view', 'Permite ver la lista de permisos', 'Permisos', 1, '2025-10-22 06:56:57', '2025-10-22 06:56:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '0cf83478d6a53379d4952ab6db1bac1b2fe0f2676f2f5611a55acf01b043cf04', '[\"*\"]', NULL, NULL, '2025-10-01 23:46:24', '2025-10-01 23:46:24'),
(2, 'App\\Models\\User', 1, 'auth_token', '05596d40ad55d8066b5f165d990003306b14f684fafee93c59700e9f551e2871', '[\"*\"]', '2025-10-01 23:47:32', NULL, '2025-10-01 23:46:51', '2025-10-01 23:47:32'),
(3, 'App\\Models\\User', 1, 'auth_token', 'cbbc8c45ef3619fdf40848b8834f5a351993061a117c0eb69cba77a553d990ec', '[\"*\"]', '2025-10-01 23:51:23', NULL, '2025-10-01 23:50:18', '2025-10-01 23:51:23'),
(4, 'App\\Models\\User', 1, 'auth_token', 'bccef617887e1752cf0d24ab5c5e0c7936b00b7da75f065d304e2e5e0f8bee18', '[\"*\"]', '2025-10-02 00:10:14', NULL, '2025-10-01 23:52:46', '2025-10-02 00:10:14'),
(5, 'App\\Models\\User', 1, 'auth_token', 'b0a2a196e302c653c9194a502823e7f28468ca55e7974341004db87c8d9d9966', '[\"*\"]', '2025-11-02 18:39:09', NULL, '2025-10-01 23:53:00', '2025-11-02 18:39:09'),
(6, 'App\\Models\\User', 1, 'auth_token', '90857ffb3dd8a3ab4b212aa659bbdca2b3e83e840630062f1b3a16a7d7938706', '[\"*\"]', '2025-10-02 00:14:58', NULL, '2025-10-02 00:12:09', '2025-10-02 00:14:58'),
(7, 'App\\Models\\User', 1, 'auth_token', '1f7dcf730f883b351ee65f7c38f9a59c1bfd9ea55c58a1edd7c6e284b1eef121', '[\"*\"]', '2025-10-02 05:26:51', NULL, '2025-10-02 00:16:41', '2025-10-02 05:26:51'),
(8, 'App\\Models\\User', 1, 'auth_token', '12ba724c52126ff41e5ee9c05dee767129b33ac28d15410d00b2ae684e680253', '[\"*\"]', NULL, NULL, '2025-10-02 00:42:35', '2025-10-02 00:42:35'),
(9, 'App\\Models\\User', 1, 'auth_token', '425292422c3d22b7d4855d9e0e4a47596d24677a844eddb6f568ccd99b507d06', '[\"*\"]', '2025-10-30 07:28:41', NULL, '2025-10-02 02:03:49', '2025-10-30 07:28:41'),
(10, 'App\\Models\\User', 1, 'auth_token', '67dc6bb337b1a28e577742eb23398a70b8f179b0650b8f455316b3c333a6b09f', '[\"*\"]', '2025-10-02 05:54:23', NULL, '2025-10-02 05:34:08', '2025-10-02 05:54:23'),
(11, 'App\\Models\\User', 1, 'auth_token', 'f87520ff7b9e3f148dd46e32f13bc9c682c3c6d94ab31db5564609227c90b57c', '[\"*\"]', '2025-10-02 15:56:20', NULL, '2025-10-02 15:56:04', '2025-10-02 15:56:20'),
(12, 'App\\Models\\User', 1, 'auth_token', 'c7dad839fdd13437bab5a33ec394edb282ac83ed27132a8477367a6f9d82e81d', '[\"*\"]', '2025-10-02 16:21:34', NULL, '2025-10-02 15:56:38', '2025-10-02 16:21:34'),
(13, 'App\\Models\\User', 1, 'auth_token', '324897e03939de524b4314119bbef77c7e839e1fe8a4abce6e5be48ef86cfa36', '[\"*\"]', '2025-10-03 06:17:34', NULL, '2025-10-02 16:02:23', '2025-10-03 06:17:34'),
(14, 'App\\Models\\User', 1, 'auth_token', 'd8930114be7d650906ffa95dc381188df19807133bbec7a379a5b0bfde66d9ee', '[\"*\"]', '2025-10-02 16:21:50', NULL, '2025-10-02 16:21:48', '2025-10-02 16:21:50'),
(15, 'App\\Models\\User', 10, 'auth_token', '75fb62b77de053c98adf3be0e6675b2164d08c014c7554b66d2367a93ebb0b17', '[\"*\"]', '2025-10-02 16:26:39', NULL, '2025-10-02 16:26:37', '2025-10-02 16:26:39'),
(16, 'App\\Models\\User', 10, 'auth_token', 'd4eeb688e7b1df1135f1d0beac9f1abbfb0508927a2dc10e08ac26c8f8a24962', '[\"*\"]', '2025-10-02 16:27:25', NULL, '2025-10-02 16:26:58', '2025-10-02 16:27:25'),
(17, 'App\\Models\\User', 5, 'auth_token', '45087a6c684fd069c55b21875d36beba50ff3bb563c2397d6d60dac8a5a407bc', '[\"*\"]', '2025-10-02 16:33:24', NULL, '2025-10-02 16:27:34', '2025-10-02 16:33:24'),
(18, 'App\\Models\\User', 11, 'auth_token', '0edc482cc6ab6f3501dbcaec8c68d425961a5189fec23f98c20b286a0cb0201c', '[\"*\"]', '2025-10-02 16:33:35', NULL, '2025-10-02 16:33:34', '2025-10-02 16:33:35'),
(19, 'App\\Models\\User', 1, 'auth_token', '530d1247dc62b9ba1fa14d07358f5b92c46f2601568e02d8cae38f5aa53f014b', '[\"*\"]', '2025-10-02 16:38:19', NULL, '2025-10-02 16:38:17', '2025-10-02 16:38:19'),
(20, 'App\\Models\\User', 1, 'auth_token', '663be9b2aeb50bc2bc9b8179c0e0861ac66fd9ffc8d9f9253de067cb720cef8c', '[\"*\"]', '2025-10-02 16:40:26', NULL, '2025-10-02 16:40:24', '2025-10-02 16:40:26'),
(21, 'App\\Models\\User', 1, 'auth_token', '71b0700f46d764fac5c45045cebda36c2f3f052d2db0e40ba712a0fa5e005cce', '[\"*\"]', '2025-10-02 21:41:21', NULL, '2025-10-02 16:41:29', '2025-10-02 21:41:21'),
(22, 'App\\Models\\User', 1, 'auth_token', 'bfcd77e7c232d0e04da57093c3c6289f8fb989388b0106252f051ead75b4616b', '[\"*\"]', '2025-10-02 21:42:16', NULL, '2025-10-02 21:42:14', '2025-10-02 21:42:16'),
(23, 'App\\Models\\User', 5, 'auth_token', '8b7ee1c8bc65df70a6d7246523f6aa97f9be74c5bd6eb71963c425f9da588742', '[\"*\"]', '2025-10-02 21:50:12', NULL, '2025-10-02 21:42:31', '2025-10-02 21:50:12'),
(24, 'App\\Models\\User', 1, 'auth_token', '31649bead3a4a98ce4bc2cc763b2f6835e175a3799f9913edcc7dacd3b2f1d83', '[\"*\"]', '2025-10-02 21:51:25', NULL, '2025-10-02 21:50:59', '2025-10-02 21:51:25'),
(25, 'App\\Models\\User', 5, 'auth_token', '67442a8e5039d7f432f009c80588b92abc2a47c6fec89ea35a540335b0010dc5', '[\"*\"]', '2025-10-02 21:51:44', NULL, '2025-10-02 21:51:32', '2025-10-02 21:51:44'),
(26, 'App\\Models\\User', 1, 'auth_token', 'fad97fd810de97c9f25ff178af6261d9d6cd5d673cbd5ca27c892b19a051c496', '[\"*\"]', '2025-10-02 21:54:36', NULL, '2025-10-02 21:51:49', '2025-10-02 21:54:36'),
(27, 'App\\Models\\User', 1, 'auth_token', '22fbc745941c913ad61184b7f2eeb805dd28e619a48400092df659289e092279', '[\"*\"]', '2025-10-03 02:39:45', NULL, '2025-10-02 21:57:06', '2025-10-03 02:39:45'),
(28, 'App\\Models\\User', 5, 'auth_token', '0706aaa3ac97e3826e44921414bb0a7568a5543f99b80449b59de963a1541068', '[\"*\"]', '2025-10-03 04:47:13', NULL, '2025-10-03 02:39:54', '2025-10-03 04:47:13'),
(29, 'App\\Models\\User', 5, 'auth_token', '7495483687290c2871f31ad5d3b80b1703e838879a9e2fd1c1d343bc37e73c62', '[\"*\"]', '2025-10-03 05:15:55', NULL, '2025-10-03 04:47:20', '2025-10-03 05:15:55'),
(30, 'App\\Models\\User', 14, 'auth_token', '0867e595e3cd0d51beb6b2d80d61e32065c3ea4106a6526f3b1c943f0337004a', '[\"*\"]', '2025-10-03 05:59:10', NULL, '2025-10-03 05:16:04', '2025-10-03 05:59:10'),
(31, 'App\\Models\\User', 1, 'auth_token', 'd4a1bfb623bc7c4291a06e0c0f9511a1c59423dcdff0e898fd4d45970397c524', '[\"*\"]', '2025-10-03 06:07:35', NULL, '2025-10-03 05:59:16', '2025-10-03 06:07:35'),
(32, 'App\\Models\\User', 14, 'auth_token', '9cdd9079b8c0705247ee14c525c9959942fcfd75daab7c5958b9bf95c574e251', '[\"*\"]', '2025-10-03 06:08:48', NULL, '2025-10-03 06:08:46', '2025-10-03 06:08:48'),
(33, 'App\\Models\\User', 1, 'auth_token', 'bd4b29a246f52ae63fb8eb69541965685fde8750b05f4cf41a1f4a63b924d1be', '[\"*\"]', '2025-10-03 17:00:45', NULL, '2025-10-03 06:08:53', '2025-10-03 17:00:45'),
(34, 'App\\Models\\User', 1, 'auth_token', 'f4fbb93a90a83949fb6d86e51a2d3b456706940f353bff818e7cdbb3a2309fb5', '[\"*\"]', '2025-10-04 16:40:13', NULL, '2025-10-03 06:22:31', '2025-10-04 16:40:13'),
(35, 'App\\Models\\User', 5, 'auth_token', 'bde29769a83d36418331e2d4914f630f64556da69e1777539b1cf70807e3cb59', '[\"*\"]', '2025-10-03 17:17:02', NULL, '2025-10-03 17:00:55', '2025-10-03 17:17:02'),
(36, 'App\\Models\\User', 1, 'auth_token', 'bef7459699375fa32dc6f748df2042e80dba80dcc621f71d041d5e472b65a0a6', '[\"*\"]', '2025-10-03 17:17:16', NULL, '2025-10-03 17:17:10', '2025-10-03 17:17:16'),
(37, 'App\\Models\\User', 5, 'auth_token', 'd132bc964bb74a81cd2ef96f54523c3e75d6884a4b73131de7c3fe4d6e24ce01', '[\"*\"]', '2025-10-03 18:53:04', NULL, '2025-10-03 17:17:26', '2025-10-03 18:53:04'),
(38, 'App\\Models\\User', 1, 'auth_token', '634583ce940d380d943eb0572063b22cf222dcb3987ff7090f7388ea018da7b2', '[\"*\"]', NULL, NULL, '2025-10-03 18:01:09', '2025-10-03 18:01:09'),
(39, 'App\\Models\\User', 5, 'auth_token', '372590a146221f401dfbb0095bb5fcb1e474c73a65b6879b5bc87306764a85ad', '[\"*\"]', '2025-10-04 16:33:36', NULL, '2025-10-04 03:02:18', '2025-10-04 16:33:36'),
(40, 'App\\Models\\User', 1, 'auth_token', '0a0cc26e612e6a9d37b44c9a08838a1abc326f0cb46ca66016e167bc2d0efce7', '[\"*\"]', '2025-10-04 03:59:59', NULL, '2025-10-04 03:02:29', '2025-10-04 03:59:59'),
(41, 'App\\Models\\User', 1, 'auth_token', '3148894ca548a297187ef561b4249fb73395d59752aa5b48c563be236918c054', '[\"*\"]', '2025-10-04 18:20:15', NULL, '2025-10-04 16:26:22', '2025-10-04 18:20:15'),
(42, 'App\\Models\\User', 5, 'auth_token', '0c395f9a31f11d7640c59235a5e05ae25e0cd83c2d3321dcf6a29268d17108ff', '[\"*\"]', '2025-10-04 16:45:18', NULL, '2025-10-04 16:33:42', '2025-10-04 16:45:18'),
(43, 'App\\Models\\User', 11, 'auth_token', '681909a2bf09adc8b5dfe86d31f62847ed3b5fde517250d7670e87b22d52b2e9', '[\"*\"]', '2025-10-04 16:52:52', NULL, '2025-10-04 16:46:21', '2025-10-04 16:52:52'),
(44, 'App\\Models\\User', 1, 'auth_token', 'cf44a26603f9ea996c0f7e854194916b5e261cebfbaa6897c0117c4918ef202c', '[\"*\"]', '2025-10-04 18:00:47', NULL, '2025-10-04 16:47:17', '2025-10-04 18:00:47'),
(45, 'App\\Models\\User', 5, 'auth_token', '634381ba5ae75a09e588b432abab9058477c2d7c0a14b6141f96644603a47cd6', '[\"*\"]', '2025-10-05 17:48:49', NULL, '2025-10-04 16:53:23', '2025-10-05 17:48:49'),
(46, 'App\\Models\\User', 11, 'auth_token', '3a9077121c69f37b603acd1c12d900e7901bc54beaa5f54e194bf0335788210a', '[\"*\"]', '2025-10-13 19:05:01', NULL, '2025-10-04 16:55:50', '2025-10-13 19:05:01'),
(47, 'App\\Models\\User', 1, 'auth_token', 'ad6310cf338ec03dc25a66a57d52822d32a6d277a5e5f230e2f7d13cb8f77010', '[\"*\"]', NULL, NULL, '2025-10-04 17:03:59', '2025-10-04 17:03:59'),
(48, 'App\\Models\\User', 1, 'auth_token', '94e59808e5a12130dcf566023e3038272c4c05deff555e81629eafdf901749f7', '[\"*\"]', '2025-10-04 17:44:06', NULL, '2025-10-04 17:23:55', '2025-10-04 17:44:06'),
(49, 'App\\Models\\User', 1, 'auth_token', '9ccb4bd30eea3932c6f1808276a12207c685e1363f497bb5d944589f16fe3e52', '[\"*\"]', '2025-10-05 17:48:48', NULL, '2025-10-05 16:53:17', '2025-10-05 17:48:48'),
(50, 'App\\Models\\User', 1, 'auth_token', '6130b1480788129ec25222f89a74acc212cd02d71ffca7a2395d6fb534a7eba5', '[\"*\"]', '2025-10-05 17:35:25', NULL, '2025-10-05 17:35:08', '2025-10-05 17:35:25'),
(51, 'App\\Models\\User', 1, 'auth_token', '6a2f710987c9b400561a78f8a817da2d53fe02d25dc301d951d10574f5c76777', '[\"*\"]', '2025-10-06 17:04:06', NULL, '2025-10-06 16:57:54', '2025-10-06 17:04:06'),
(52, 'App\\Models\\User', 5, 'auth_token', 'eb8b752f42371b461c02322cf3616d3add82405b65c60bb6c0776b48c650e785', '[\"*\"]', '2025-10-06 21:30:42', NULL, '2025-10-06 17:04:59', '2025-10-06 21:30:42'),
(53, 'App\\Models\\User', 1, 'auth_token', '696b65203687cdc94a66ea4b648b390f927d2be47c08883cd2bd1e50e67e62aa', '[\"*\"]', '2025-10-06 21:18:06', NULL, '2025-10-06 17:10:37', '2025-10-06 21:18:06'),
(54, 'App\\Models\\User', 1, 'auth_token', 'c007ebe8f238a3627bebb1b36515fe6c57abdc749230c09b9469ea26081d9731', '[\"*\"]', '2025-10-07 17:29:53', NULL, '2025-10-06 20:37:20', '2025-10-07 17:29:53'),
(55, 'App\\Models\\User', 1, 'auth_token', 'd5b8a9fe6796c2b2f0468784c77d471d5573c07c08a3b9402f7f67b56fbfbfe3', '[\"*\"]', '2025-10-07 23:46:52', NULL, '2025-10-07 16:30:44', '2025-10-07 23:46:52'),
(56, 'App\\Models\\User', 1, 'auth_token', '116c1fdeadfcfe14ed4028384d821c9d70bfb045fbea217fa53ed638fb4626fb', '[\"*\"]', '2025-10-07 17:53:07', NULL, '2025-10-07 16:38:15', '2025-10-07 17:53:07'),
(57, 'App\\Models\\User', 1, 'auth_token', '73611da46edba75121af653fbe526625cea630a9db813468141b2bdd05c53180', '[\"*\"]', '2025-10-07 18:02:05', NULL, '2025-10-07 17:53:13', '2025-10-07 18:02:05'),
(58, 'App\\Models\\User', 1, 'auth_token', 'ed4aff34349f277e947fcadb3ce5dae96858b004039e5df20b390812a28f8d00', '[\"*\"]', NULL, NULL, '2025-10-07 23:06:18', '2025-10-07 23:06:18'),
(59, 'App\\Models\\User', 1, 'auth_token', '707439ef9ae03428fcff6e09301d8214408637a98eeb7604524ac139ad11f1e9', '[\"*\"]', '2025-10-08 17:10:31', NULL, '2025-10-07 23:47:00', '2025-10-08 17:10:31'),
(60, 'App\\Models\\User', 1, 'auth_token', '11b17f3c564950d8ca0e86b7de5a89fc2aa61a4db9baae93c989281721af2dac', '[\"*\"]', '2025-10-08 17:57:53', NULL, '2025-10-08 17:10:30', '2025-10-08 17:57:53'),
(61, 'App\\Models\\User', 1, 'auth_token', 'a3d26f37f12ae5d3ca66dd2d15de14ab15ebe88555535da41b262a38e4f1678c', '[\"*\"]', '2025-10-08 18:07:51', NULL, '2025-10-08 17:49:36', '2025-10-08 18:07:51'),
(62, 'App\\Models\\User', 5, 'auth_token', '319fdbca848c665b3abea07f2ca17257ddc8fc03f5ef05f615629575d4d77a2f', '[\"*\"]', '2025-10-13 17:00:28', NULL, '2025-10-08 17:58:28', '2025-10-13 17:00:28'),
(63, 'App\\Models\\User', 1, 'auth_token', 'd001b35cbdb27d657583551fcd793d6bd86c49c8684e4e50594560bd824f7cf2', '[\"*\"]', '2025-11-02 17:46:55', NULL, '2025-10-11 03:38:50', '2025-11-02 17:46:55'),
(64, 'App\\Models\\User', 1, 'auth_token', 'c7f87b916de05af638760c15c0569e50f87516a68fec87856311e423341ded7e', '[\"*\"]', '2025-10-11 07:04:46', NULL, '2025-10-11 06:49:20', '2025-10-11 07:04:46'),
(65, 'App\\Models\\User', 1, 'auth_token', 'cab3236fd6aef60921cb5c9edb9cc6a8740bd20a67eaced74237fe58d3cc73ca', '[\"*\"]', '2025-10-13 17:15:34', NULL, '2025-10-13 17:00:41', '2025-10-13 17:15:34'),
(66, 'App\\Models\\User', 1, 'auth_token', 'b9539c9ec4d110b71a1ff522c63d3cd2b65a5d93618318eba467cb15da4d0c21', '[\"*\"]', '2025-10-14 06:09:34', NULL, '2025-10-13 17:09:49', '2025-10-14 06:09:34'),
(67, 'App\\Models\\User', 1, 'auth_token', 'f9dcd7749277c2b14bf7865d30bd33df239f7697e60913178d88aa36dac6a749', '[\"*\"]', '2025-10-13 18:40:21', NULL, '2025-10-13 17:16:26', '2025-10-13 18:40:21'),
(68, 'App\\Models\\User', 1, 'auth_token', '41bfca1e8bfbf1a0c642ac9512f3238ef7ef89c7149a2da1da23f12a73a417fd', '[\"*\"]', '2025-10-13 19:02:06', NULL, '2025-10-13 18:40:28', '2025-10-13 19:02:06'),
(69, 'App\\Models\\User', 1, 'auth_token', '2b478043136743d1cc3fae476251c66023e86c0994dff0c5820295ca5c84f5a3', '[\"*\"]', '2025-10-13 19:02:49', NULL, '2025-10-13 19:02:26', '2025-10-13 19:02:49'),
(70, 'App\\Models\\User', 22, 'auth_token', '80d5e8f1295c935e0d5b14623460ae76552b5dba34ceee79275b870023cedc15', '[\"*\"]', '2025-10-13 19:03:38', NULL, '2025-10-13 19:03:11', '2025-10-13 19:03:38'),
(71, 'App\\Models\\User', 1, 'auth_token', '24bbb9b99f679ed00184aa0fd61c5df2d6a4b6754eeb4a9fafcf4e49fe306883', '[\"*\"]', '2025-10-13 19:06:44', NULL, '2025-10-13 19:05:11', '2025-10-13 19:06:44'),
(72, 'App\\Models\\User', 22, 'auth_token', '2ae94bda810875204c5403a5d1a4b9ab8a4e9b0786a0c0372d1743497d0d9d6a', '[\"*\"]', '2025-10-14 18:30:28', NULL, '2025-10-13 19:05:24', '2025-10-14 18:30:28'),
(73, 'App\\Models\\User', 5, 'auth_token', '6e553c55ecc633b101256fad069a619a73accd1206f151256f279f956839574c', '[\"*\"]', '2025-10-13 19:35:35', NULL, '2025-10-13 19:07:06', '2025-10-13 19:35:35'),
(74, 'App\\Models\\User', 1, 'auth_token', 'af5aa0082bc344fdf36ebf1b63f90b19bc2b200e02f210293898644ee0e98d6a', '[\"*\"]', '2025-10-13 19:43:00', NULL, '2025-10-13 19:36:09', '2025-10-13 19:43:00'),
(75, 'App\\Models\\User', 23, 'auth_token', '0f5e285b55f578f2e6d4a35da5c4a5a17e1c5762dc636bb245590981e10eee98', '[\"*\"]', '2025-10-13 19:43:13', NULL, '2025-10-13 19:43:12', '2025-10-13 19:43:13'),
(76, 'App\\Models\\User', 1, 'auth_token', '0ae26696be3b765c74cea0b4c56f2f6917b4622c379813ee7efd450abe38bb79', '[\"*\"]', '2025-10-13 20:26:16', NULL, '2025-10-13 19:46:37', '2025-10-13 20:26:16'),
(77, 'App\\Models\\User', 31, 'auth_token', '308ede3e596fac38fce5a16e940783424860c92c0ed2fe0fb9649b3de5f27661', '[\"*\"]', '2025-10-13 20:26:42', NULL, '2025-10-13 20:26:41', '2025-10-13 20:26:42'),
(78, 'App\\Models\\User', 1, 'auth_token', '239ecdf65cb0319b31b7429e18f96a2224f8faa790b903579a4318893a2b7476', '[\"*\"]', '2025-10-13 20:29:16', NULL, '2025-10-13 20:27:35', '2025-10-13 20:29:16'),
(79, 'App\\Models\\User', 31, 'auth_token', 'd5ef7dc914d63e846770dd186b714c3d4be112a57d0c47083ba9c4eaf2406463', '[\"*\"]', '2025-10-13 20:38:38', NULL, '2025-10-13 20:29:37', '2025-10-13 20:38:38'),
(80, 'App\\Models\\User', 1, 'auth_token', 'dcdfa0978a9ef1c043e2a9106d72289c4b7d23d43077fec0fc35950300f3f761', '[\"*\"]', '2025-10-13 20:49:27', NULL, '2025-10-13 20:38:48', '2025-10-13 20:49:27'),
(81, 'App\\Models\\User', 32, 'auth_token', '21551440bf676e313a41eed00d3590fd6bafd7eeff192411a02fcb3df09fc806', '[\"*\"]', '2025-10-13 20:50:50', NULL, '2025-10-13 20:49:35', '2025-10-13 20:50:50'),
(82, 'App\\Models\\User', 1, 'auth_token', '1c21b12f6f2341eac00381db5d377b2bd0808697c7202cc91bce34fe1dd0c153', '[\"*\"]', '2025-10-13 20:52:14', NULL, '2025-10-13 20:51:12', '2025-10-13 20:52:14'),
(83, 'App\\Models\\User', 32, 'auth_token', '8c512b4b0c2fa510dae68dfa6b980999cad163ce7c619b4f063f0d0915ce0e93', '[\"*\"]', '2025-10-13 20:52:48', NULL, '2025-10-13 20:52:25', '2025-10-13 20:52:48'),
(84, 'App\\Models\\User', 1, 'auth_token', '09b23f44fc04c160dd43faa33a841b26fb87d9515d10f6237a3f97d3ffb7c963', '[\"*\"]', '2025-10-13 21:26:44', NULL, '2025-10-13 20:52:59', '2025-10-13 21:26:44'),
(85, 'App\\Models\\User', 1, 'auth_token', 'f7547537ebc4d5c762ebe4ad781cf41579d2ce6088c7ad6954e8d84b87243b13', '[\"*\"]', '2025-10-13 21:30:46', NULL, '2025-10-13 21:27:12', '2025-10-13 21:30:46'),
(86, 'App\\Models\\User', 32, 'auth_token', '948139bf6caab3f41c44d1604a2edcb716e8f06457d72b76c6e3d80b799b6ca2', '[\"*\"]', '2025-10-13 21:40:09', NULL, '2025-10-13 21:30:56', '2025-10-13 21:40:09'),
(87, 'App\\Models\\User', 1, 'auth_token', 'aae7196732c331e594ba10692373f670a02e66d9d108e4ed5850dc9fd2e50c40', '[\"*\"]', '2025-10-13 21:44:54', NULL, '2025-10-13 21:40:17', '2025-10-13 21:44:54'),
(88, 'App\\Models\\User', 31, 'auth_token', '7f327fde5ad207c15b52cfa3880a2c5a4d611f55d78a98bdbb14165c7505e38e', '[\"*\"]', '2025-10-13 21:46:26', NULL, '2025-10-13 21:45:02', '2025-10-13 21:46:26'),
(89, 'App\\Models\\User', 1, 'auth_token', 'f184470541334f3f58d5a92dc7b97f07b25b89bdd47391bbbd3f5c831c01783b', '[\"*\"]', '2025-10-13 22:09:22', NULL, '2025-10-13 21:46:42', '2025-10-13 22:09:22'),
(90, 'App\\Models\\User', 34, 'auth_token', '1d13c336c7032225a56e2f5d39b519f7e9169fdba025b47fbdcfab4a120f4005', '[\"*\"]', '2025-10-13 22:14:30', NULL, '2025-10-13 22:10:41', '2025-10-13 22:14:30'),
(91, 'App\\Models\\User', 1, 'auth_token', 'bc5fd9eea33fd11142080f635f7076d4711925c218603da7dff621e2e7a55eb9', '[\"*\"]', '2025-10-13 23:08:36', NULL, '2025-10-13 22:14:45', '2025-10-13 23:08:36'),
(92, 'App\\Models\\User', 1, 'auth_token', '16c1a06a97bae0afc00a399d1c246456a724f9011f0948d2c8eb21d3cee6c8f2', '[\"*\"]', '2025-10-14 00:28:06', NULL, '2025-10-13 23:09:13', '2025-10-14 00:28:06'),
(93, 'App\\Models\\User', 1, 'auth_token', 'b9353e939766cb65c256ca0231a4fedfdf30ac5ad4932b8fac435ea9ce206869', '[\"*\"]', '2025-10-14 01:07:59', NULL, '2025-10-14 01:07:58', '2025-10-14 01:07:59'),
(94, 'App\\Models\\User', 1, 'auth_token', '1fb4287630ed6691635b99f2ea9cd8ac6bc672a7e281b49e923afc19246f619a', '[\"*\"]', '2025-10-14 01:09:06', NULL, '2025-10-14 01:09:05', '2025-10-14 01:09:06'),
(95, 'App\\Models\\User', 1, 'auth_token', 'a49266758160d0395f7041c8ead024e3f2015605d8ed7bbbc1ed14fca33f52c1', '[\"*\"]', '2025-10-14 01:11:38', NULL, '2025-10-14 01:09:45', '2025-10-14 01:11:38'),
(96, 'App\\Models\\User', 1, 'auth_token', 'f8d3e761db7915e5a4db1e7555e5d3f692a01883996de6d5bf74577536e40995', '[\"*\"]', '2025-10-14 04:26:37', NULL, '2025-10-14 01:12:43', '2025-10-14 04:26:37'),
(97, 'App\\Models\\User', 1, 'auth_token', 'a8ef9de7f2eba26df7e70bf621bd14bf69db36ccc7c2a5bffbcdc8f504bf08f3', '[\"*\"]', '2025-10-16 04:36:16', NULL, '2025-10-14 06:16:48', '2025-10-16 04:36:16'),
(98, 'App\\Models\\User', 1, 'auth_token', 'f294a31ac1f20f7cf5c2483fd32940d118187b5191f7debc49aacfe4e3d8b72e', '[\"*\"]', '2025-10-15 03:49:27', NULL, '2025-10-14 18:30:34', '2025-10-15 03:49:27'),
(99, 'App\\Models\\User', 1, 'auth_token', 'c4995546c0c9ba56edbbe5960094ee6bf02e027ef0bad6297032ccedfac7ee9d', '[\"*\"]', '2025-10-15 04:20:47', NULL, '2025-10-15 03:49:34', '2025-10-15 04:20:47'),
(100, 'App\\Models\\User', 22, 'auth_token', 'bb951965f81743d807e1750b2316df018578addf806a4a20dfa50033e1ed8029', '[\"*\"]', '2025-10-15 04:38:57', NULL, '2025-10-15 04:24:31', '2025-10-15 04:38:57'),
(101, 'App\\Models\\User', 1, 'auth_token', 'a33ca61ae1f8048b0302949516127db68d63c00aa1575580d1cfb9d30b0237d6', '[\"*\"]', '2025-10-15 07:24:59', NULL, '2025-10-15 04:43:10', '2025-10-15 07:24:59'),
(102, 'App\\Models\\User', 1, 'auth_token', '44ade8f0f9f57581cbb6fb94e57eec597c6bdc784157479ac7dbd94e070c0f37', '[\"*\"]', NULL, NULL, '2025-10-15 18:21:53', '2025-10-15 18:21:53'),
(103, 'App\\Models\\User', 38, 'auth_token', 'fcdaf7b2f9af5a7ba7b42dc4cf76f3c72d7dc6c76fae82a6e30707d0c9a4e760', '[\"*\"]', '2025-10-15 18:37:54', NULL, '2025-10-15 18:36:11', '2025-10-15 18:37:54'),
(104, 'App\\Models\\User', 1, 'auth_token', '69c14c92a79f50e602b71d1b3b98819028e26923669cba2ec56ac5de59c3d6eb', '[\"*\"]', '2025-10-15 19:04:10', NULL, '2025-10-15 19:03:55', '2025-10-15 19:04:10'),
(105, 'App\\Models\\User', 38, 'auth_token', 'd4f2859a2476d8e3d2019ee4d833d66ea9cfb69cc7ecf52cda05844d194ffbec', '[\"*\"]', '2025-10-15 19:05:15', NULL, '2025-10-15 19:04:44', '2025-10-15 19:05:15'),
(106, 'App\\Models\\User', 1, 'auth_token', '70dddc5387e869ea07978e590d99c5538cff70fbd1c32712ae392d422cc1123c', '[\"*\"]', '2025-10-15 19:05:18', NULL, '2025-10-15 19:05:17', '2025-10-15 19:05:18'),
(107, 'App\\Models\\User', 1, 'auth_token', '8ba1212bb6a6fa9bf0a634b6049867490b97857b8e8e66cb05710f21398d130e', '[\"*\"]', '2025-10-15 19:07:05', NULL, '2025-10-15 19:06:40', '2025-10-15 19:07:05'),
(108, 'App\\Models\\User', 38, 'auth_token', '6ee9fbdc42f449d9118d1c807a34f0f6c4c1f3679bd9db4979ae76171a4cb1b8', '[\"*\"]', '2025-10-15 23:08:22', NULL, '2025-10-15 19:07:18', '2025-10-15 23:08:22'),
(109, 'App\\Models\\User', 1, 'auth_token', 'a94003cf94e207187828b474c8222777e539fa983a1cc0b262d07424a0a849b7', '[\"*\"]', '2025-10-15 23:09:19', NULL, '2025-10-15 23:08:48', '2025-10-15 23:09:19'),
(110, 'App\\Models\\User', 1, 'auth_token', '8380190e20b466f272097d8b2aafdb932a0eb247b1e05e0b0bf945189959cf98', '[\"*\"]', '2025-10-15 23:32:52', NULL, '2025-10-15 23:09:37', '2025-10-15 23:32:52'),
(111, 'App\\Models\\User', 40, 'auth_token', 'aca8d18ba3e65adf44dd9b0c56a1fa7eb4b3053ccde590ca576d773746629c49', '[\"*\"]', '2025-10-16 00:55:04', NULL, '2025-10-15 23:34:18', '2025-10-16 00:55:04'),
(112, 'App\\Models\\User', 1, 'auth_token', '21db701fc69f63ea0bb40bc810e2dca10e9959f4400cebd4b498f43d199fc2b0', '[\"*\"]', '2025-10-16 04:33:40', NULL, '2025-10-16 00:55:17', '2025-10-16 04:33:40'),
(113, 'App\\Models\\User', 1, 'auth_token', '65970a9848c7e8f73014280cc9610aca87ffb5cf02edbb2276bb7d5ea16805fd', '[\"*\"]', '2025-10-16 06:19:59', NULL, '2025-10-16 06:05:31', '2025-10-16 06:19:59'),
(114, 'App\\Models\\User', 1, 'auth_token', '360a727528954700c46ef382afe4820653d9ae36089db4d2b2c8e33e4971ca3b', '[\"*\"]', '2025-10-18 04:39:00', NULL, '2025-10-18 03:28:07', '2025-10-18 04:39:00'),
(115, 'App\\Models\\User', 1, 'auth_token', 'c195b1680f1c426b69e69a224e6d6dc67e75255ba7f25040da6e5503221b2b94', '[\"*\"]', '2025-10-18 04:39:33', NULL, '2025-10-18 03:28:52', '2025-10-18 04:39:33'),
(116, 'App\\Models\\User', 1, 'auth_token', '943cbe1084c2e272bf6e28a63dc5c70e41a866cc06765dd9cc8c2c1b76a5ba10', '[\"*\"]', '2025-10-18 05:14:01', NULL, '2025-10-18 04:47:56', '2025-10-18 05:14:01'),
(117, 'App\\Models\\User', 1, 'auth_token', '98ef65919c17fa5fbd8b8e281eb071b64503e2f9a97ebfad6a61180f38501fec', '[\"*\"]', '2025-10-18 06:47:11', NULL, '2025-10-18 06:17:13', '2025-10-18 06:47:11'),
(118, 'App\\Models\\User', 1, 'auth_token', '8f5933d1ad4a28ed2d6596325004dbb66fd25504f8c313bd2f13a478b4297d76', '[\"*\"]', '2025-10-18 08:27:41', NULL, '2025-10-18 08:27:29', '2025-10-18 08:27:41'),
(119, 'App\\Models\\User', 1, 'auth_token', 'fa2fe9b2f9d9b0ae5c8092e4b3753e538b677aa51509815ab93f51f48d00c8b1', '[\"*\"]', '2025-10-18 08:44:34', NULL, '2025-10-18 08:28:13', '2025-10-18 08:44:34'),
(120, 'App\\Models\\User', 1, 'auth_token', 'fefbbb8d422f6142ade3b9d01fa37d52ba159298668f4c30b2e8c49a7082908b', '[\"*\"]', '2025-10-18 23:39:04', NULL, '2025-10-18 08:41:44', '2025-10-18 23:39:04'),
(121, 'App\\Models\\User', 1, 'auth_token', '2e8782e04b5c82fb0ad8a943962e0a296fa165c7e16fca6a5aacac1e97b58f93', '[\"*\"]', '2025-10-18 18:18:21', NULL, '2025-10-18 18:15:20', '2025-10-18 18:18:21'),
(122, 'App\\Models\\User', 1, 'auth_token', '5151291aa385abc2ac6ed1452f1df0ad1b4534ea3f9d11d8d34caf17ea32ae30', '[\"*\"]', NULL, NULL, '2025-10-18 22:50:05', '2025-10-18 22:50:05'),
(124, 'App\\Models\\User', 5, 'auth_token', '765f80fdb3f4c94c2b9fdb66b3e2ca3f18e4d58375d9d1b45e91632f36204776', '[\"*\"]', '2025-10-22 17:25:36', NULL, '2025-10-22 04:22:45', '2025-10-22 17:25:36'),
(125, 'App\\Models\\User', 1, 'auth_token', '7bf68f0740f8c55ee89581084d25d1318ded35c0f7c62755c320398e7ea27089', '[\"*\"]', '2025-10-22 18:12:23', NULL, '2025-10-22 04:54:42', '2025-10-22 18:12:23'),
(126, 'App\\Models\\User', 5, 'auth_token', '59adaaea43af6c0784cac3b32c47bc91164b5ec7e8e5263358ab6e6420d0a2d0', '[\"*\"]', '2025-10-22 18:13:48', NULL, '2025-10-22 17:26:01', '2025-10-22 18:13:48'),
(127, 'App\\Models\\User', 1, 'auth_token', '61112584945c0a61710304c6abe66f681dfcce6b955bb5fcf9441b34bd6a4275', '[\"*\"]', '2025-10-22 18:22:46', NULL, '2025-10-22 18:14:01', '2025-10-22 18:22:46'),
(128, 'App\\Models\\User', 5, 'auth_token', '6b037f20a18c843e6875f86b61228be9a8d607eba38c79eea259cab2510d87ae', '[\"*\"]', '2025-10-22 18:32:17', NULL, '2025-10-22 18:23:15', '2025-10-22 18:32:17'),
(129, 'App\\Models\\User', 1, 'auth_token', 'f4485f2885914e8ccf3ed0fc2880938fa09cdfd2586f66652a79ab7ee0ae5a5b', '[\"*\"]', '2025-10-22 18:29:50', NULL, '2025-10-22 18:26:42', '2025-10-22 18:29:50'),
(130, 'App\\Models\\User', 41, 'auth_token', '14b38b63a83514a80999c46b05156b3757a9b6f2e6de5a8c0ec5d4c49a3f7a83', '[\"*\"]', '2025-10-22 18:34:11', NULL, '2025-10-22 18:32:30', '2025-10-22 18:34:11'),
(131, 'App\\Models\\User', 5, 'auth_token', 'aa2a610a83fb5055a82b50f8fba53be9e4200dc484d157eb7efb12b178660346', '[\"*\"]', '2025-10-22 18:41:11', NULL, '2025-10-22 18:36:00', '2025-10-22 18:41:11'),
(132, 'App\\Models\\User', 41, 'auth_token', '4e89a9193607dcd91c641a0a20b9b36e73efac51954ba2e2612dd1ecd0bbb700', '[\"*\"]', '2025-10-27 21:05:12', NULL, '2025-10-22 18:41:21', '2025-10-27 21:05:12'),
(134, 'App\\Models\\User', 1, 'auth_token', '41b26b3cac510465d0f13b962999d6aa84ad4e059979a428fdb9bd792d270911', '[\"*\"]', '2025-10-26 20:27:32', NULL, '2025-10-25 16:57:38', '2025-10-26 20:27:32'),
(135, 'App\\Models\\User', 1, 'auth_token', '0f2402c5a9bc34e24267ffcbc784b639f39fcfc6709b6cf7def86cf0e3726f51', '[\"*\"]', NULL, NULL, '2025-10-25 16:58:23', '2025-10-25 16:58:23'),
(136, 'App\\Models\\User', 1, 'auth_token', '48ed598a4e44904f8fa9fa1270e83e68631ce82ef81a8012b8348166f6789c40', '[\"*\"]', NULL, NULL, '2025-10-25 17:03:56', '2025-10-25 17:03:56'),
(137, 'App\\Models\\User', 5, 'auth_token', '4d96081f13c7723846ca7ed67425ba728d02a2f2e2ef5b7d1da9d22073597243', '[\"*\"]', NULL, NULL, '2025-10-25 17:04:21', '2025-10-25 17:04:21'),
(143, 'App\\Models\\User', 1, 'auth_token', 'b1ec37f47a03ba8dc5611d658d1ec98c77d09ddd3219b101cd13833bd2211fc0', '[\"*\"]', '2025-11-02 19:33:25', NULL, '2025-10-27 21:01:22', '2025-11-02 19:33:25'),
(144, 'App\\Models\\User', 1, 'auth_token', '02dc7e4b7134b74aca8cba50e7e84773faf4f0b57d37a1a54f48882690ae5f1f', '[\"*\"]', '2025-10-29 20:51:50', NULL, '2025-10-27 21:05:19', '2025-10-29 20:51:50'),
(145, 'App\\Models\\User', 5, 'auth_token', 'cee6c87624c7e0c25223e7339cecf353d6e6509a2809d5159b25033db6ba0dd2', '[\"*\"]', '2025-10-31 22:00:39', NULL, '2025-10-29 20:51:55', '2025-10-31 22:00:39'),
(146, 'App\\Models\\User', 1, 'auth_token', '67059aa6447c70260128392ee62a9524d9b00e818391329f36d5bee5fa3f9a3b', '[\"*\"]', '2025-10-30 15:51:51', NULL, '2025-10-30 06:51:27', '2025-10-30 15:51:51'),
(147, 'App\\Models\\User', 1, 'auth_token', '626b45422bff64ede8b4c539d510754e32cd63c16ec78df91650c98469409733', '[\"*\"]', '2025-11-03 07:33:02', NULL, '2025-10-30 15:52:16', '2025-11-03 07:33:02'),
(148, 'App\\Models\\User', 1, 'auth_token', '869501643f188b1ab6210eadde817b98cc3245c8e7a4fa63f3484984fd5bdcaa', '[\"*\"]', '2025-11-03 05:45:22', NULL, '2025-10-31 22:00:38', '2025-11-03 05:45:22'),
(149, 'App\\Models\\User', 5, 'auth_token', 'f83223ef3857a8867f27e6e9e08cc98ab20f073c6c55c4d6b081b7aed3f71006', '[\"*\"]', '2025-11-03 07:38:30', NULL, '2025-11-03 05:45:32', '2025-11-03 07:38:30'),
(150, 'App\\Models\\User', 5, 'auth_token', 'a5af6fff65933c89a0c3f3dae2bac6f06f5964b9a8a3a5608f628736c66001b7', '[\"*\"]', '2025-11-03 07:58:07', NULL, '2025-11-03 07:39:14', '2025-11-03 07:58:07'),
(151, 'App\\Models\\User', 1, 'auth_token', '0f09d86bcdb27db48ae3f4b7d853d659ea8852dcd0aebc6e131c390854242dba', '[\"*\"]', '2025-11-03 07:59:20', NULL, '2025-11-03 07:58:56', '2025-11-03 07:59:20'),
(152, 'App\\Models\\User', 5, 'auth_token', '6b949af8ea670929d004b28c5cd973042589d3c4b0db3664f3ddcfcabefa6dd2', '[\"*\"]', '2025-11-03 08:05:55', NULL, '2025-11-03 07:59:29', '2025-11-03 08:05:55'),
(153, 'App\\Models\\User', 1, 'auth_token', 'd9841c25a0f3927191476b6f9e7218b9fd7b004349370d3d4347dfbd53180dde', '[\"*\"]', '2025-11-03 08:06:13', NULL, '2025-11-03 08:06:04', '2025-11-03 08:06:13'),
(154, 'App\\Models\\User', 1, 'auth_token', 'cce9dff3e0ba5adabd080415563e597125dc7626e4a70f3a99f99f3f4ca65a3c', '[\"*\"]', '2025-11-03 08:59:34', NULL, '2025-11-03 08:06:22', '2025-11-03 08:59:34'),
(155, 'App\\Models\\User', 5, 'auth_token', 'f66f456e2c3c6ab884ea89300c39fed53fbcb617fb53340640871b2116163b61', '[\"*\"]', '2025-11-03 09:30:21', NULL, '2025-11-03 09:00:57', '2025-11-03 09:30:21'),
(156, 'App\\Models\\User', 5, 'auth_token', '3756727ff941891e9c6c23b6c8ebbee694f8306ab94eab9fd8e07ee7bd6012ab', '[\"*\"]', '2025-11-03 09:54:04', NULL, '2025-11-03 09:31:46', '2025-11-03 09:54:04'),
(157, 'App\\Models\\User', 1, 'auth_token', '7cc9e3859f9a92a0dd0cf6bd5b345a733b8b00d465df43bb398e7521b5b99c6c', '[\"*\"]', '2025-11-03 09:56:38', NULL, '2025-11-03 09:54:25', '2025-11-03 09:56:38'),
(158, 'App\\Models\\User', 5, 'auth_token', '6bb97c3ff8efb2642088bad067324b935da8c3a5e525696615a8c938fb9d9ac1', '[\"*\"]', '2025-11-03 11:43:57', NULL, '2025-11-03 09:56:50', '2025-11-03 11:43:57'),
(159, 'App\\Models\\User', 5, 'auth_token', '211777cb07b3fc857e3e139341145fd678fcc0f1796a61c74f7ca2a420429fc9', '[\"*\"]', '2025-11-03 23:08:24', NULL, '2025-11-03 11:44:14', '2025-11-03 23:08:24'),
(160, 'App\\Models\\User', 1, 'auth_token', '2b5f2d2e31397e118eefe02f746b4a2f4729217194cc4d11f22081b8299e41bc', '[\"*\"]', NULL, NULL, '2025-11-03 23:10:01', '2025-11-03 23:10:01'),
(161, 'App\\Models\\User', 5, 'auth_token', '7ddc5476c4681b0369c357dc40df2c42a845fa45c18bbbc1be969f439b6ec2f9', '[\"*\"]', '2025-11-05 17:07:14', NULL, '2025-11-05 17:05:39', '2025-11-05 17:07:14'),
(162, 'App\\Models\\User', 5, 'auth_token', '585828214685f341ac94eeafa5d85fb838eac63604e9c2c796b6607f00ff61e9', '[\"*\"]', '2025-11-06 17:57:07', NULL, '2025-11-06 17:57:05', '2025-11-06 17:57:07'),
(163, 'App\\Models\\User', 43, 'auth_token', '321e93321b2d4c246021ecdbebcca9fae1a5aae53c36f1965b554defa859a4f4', '[\"*\"]', '2025-11-06 17:59:14', NULL, '2025-11-06 17:59:12', '2025-11-06 17:59:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idvehiculo` bigint(20) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL COMMENT 'Nombres del propietario',
  `apellidos` varchar(100) DEFAULT NULL COMMENT 'Apellidos del propietario',
  `telefono` varchar(15) DEFAULT NULL COMMENT 'Número de teléfono',
  `email` varchar(100) DEFAULT NULL COMMENT 'Correo electrónico único',
  `tipo_documento` varchar(45) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL COMMENT 'Documento de identidad único',
  `razon_social` varchar(200) DEFAULT NULL,
  `direccion` text DEFAULT NULL COMMENT 'Dirección completa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`id`, `idvehiculo`, `nombres`, `apellidos`, `telefono`, `email`, `tipo_documento`, `documento`, `razon_social`, `direccion`, `created_at`, `updated_at`) VALUES
(1, 45, 'aaa', 'bbb', NULL, NULL, 'dni', '45787973', 'el Churro', '-', NULL, NULL),
(10, 47, NULL, NULL, NULL, NULL, 'RUC', '20608416341', 'MARTTINICORP S.A.C.', 'AV. JOSE CARLOS MARIATEGUI NRO. 2166 URB.  AGUA DE LAS VIRGENES  (A UNA CUADRA DEL PARADERO LA CALAVERA)', '2025-10-30 07:51:36', '2025-10-30 07:51:36'),
(11, 48, NULL, NULL, NULL, NULL, 'DNI', '45787973', 'ROSMEL ORTEGA QUINTE', '-', '2025-11-01 17:14:40', '2025-11-01 17:14:40'),
(12, 48, NULL, NULL, NULL, NULL, 'DNI', '45787973', 'ROSMEL ORTEGA QUINTE', '-', '2025-11-01 17:15:46', '2025-11-01 17:15:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `id_vehiculo` bigint(20) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`id`, `fecha_ingreso`, `hora_ingreso`, `id_vehiculo`, `placa`, `id_user`, `user`, `id_empresa`, `fecha`, `created_at`, `updated_at`) VALUES
(26, '2025-10-06', '15:10:50', 39, 'RRR-OOO', 5, 'Admin chicho', 4, '2025-10-06 15:53:58', '2025-10-06 20:53:58', '2025-10-06 20:53:58'),
(27, '2025-10-06', '15:12:26', 41, 'YYY-VVV', 5, 'Admin chicho', 4, '2025-10-06 15:54:45', '2025-10-06 20:54:45', '2025-10-06 20:54:45'),
(28, '2025-10-06', '15:28:27', 48, 'AAA-AAA', 5, 'Admin chicho', 4, '2025-10-06 15:56:47', '2025-10-06 20:56:47', '2025-10-06 20:56:47'),
(29, '2025-10-06', '15:13:22', 45, 'BBB-BBB', 5, 'Admin chicho', 4, '2025-10-06 15:58:05', '2025-10-06 20:58:05', '2025-10-06 20:58:05'),
(30, '2025-10-06', '15:22:59', 47, 'ZZZ-ZZZ', 5, 'Admin chicho', 4, '2025-10-06 15:58:37', '2025-10-06 20:58:37', '2025-10-06 20:58:37'),
(31, '2025-10-06', '16:14:41', 49, 'CCC-CCC', 5, 'Admin chicho', 4, '2025-10-06 16:14:54', '2025-10-06 21:14:54', '2025-10-06 21:14:54'),
(32, '2025-10-07', '12:16:10', 52, 'UUU-YYY', 1, 'admin', 4, '2025-10-07 13:23:24', '2025-10-07 18:23:24', '2025-10-07 18:23:24'),
(33, '2025-10-07', '11:23:33', 51, 'FFF-JJJ', 1, 'admin', 4, '2025-10-07 13:27:18', '2025-10-07 18:27:18', '2025-10-07 18:27:18'),
(34, '2025-10-06', '16:14:45', 50, 'DDD-DDD', 5, 'Admin chicho', 4, '2025-10-07 17:52:10', '2025-10-07 22:52:10', '2025-10-07 22:52:10'),
(35, '2025-10-06', '16:14:36', 48, 'AAA-AAA', 5, 'Admin chicho', 4, '2025-10-07 17:52:17', '2025-10-07 22:52:17', '2025-10-07 22:52:17'),
(39, '2025-10-07', '17:52:01', 54, 'SSS-TTT', 1, 'admin', 4, '2025-10-08 12:16:53', '2025-10-08 17:16:53', '2025-10-08 17:16:53'),
(40, '2025-10-07', '17:24:54', 53, 'GGG-DDD', 1, 'admin', 4, '2025-10-08 12:16:56', '2025-10-08 17:16:56', '2025-10-08 17:16:56'),
(42, '2025-10-13', '18:31:55', 154, 'SSS-VVV', 1, 'admin', 4, '2025-10-13 18:34:17', '2025-10-13 23:34:17', '2025-10-13 23:34:17'),
(43, '2025-10-13', '18:31:39', 153, 'AAA-HHH', 1, 'admin', 4, '2025-10-13 18:34:22', '2025-10-13 23:34:22', '2025-10-13 23:34:22'),
(44, '2025-10-13', '18:34:28', 153, 'AAA-HHH', 1, 'admin', 4, '2025-10-13 18:41:39', '2025-10-13 23:41:39', '2025-10-13 23:41:39'),
(45, '2025-10-13', '18:41:44', 153, 'AAA-HHH', 1, 'admin', 4, '2025-10-13 18:42:11', '2025-10-13 23:42:11', '2025-10-13 23:42:11'),
(46, '2025-10-13', '18:42:17', 153, 'AAA-HHH', 1, 'admin', 4, '2025-10-13 18:42:39', '2025-10-13 23:42:39', '2025-10-13 23:42:39'),
(47, '2025-10-13', '18:43:17', 153, 'AAA-HHH', 1, 'admin', 4, '2025-10-13 18:44:07', '2025-10-13 23:44:07', '2025-10-13 23:44:07'),
(48, '2025-10-13', '18:44:13', 153, 'AAA-HHH', 1, 'admin', 4, '2025-10-13 18:45:37', '2025-10-13 23:45:37', '2025-10-13 23:45:37'),
(49, '2025-10-15', '19:58:00', 158, '555-444', 1, 'admin', 4, '2025-10-15 20:08:56', '2025-10-16 01:08:56', '2025-10-16 01:08:56'),
(50, '2025-10-13', '17:32:30', 149, 'YYY-TTT', 1, 'admin', 4, '2025-10-15 20:09:11', '2025-10-16 01:09:11', '2025-10-16 01:09:11'),
(52, '2025-10-13', '17:25:03', 48, 'AAA-AAA', 1, 'admin', 4, '2025-10-15 20:25:53', '2025-10-16 01:25:53', '2025-10-16 01:25:53'),
(53, '2025-10-22', '13:29:54', 47, 'AAA-AAA', 5, 'Admin chicho', 4, '2025-10-30 02:50:43', '2025-10-30 07:50:43', '2025-10-30 07:50:43'),
(54, '2025-11-01', '12:32:33', 49, 'RRR-RRR', 1, 'admin', 4, '2025-11-02 11:59:18', '2025-11-02 16:59:18', '2025-11-02 16:59:18'),
(55, '2025-11-02', '12:16:24', 51, 'EEE-GGG', 1, 'admin', 4, '2025-11-02 14:33:49', '2025-11-02 19:33:49', '2025-11-02 19:33:49'),
(56, '2025-11-02', '11:59:28', 50, 'EEE-EEE', 1, 'admin', 4, '2025-11-02 23:27:28', '2025-11-03 04:27:28', '2025-11-03 04:27:28'),
(57, '2025-10-30', '11:39:10', 48, 'CCC-CCC', 5, 'Admin chicho', 4, '2025-11-02 23:29:37', '2025-11-03 04:29:37', '2025-11-03 04:29:37'),
(58, '2025-10-30', '02:50:58', 47, 'AAA-AAA', 1, 'admin', 4, '2025-11-02 23:30:18', '2025-11-03 04:30:18', '2025-11-03 04:30:18'),
(59, '2025-10-22', '13:33:18', 45, 'BBB-BBB', 41, 'saul', 4, '2025-11-02 23:30:39', '2025-11-03 04:30:39', '2025-11-03 04:30:39'),
(60, '2025-10-22', '13:29:50', 46, 'XYZ-789', 1, 'admin', 4, '2025-11-02 23:39:00', '2025-11-03 04:39:00', '2025-11-03 04:39:00'),
(61, '2025-11-02', '20:38:46', 52, 'SD-5432', 1, 'admin', 4, '2025-11-02 23:44:39', '2025-11-03 04:44:39', '2025-11-03 04:44:39'),
(62, '2025-11-03', '02:38:15', 57, 'TTT-SSS', 5, 'Admin chicho', 4, '2025-11-03 02:38:30', '2025-11-03 07:38:30', '2025-11-03 07:38:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` enum('activo','suspendido','inactivo') NOT NULL DEFAULT 'activo' COMMENT 'Estado del rol: activo, suspendido, inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Superusuario', 'activo', '2025-10-01 23:59:33', '2025-10-01 23:59:33'),
(2, 'Administrador General', 'activo', '2025-10-01 23:59:45', '2025-10-01 23:59:45'),
(3, 'Supervisor', 'activo', '2025-10-01 23:59:55', '2025-10-01 23:59:55'),
(4, 'Cajero', 'activo', '2025-10-03 06:13:17', '2025-10-03 06:13:17'),
(5, 'Vigilante', 'activo', '2025-10-03 06:13:25', '2025-10-03 06:13:25'),
(7, 'Apunta Placa', 'activo', '2025-11-03 12:37:49', '2025-11-03 12:37:49'),
(8, 'chambeador', 'activo', '2025-11-03 13:02:14', '2025-11-03 13:02:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `fecha_salida` date NOT NULL,
  `hora_salida` time NOT NULL,
  `tiempo` time DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tipo_pago` varchar(20) DEFAULT NULL,
  `id_registro` bigint(20) UNSIGNED DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `id_empresa` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`id`, `placa`, `user`, `fecha_salida`, `hora_salida`, `tiempo`, `precio`, `tipo_pago`, `id_registro`, `id_user`, `id_empresa`, `created_at`, `updated_at`) VALUES
(22, 'RRR-OOO', 'Admin chicho', '2025-10-06', '15:53:58', '00:43:07', 3, 'EFECTIVO', 26, 5, 4, '2025-10-06 20:53:58', '2025-10-06 20:53:58'),
(23, '	YYY-VVV', 'Admin chicho', '2025-10-06', '15:54:45', '00:42:18', 3, 'YAPE', 27, 5, 4, '2025-10-06 20:54:45', '2025-10-06 20:54:45'),
(24, 'AAA-AAA', 'Admin chicho', '2025-10-06', '15:56:47', '00:28:20', 3, 'EFECTIVO', 28, 5, 4, '2025-10-06 20:56:47', '2025-10-06 20:56:47'),
(25, 'BBB-BBB', 'Admin chicho', '2025-10-06', '15:58:05', '00:44:43', 3, 'EFECTIVO', 29, 5, 4, '2025-10-06 20:58:05', '2025-10-06 20:58:05'),
(26, 'ZZZ-ZZZ', 'Admin chicho', '2025-10-06', '15:58:37', '00:35:38', 3, 'EFECTIVO', 30, 5, 4, '2025-10-06 20:58:37', '2025-10-06 20:58:37'),
(27, 'CCC-CCC', 'Admin chicho', '2025-10-06', '16:14:54', '00:00:13', 3, 'EFECTIVO', 31, 5, 4, '2025-10-06 21:14:54', '2025-10-06 21:14:54'),
(28, 'UUU-YYY', 'admin', '2025-10-07', '13:23:24', '01:07:13', 6, 'EFECTIVO', 32, 1, 4, '2025-10-07 18:23:24', '2025-10-07 18:23:24'),
(29, 'FFF-JJJ', 'admin', '2025-10-07', '13:27:18', '00:00:00', 6, 'YAPE', 33, 1, 4, '2025-10-07 18:27:18', '2025-10-07 18:27:18'),
(30, 'DDD-DDD', 'Admin chicho', '2025-10-07', '17:52:10', '00:00:00', 78, 'EFECTIVO', 34, 5, 4, '2025-10-07 22:52:10', '2025-10-07 22:52:10'),
(31, 'AAA-AAA', 'Admin chicho', '2025-10-07', '17:52:17', '00:00:00', 78, 'YAPE', 35, 5, 4, '2025-10-07 22:52:17', '2025-10-07 22:52:17'),
(35, 'SSS-TTT', 'admin', '2025-10-08', '12:16:53', '00:00:00', 95, 'EFECTIVO', 39, 1, 4, '2025-10-08 17:16:53', '2025-10-08 17:16:53'),
(36, 'GGG-DDD', 'admin', '2025-10-08', '12:16:56', '00:00:00', 380, 'EFECTIVO', 40, 1, 4, '2025-10-08 17:16:56', '2025-10-08 17:16:56'),
(38, 'SSS-VVV', 'admin', '2025-10-13', '18:34:17', '00:00:00', 3, 'EFECTIVO', 42, 1, 4, '2025-10-13 23:34:17', '2025-10-13 23:34:17'),
(39, 'AAA-HHH', 'admin', '2025-10-13', '18:34:22', '00:00:00', 3, 'EFECTIVO', 43, 1, 4, '2025-10-13 23:34:22', '2025-10-13 23:34:22'),
(40, 'AAA-HHH', 'admin', '2025-10-13', '18:41:39', '00:00:00', 3, 'YAPE', 44, 1, 4, '2025-10-13 23:41:39', '2025-10-13 23:41:39'),
(41, 'AAA-HHH', 'admin', '2025-10-13', '18:42:11', '00:00:00', 3, 'YAPE', 45, 1, 4, '2025-10-13 23:42:11', '2025-10-13 23:42:11'),
(42, 'AAA-HHH', 'admin', '2025-10-13', '18:42:39', '00:00:00', 3, 'EFECTIVO', 46, 1, 4, '2025-10-13 23:42:39', '2025-10-13 23:42:39'),
(43, 'AAA-HHH', 'admin', '2025-10-13', '18:44:07', '00:00:00', 3, 'YAPE', 47, 1, 4, '2025-10-13 23:44:07', '2025-10-13 23:44:07'),
(44, 'AAA-HHH', 'admin', '2025-10-13', '18:45:37', '00:00:00', 3, 'EFECTIVO', 48, 1, 4, '2025-10-13 23:45:37', '2025-10-13 23:45:37'),
(45, '555-444', 'admin', '2025-10-15', '20:08:56', '00:00:00', 3, 'EFECTIVO', 49, 1, 4, '2025-10-16 01:08:56', '2025-10-16 01:08:56'),
(46, 'YYY-TTT', 'admin', '2025-10-15', '20:09:11', '00:00:00', 153, 'EFECTIVO', 50, 1, 4, '2025-10-16 01:09:11', '2025-10-16 01:09:11'),
(48, 'AAA-AAA', 'admin', '2025-10-15', '20:25:53', '00:00:00', 156, 'EFECTIVO', 52, 1, 4, '2025-10-16 01:25:53', '2025-10-16 01:25:53'),
(49, 'AAA-AAA', 'Admin chicho', '2025-10-30', '02:50:43', '00:00:00', 546, 'YAPE', 53, 5, 4, '2025-10-30 07:50:43', '2025-10-30 07:50:43'),
(50, 'RRR-RRR', 'admin', '2025-11-02', '11:59:18', '00:00:00', 72, 'EFECTIVO', 54, 1, 4, '2025-11-02 16:59:18', '2025-11-02 16:59:18'),
(51, 'EEE-GGG', 'admin', '2025-11-02', '14:33:49', '00:00:00', 9, 'EFECTIVO', 55, 1, 4, '2025-11-02 19:33:49', '2025-11-02 19:33:49'),
(52, 'EEE-EEE', 'admin', '2025-11-02', '23:27:28', '00:00:00', 36, 'YAPE', 56, 1, 4, '2025-11-03 04:27:28', '2025-11-03 04:27:28'),
(53, 'CCC-CCC', 'Admin chicho', '2025-11-02', '23:29:37', '00:00:00', 252, 'YAPE', 57, 5, 4, '2025-11-03 04:29:37', '2025-11-03 04:29:37'),
(54, 'AAA-AAA', 'admin', '2025-11-02', '23:30:18', '00:00:00', 279, 'TARJETA', 58, 1, 4, '2025-11-03 04:30:18', '2025-11-03 04:30:18'),
(55, 'BBB-BBB', 'saul', '2025-11-02', '23:30:39', '00:00:00', 548, 'TARJETA', 59, 41, 4, '2025-11-03 04:30:39', '2025-11-03 04:30:39'),
(56, 'XYZ-789', 'admin', '2025-11-02', '23:39:00', '00:00:00', 4125, 'TARJETA', 60, 1, 4, '2025-11-03 04:39:00', '2025-11-03 04:39:00'),
(57, 'SD-5432', 'admin', '2025-11-02', '23:44:39', '03:05:53', 12, 'TARJETA', 61, 1, 4, '2025-11-03 04:44:39', '2025-11-03 04:44:39'),
(58, 'TTT-SSS', 'Admin chicho', '2025-11-03', '02:38:30', '00:00:15', 3, 'YAPE', 62, 5, 4, '2025-11-03 07:38:30', '2025-11-03 07:38:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1y6YVoljzl2hH4iTkBhuOyEDWZpAf10JjFZz7bI2', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSHdRcFRSdFdIcFZ6ald0NjJUSm8xcUhJbFduOWtWaHB5RExRTDhFcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451827),
('2q1lzFs7zTtkV4iLUeGTKfDqyLoxXDDEQHM6c2mR', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUEyYXJ1SzJVeDdQU3BrZWlaMlIyWlRkMzNpeGhDVzZ4YmpuYWhRcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362342),
('4pssczcb9oXx54ME4OEFSVhpDBlwBTnTdMf1X2w6', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoialNFMEQ5WDFHMGZmWVNqMEJVWmxBaHRGVUM1dzRES0ZpbkR5Qnd2ZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762211303),
('4UVR6QKxdwFSFaD8KYoguUk6xX9vICREgi7YfKEv', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHBJWTZBSnZkSUxGaElrWnBTSVF5NFBwT1ZKTlF2TWx0elQ1S00zUSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762362340),
('AxXqnbBfYYK1c75XZhLKjp8uwguGvNdQiyyO2A0y', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2c3b3hFRGJWWVZpaXo5aXc3S1RLbFQ4bzlIcWZnSnRoalZuMkpJdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762451827),
('D8LTg3TjmjfvST4cikJYYB6f4M59pLeDopkCqmpZ', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRVpJcWMxRmhiSDlzNFhlQTRyczhNQWs5cTRvMU10SHpPc0J2aFpzeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362342),
('dv5RZSbVXN8NFbc40hw667QszXnleSMeEaC0kw5i', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUI3SEhTUHBBNmdyOW1zUEJQOVZWU0U3TUtWMmp0MTdZTDlCS2RPZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362417),
('E1vYTZkZrCGmwmYS900RFtyyWfccJdPDi8cetBFC', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjBYeWhaakxxVlc1SnVEaUpDdVdqd1k4ZlNJdGw2QktlMU95Wjd3ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362424),
('gbGwtjX0CpaoCSVbaSklsrB3WcraqsXv8aQLqIOE', 43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzFtU1NpbnpieVN4b2M1ZE1VenNwTTVvWWVHMk1LUnVOSXNXRmZhbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNDMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762451954),
('gd4VJdtIvAX9GHzDUOtPee5K3a0tck1i5sEPNJVX', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicG1JbU1KVk8weWxDcXNTanZuakNGalgwUzBIWlZnY2pzTkpTZm5yVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362342),
('GsKLjDWcAHMgrP3L5wQUZFC1iJFbDac3wZGDTtTK', 43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNDdDQVNLMmxTcGVWTTFWZFN0Zk5BSEhQQjZyYU9VTGg3TE5pYTJDZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451954),
('igCWJInTE3fubolYZd5dllGzbLDqbjRpfPanf5do', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTTk3OGpFSnhQODFueU1WNWExQnRwd1dkbHd3ZEYyeFVkWktCanJaZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362433),
('iPrxqiC8UigOkpiHi0SMgHp48CjZlze67BFfzCs6', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMkw1VWVKQXE4TFNwVUFGQUlxOU81bjRPR202NElRaVhXbGlrem1GTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362416),
('jeWnv7oaOqJnYlAgBJFbvZ0DMVQscS3hXMBeOvp7', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0ZYaThuZnYzTkI0anNqVmNXZklEN011WVpLMGlOMG84ZU1GWENzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762451826),
('Ju68ylRbqVIXl9INAVlIQpvcuQ6GCsGfxq7eKOL9', 43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibURHZUV4N2xLVFRLS00xU2lSSUV1Y2lhbVpwWDhMQngwMERCOEF5NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNDMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762451953),
('L2sKgVTO7xIsezEML3cuThVV1AGtYb0ygnUmv6m7', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoienpEcWFBMUw4M0hib0s3d013R0F0ME9tSUt1blVSeXhndXpaUzdQMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362417),
('laIvJQHNmvGYAuxVTPCJRgqHiQdMxXHNKKV1r0SQ', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiODR3NDRrUFFrRVB1eFdvSko0aEhwQTQ4aEhvS2RxWWRLRllFZHR0SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362424),
('LodRC9ndbSZEpa3njtGUqvaZmXUjPcR1CdnV4oQT', 43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1NTNmx5VW5QTjZWbFNma1VEQlcwYzFDQXdxTTdEZTdXQXhFUzgweCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDM7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451952),
('M6hdJE7VGHchvyUQD1gnqSOMrYIkPFIRwyi8p1ju', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYzJ4Y1J4V0tzalhsTEl0cnRaanhESWFwYkxjdVBGZDRXMW1lOWVzMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362424),
('og0FdetqlLq6kNWfsRqkrXrwFWWuhMGjDon4ALSg', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1NKd3hDbXNGanZWckhlUGx5NFpUNzVSYU5xQnVRcTNDNWZHWks2bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762211303),
('OXVAwAUPZDo8hoESzSNtOQzpb5JugwX7Qbe9mrwz', 43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVjlQNktoZVNOR1pWWnE3emcwMFZVNzh4WGV1WkR2dURLamE3TXh0ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451953),
('PXDAox4NzDRGKX1sfiAs30Hbmrcb41KCWmjGKXVP', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODFuOFZTNlRxNDBRMUM4RXZCRW9DZ3BPaHU3ODBVbHNDVm90WlQzVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362416),
('QiyUw07BukuCB0pZpDuw5l4NjZ1hjuiPfH1Cwduv', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVhUYlU2ZERzMFdGUXdRTkRJNDhxVmh3dHBWYjgxYW1IcjhzeDEwRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762211304),
('qXb06brygZxoghNQCHPoFcxM8huf7iYnksBhfvlL', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieEdvQ0FzTU5CZ1JPMmhsaHNnNlVwc24xTWNRbGxQdVBxcnVCOXZDOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762211303),
('Sog5nYX6CEQLPBjHrU1cNU2CQoLGHm918NDsDZcI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ0FYQ2NMcGVyV0NqSU8yVEJDMkdpUGx5YVRsN2tVVXoyb25vR1h4VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451899),
('SQgLx0R9xlVYMhX3EzupZoMs89JDSJwgpJ4ZSrOu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWXpKYXhOalkwNmQwYnZXQzNrMWZ6MlV2Q0hyaHRWNFdTUWxuU0ZCUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451869),
('szx4gkwesIQXHKAXiQNwRyKgANAmZTrhVURe7OsN', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekNteG9rTzlyZVgzWndYdXdBbWUxSG84N1FqbWlRZnBmandORTVkNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362424),
('TuVLiB1XIqFnv6f8XvHjtMFqnAfvMbDWtx31zuyf', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVlzYWxOcnNlZFVhZmI1cjFMRzZwZkJQR1JIckRRU3oycEZYOGg5UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762362433),
('UGUKSJw7R8UrUvhcJFDPkuRM9lCv2wdchhqNE5NE', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnE2c2Q1a2YzMGR4RHpNZVp4bkRMNnQ1SkFwaU41MzkzRzgxdzg0YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362433),
('VK0flvhWHTfVBPxTLRywlkBLJ9p6OPVyavp8Xqd0', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicHRKYmRUdE4yRmRHNk5YYjk0TGlnSVFtYWZmYkhCYkhUTG12a3JBMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451826),
('vQGLAPuJTWybPKEv2evDocOErkFyhhbtXwJq96lp', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTNhWHlmcmNySHB3NXZRQm1VT2tDN0xCVktwckdxcHZyUVF4ckQ1TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362342),
('x5Ps96fHnU2MGXq6rFsFHKaja8a1iU3gNTQuZXYd', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUFQQUtBaGM3TlVSSkJQdTRBMW56TEF5dnV2dlpqYmk0ZEZxSmNLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762362434),
('y5KgGrbTcpWfm3C0Pvz8kAHDCsB5tZJMGGVS4mB5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibkRNZnZDWVUzbDNWTU55RGRuSk1BZUhTRUdkUTBPWlNiM1NHRUdCRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762451906),
('YYdcWdNtjHfXt2bb5pS0ugR0pvUZOdxd6tBBXiYm', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzlSREE3a3JobWhURU9HQmFUVHcyc2ZZRXJuaUNLWHE2ZlpVWGRwUCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762451825),
('ZVdshNdcDmipzwhdFQdEIVpITSxTfx2w97WG8qDT', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmkxcEpEUk9DSERmTFg0V3dWcWs4c0ZscDZobjFCdXBhSkM3MnBPUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGVybWlzc2lvbnMvdXNlcnMvNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762211304);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscribers`
--

CREATE TABLE `suscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculos`
--

CREATE TABLE `tipo_vehiculos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del tipo de vehículo',
  `valor` double DEFAULT NULL COMMENT 'Valor asociado al tipo de vehículo',
  `id_empresa` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_vehiculos`
--

INSERT INTO `tipo_vehiculos` (`id`, `nombre`, `valor`, `id_empresa`, `created_at`, `updated_at`) VALUES
(1, 'Nuevo', 3, 4, '2025-10-02 00:09:58', '2025-10-02 00:09:58'),
(2, 'Auto', 3, 4, '2025-10-02 00:09:58', '2025-10-02 00:09:58'),
(3, 'Moto', 2, 4, '2025-10-02 00:26:02', '2025-10-02 00:26:02'),
(8, 'Canoa', 15, 4, '2025-10-05 17:11:26', '2025-10-05 17:14:03'),
(17, 'Nuevo', 3, 33, '2025-11-06 17:57:48', '2025-11-06 17:57:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tolerancia`
--

CREATE TABLE `tolerancia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `minutos` int(11) DEFAULT NULL COMMENT 'Minutos de tolerancia',
  `descripcion` varchar(100) NOT NULL,
  `id_empresa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tolerancia`
--

INSERT INTO `tolerancia` (`id`, `minutos`, `descripcion`, `id_empresa`, `created_at`, `updated_at`) VALUES
(1, 5, 'General', 4, '2025-10-02 00:09:45', '2025-10-08 17:55:14'),
(7, 23, 'Generald', 10, '2025-10-04 18:09:34', '2025-10-04 18:09:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `idrol` bigint(20) DEFAULT NULL,
  `id_company` bigint(20) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `idrol`, `id_company`, `estado`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$rV9O8jTRn4iIy/L4TyCxN.tpAtE4CSWoS/EFsW6CgmILdJ5OX3jCS', 1, 4, 'ACTIVO', NULL, '2025-10-01 23:46:24', '2025-10-01 23:46:24'),
(5, 'Admin chicho', 'admin@chicho.com', NULL, '$2y$12$/Co2JmtbUp5S2zJTscJiD.YqZ5od.ad5k3wCLEqmXcrmQYKZ2tv6i', 2, 4, 'SUSPENDIDO', NULL, '2025-10-02 00:00:00', '2025-10-03 07:12:47'),
(15, 'secretario', 'admin@gmail.com.com', NULL, '$2y$12$bzJjdsyTnjYOfDln/cLso.A/OcGlimfCW4Y43nuxYw3ghlJrmch5C', 2, 4, 'SUSPENDIDO', NULL, '2025-10-03 06:11:24', '2025-10-03 07:12:38'),
(41, 'saul', 'saul@gmail.com', NULL, '$2y$12$n9c7IrtGZdjLllQoExzkGenCQRmI6QV/M2dkXAs0CGzYXqtcXs1zy', 5, 4, 'ACTIVO', NULL, '2025-10-22 18:31:53', '2025-10-22 18:31:53'),
(42, 'Admin Test', 'admin@test.com', NULL, '$2y$12$M1iUFjZ7BH5N9FTPvXj1B.qZm4HtoaSTBt84pqgWraAv/GCFVlzt6', NULL, 1, NULL, NULL, '2025-10-26 19:37:13', '2025-10-26 19:37:13'),
(43, 'Admin cochera lima', 'admin@cocheralima.com', NULL, '$2y$12$uW1gkCvZ/hGw6I3gnOQk6u86A156twPGHGbE9PWnavlupCW2gw/Ni', 2, 33, 'ACTIVO', NULL, '2025-11-06 17:57:48', '2025-11-06 17:57:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 15, 1, '2025-10-22 07:04:56', '2025-10-22 07:04:56'),
(2, 15, 2, '2025-10-22 07:04:56', '2025-10-22 07:04:56'),
(6, 15, 14, '2025-10-22 07:04:56', '2025-10-22 07:04:56'),
(7, 15, 15, '2025-10-22 07:04:56', '2025-10-22 07:04:56'),
(8, 15, 16, '2025-10-22 07:04:56', '2025-10-22 07:04:56'),
(9, 15, 17, '2025-10-22 07:04:56', '2025-10-22 07:04:56'),
(19, 1, 1, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(20, 1, 14, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(21, 1, 16, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(22, 1, 17, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(24, 1, 32, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(27, 1, 36, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(32, 1, 28, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(33, 1, 29, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(37, 1, 15, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(38, 1, 10, '2025-10-22 17:52:48', '2025-10-22 17:52:48'),
(42, 5, 28, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(43, 5, 29, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(44, 5, 10, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(48, 5, 36, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(50, 5, 32, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(54, 5, 17, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(55, 5, 16, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(56, 5, 14, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(57, 5, 15, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(58, 5, 1, '2025-10-22 17:53:12', '2025-10-22 17:53:12'),
(59, 1, 2, '2025-10-22 18:13:21', '2025-10-22 18:13:21'),
(63, 1, 6, '2025-10-22 18:13:21', '2025-10-22 18:13:21'),
(65, 1, 18, '2025-10-22 18:13:21', '2025-10-22 18:13:21'),
(66, 1, 20, '2025-10-22 18:13:21', '2025-10-22 18:13:21'),
(70, 1, 24, '2025-10-22 18:13:21', '2025-10-22 18:13:21'),
(74, 1, 30, '2025-10-22 18:13:21', '2025-10-22 18:13:21'),
(76, 5, 30, '2025-10-22 18:13:41', '2025-10-22 18:13:41'),
(77, 5, 2, '2025-10-22 18:13:41', '2025-10-22 18:13:41'),
(78, 5, 6, '2025-10-22 18:13:41', '2025-10-22 18:13:41'),
(79, 5, 18, '2025-10-22 18:13:41', '2025-10-22 18:13:41'),
(80, 5, 20, '2025-10-22 18:13:41', '2025-10-22 18:13:41'),
(82, 5, 24, '2025-10-22 18:13:41', '2025-10-22 18:13:41'),
(83, 41, 14, '2025-10-22 18:32:17', '2025-10-22 18:32:17'),
(84, 41, 15, '2025-10-22 18:41:11', '2025-10-22 18:41:11'),
(85, 41, 16, '2025-10-22 18:41:11', '2025-10-22 18:41:11'),
(86, 41, 1, '2025-10-22 18:41:11', '2025-10-22 18:41:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `placa` varchar(15) DEFAULT NULL COMMENT 'Placa del vehículo (única)',
  `modelo` varchar(50) DEFAULT NULL COMMENT 'Modelo del vehículo',
  `marca` varchar(50) DEFAULT NULL COMMENT 'Marca del vehículo',
  `color` varchar(30) DEFAULT NULL COMMENT 'Color del vehículo',
  `anio` year(4) DEFAULT NULL COMMENT 'Año del vehículo',
  `frecuencia` int(11) DEFAULT NULL,
  `tipo_vehiculo_id` bigint(20) DEFAULT NULL COMMENT 'Relación con tipo de vehículo',
  `id_empresa` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idcliente` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `modelo`, `marca`, `color`, `anio`, `frecuencia`, `tipo_vehiculo_id`, `id_empresa`, `created_at`, `updated_at`, `idcliente`) VALUES
(39, 'RRR-OOO', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-10-06 20:10:50', '2025-10-06 20:10:50', NULL),
(41, 'YYY-VVV', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-10-06 20:12:26', '2025-10-06 20:12:26', NULL),
(45, 'BBB-BBB', NULL, NULL, NULL, NULL, 4, 3, 4, '2025-10-06 20:13:22', '2025-10-22 18:33:18', NULL),
(46, 'XYZ-789', '2023', 'Honda', 'Negro', '2023', 1, 8, 4, '2025-10-22 18:29:50', '2025-10-22 18:34:10', NULL),
(47, 'AAA-AAA', NULL, NULL, NULL, NULL, 4, 1, 4, '2025-10-22 18:29:54', '2025-11-03 05:48:03', NULL),
(48, 'CCC-CCC', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-10-30 16:39:10', '2025-10-30 16:39:10', NULL),
(49, 'RRR-RRR', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-01 17:32:33', '2025-11-01 17:32:33', NULL),
(50, 'EEE-EEE', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-02 16:59:28', '2025-11-02 16:59:28', NULL),
(51, 'EEE-GGG', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-02 17:16:24', '2025-11-02 17:16:24', NULL),
(52, 'SD-5432', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-03 04:38:46', '2025-11-03 04:38:46', NULL),
(53, 'VVV-RRR', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-03 05:37:04', '2025-11-03 05:37:04', NULL),
(54, 'RRR-DDD', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-03 05:47:26', '2025-11-03 05:47:26', NULL),
(55, 'TTT-DDD', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-03 05:47:34', '2025-11-03 05:47:34', NULL),
(56, 'DDD-AAA', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-03 05:49:11', '2025-11-03 05:49:11', NULL),
(57, 'TTT-SSS', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-03 07:38:15', '2025-11-03 07:38:15', NULL),
(58, 'AAA-SSS', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-11-03 10:23:24', '2025-11-03 10:23:24', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_id_user_index` (`id_user`),
  ADD KEY `ingresos_id_empresa_index` (`id_empresa`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `observaciones_id_vehiculo_index` (`id_vehiculo`),
  ADD KEY `observaciones_id_empresa_index` (`id_empresa`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propietarios_documento_index` (`documento`),
  ADD KEY `propietarios_email_index` (`email`),
  ADD KEY `propietarios_apellidos_nombres_index` (`apellidos`,`nombres`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registros_id_vehiculo_index` (`id_vehiculo`),
  ADD KEY `registros_id_user_index` (`id_user`),
  ADD KEY `registros_id_empresa_index` (`id_empresa`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salidas_id_ingreso_index` (`id_registro`),
  ADD KEY `salidas_id_user_index` (`id_user`),
  ADD KEY `salidas_id_empresa_index` (`id_empresa`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `suscribers`
--
ALTER TABLE `suscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suscribers_email_unique` (`email`);

--
-- Indices de la tabla `tipo_vehiculos`
--
ALTER TABLE `tipo_vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo_vehiculos_nombre_id_empresa_unique` (`nombre`,`id_empresa`);

--
-- Indices de la tabla `tolerancia`
--
ALTER TABLE `tolerancia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tolerancia_descripcion_id_empresa_unique` (`descripcion`,`id_empresa`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_idrol_index` (`idrol`),
  ADD KEY `users_id_company_index` (`id_company`);

--
-- Indices de la tabla `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_permissions_user_id_permission_id_unique` (`user_id`,`permission_id`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `suscribers`
--
ALTER TABLE `suscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculos`
--
ALTER TABLE `tipo_vehiculos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tolerancia`
--
ALTER TABLE `tolerancia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `fk_salidas_registros` FOREIGN KEY (`id_registro`) REFERENCES `registros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
