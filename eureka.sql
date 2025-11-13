-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2025 a las 13:24:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eureka`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'TECNOLOGIA', 'assets/images/categorias/20220805093011.jpg', 1),
(2, 'MOUSES', 'assets/images/categorias/20220805093028.jpg', 1),
(3, 'PARLANTES', 'NO', 1),
(4, 'COMPUTADORES', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(3, 'ANGEL SIFUENTES', 'lovenaju2@gmail.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', '21a66551b83c814b108081b292dc65d2', 1),
(4, 'VIDA INFORMATICO', 'admin@angelsifuentes.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', NULL, 1),
(5, 'JUAN ANGEL', 'prueba@gmail.com', '$2y$10$rr24uW0VypkrDEhooFRsoOli/Pcm5NR5F8D9NARgQz0l1UfPkqV1q', 'default.png', 'c81b5136bcd10b4390108c979ed28ee6', 1),
(9, 'yeyher', 'yeyherjordanmoreno@gmail.com', '$2y$10$FKaYkS8Y72EMc52oHyjylO9KSa6Si1gHMG6NbvgRXkZtSolfD88NW', 'default.png', '2ccdaf2d5594d7655b05da177c56a794', 0),
(10, 'Jordan', 'cocoacarabali@gmail.com', '$2y$10$iAVfsiJYSw6JEbWhrfHaBOF0QANjStdsjAmvFArYwXKoSeOermx46', 'default.png', NULL, 0),
(11, 'Dashreyes', 'dasreyes2024@gmail.com', '$2y$10$NLwhpxkath7AXsB7NpqpI.JltvrNSyLF0Hv9c9cpP00RszJ2IzEh.', 'default.png', 'dfff907197f1f44b23e49272e4ea0ab0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'Mouse HP X1000 con Cable', 19990.00, 1, 1, 26),
(2, 'Mouse Genius DX-110', 19990.00, 1, 2, 54),
(3, 'Mouse Genius DX-110', 19990.00, 1, 3, 54),
(4, 'Parlante JBL flip 4', 149990.00, 1, 4, 59),
(5, 'Cámara Web Redragon Hitman GW800', 99990.00, 1, 5, 45),
(6, 'Cámara Web Genius WideCam F100', 149990.00, 2, 5, 46),
(7, 'Cámara Web Redragon Hitman GW800', 99990.00, 1, 6, 45),
(8, 'Cámara Web Nexxt Solutions NHC-E610', 84990.00, 1, 7, 47),
(9, 'Portátil Chuwi HeroBook Pro', 799990.00, 1, 8, 74),
(10, 'Cámara Web Microsoft LifeCam HD-3000', 119990.00, 1, 9, 44),
(11, 'Mouse Microsoft Bluetooth Ergonomic', 139990.00, 1, 10, 25),
(12, 'Mouse HP X1000 con Cable', 19990.00, 1, 11, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(1, '18J88067K05369119', 19990.00, 'COMPLETED', '2025-06-02 03:30:57', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'AV. LOS PERDIDOS N° 121', 'AYACUCHO', 10, '3'),
(2, '20N27935L6731804M', 19990.00, 'COMPLETED', '2025-06-02 03:37:25', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'AV. LOS PERDIDOS N° 121', 'AYACUCHO', 10, '3'),
(3, '4VF36557FB293751U', 19990.00, 'COMPLETED', '2025-06-03 13:47:12', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'AV. LOS PERDIDOS N° 121', 'AYACUCHO', 10, '3'),
(4, '2MN64650R9249652B', 149990.00, 'COMPLETED', '2025-06-03 14:26:33', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'AV. LOS PERDIDOS N° 121', 'AYACUCHO', 10, '1'),
(5, '3GJ751670F759031F', 399970.00, 'COMPLETED', '2025-06-03 14:29:01', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'AV. LOS PERDIDOS N° 121', 'AYACUCHO', 10, '1'),
(6, '4TX52193N29174055', 99990.00, 'COMPLETED', '2025-06-04 16:53:41', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'AV. LOS PERDIDOS N° 121', 'AYACUCHO', 10, '1'),
(7, '1WN151532P683803W', 84990.00, 'COMPLETED', '2025-10-01 01:28:56', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', '365', 'lima', 11, '3'),
(8, '5DY16660NH692144K', 799990.00, 'COMPLETED', '2025-10-01 01:30:12', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', '365', 'lima', 11, '2'),
(9, '8655712651483601S', 119990.00, 'COMPLETED', '2025-11-13 01:22:34', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', '365', 'lima', 11, '3'),
(10, '81V8612737363454B', 139990.00, 'COMPLETED', '2025-11-13 01:32:20', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', '365', 'lima', 11, '3'),
(11, '1N332721F0664382J', 19990.00, 'COMPLETED', '2025-11-13 01:49:08', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', '365', 'lima', 11, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `precio_oferta` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `precio_oferta`, `cantidad`, `imagen`, `estado`, `id_categoria`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'PARLANTE HILON', 'PARLANTE HILON\r\n', 180000.00, 150000.00, 10, 'assets/images/productos/20220805093212.jpg', 1, 3, NULL, NULL),
(2, 'CAMARA WEB', 'CAMARA WEB', 35000.00, NULL, 15, 'assets/images/productos/20220805093304.jpg', 1, 1, NULL, NULL),
(3, 'TELEVISOR LG', 'TELEVISOR LG', 1800000.00, NULL, 40, 'assets/images/productos/20220805093355.jpg', 1, 1, NULL, NULL),
(4, 'MICROFONO', 'MICROFONO', 200000.00, NULL, 5, 'assets/images/productos/20220805093426.jpg', 1, 1, NULL, NULL),
(5, 'LAPTOP LENOVO', 'LAPTOP LENOVO', 1200000.00, NULL, 12, 'assets/images/productos/20220805093535.jpg', 1, 4, NULL, NULL),
(10, 'Computador Portátil LENOVO', 'Computador Portátil LENOVO 15.6\" Pulgadas IdeaPad Slim 3 Táctil - Intel Core i5 - RAM 16GB - Disco SSD 512GB - Gris', 2299000.00, NULL, 12, 'assets\\images\\productos\\Computador Portátil LENOVO.jpg', 1, 4, NULL, NULL),
(11, 'Portátil HP', 'Intel Core i5, 16 GB, 1 TB SSD, 15.6\" FHD, Windows 11 Home', 2500939.00, NULL, 10, 'assets\\images\\productos\\Portátil HP.jpg', 1, 4, NULL, NULL),
(12, 'Portátil Asus', 'AMD Ryzen 5-7520U, Serie 7000, 16 GB DDR5, 512 GB SSD, 15.6\" FHD, Endless OS', 1845990.00, NULL, 10, 'assets\\images\\productos\\Portatil Asus.jpg', 1, 4, NULL, NULL),
(13, 'Portátil Dell Inspiron 15 3000', 'Intel Core i3 1115G4, 8 GB RAM, 256 GB SSD, 15.6\" HD, Windows 11 Home', 1499990.00, NULL, 15, 'assets\\images\\productos\\Portátil Dell Inspiron 15 3000.jpeg', 1, 4, NULL, NULL),
(14, 'Portátil Acer Aspire 5 A515', 'AMD Ryzen 7 5700U, 12 GB RAM, 512 GB SSD, 15.6\" FHD, Linux', 2149990.00, NULL, 12, 'assets\\images\\productos\\Portátil Acer Aspire 5 A515.jpeg', 1, 4, NULL, NULL),
(15, 'Portátil Huawei MateBook D14', 'Intel Core i5 1135G7, 8 GB RAM, 512 GB SSD, 14\" FHD, Windows 11', 2399990.00, NULL, 8, 'assets\\images\\productos\\Portátil Huawei MateBook D14.jpeg', 1, 4, NULL, NULL),
(16, 'Portátil MSI Modern 14', 'Intel Core i7 1255U, 16 GB RAM, 512 GB SSD, 14\" FHD, FreeDOS', 2899990.00, NULL, 6, 'assets\\images\\productos\\Portátil MSI Modern 14.jpeg', 1, 4, NULL, NULL),
(17, 'Portátil Apple MacBook Air M1', 'Apple M1 chip, 8 GB RAM, 256 GB SSD, 13.3\" Retina, macOS', 4399990.00, NULL, 5, 'assets\\images\\productos\\Portátil Apple MacBook Air M1.jpeg', 1, 4, NULL, NULL),
(18, 'Adaptador WiFi TP-Link Archer T2U', 'Adaptador USB Doble Banda AC600, 2.4GHz y 5GHz, Alta Velocidad', 69990.00, NULL, 29, 'assets\\images\\productos\\Adaptador WiFi TP-Link Archer T2U.jpeg', 1, 1, NULL, NULL),
(19, 'Adaptador WiFi ASUS USB-AC53 Nano', 'WiFi AC1200, USB 2.0, diseño compacto, doble banda', 99990.00, NULL, 20, 'assets\\images\\productos\\Adaptador WiFi ASUS USB-AC53 Nano.jpeg', 1, 1, NULL, NULL),
(20, 'Adaptador WiFi Mercusys MW300UM', 'WiFi N300 Mbps, USB 2.0, compatible con Windows, Linux', 45990.00, NULL, 50, 'assets\\images\\productos\\Adaptador WiFi Mercusys MW300UM.jpeg', 1, 1, NULL, NULL),
(21, 'Adaptador WiFi Netgear A6210', 'WiFi USB 3.0, Doble Banda AC1200, antena ajustable', 129990.00, NULL, 10, 'assets\\images\\productos\\Adaptador WiFi Netgear A6210.jpeg', 1, 1, NULL, NULL),
(22, 'Adaptador WiFi UGREEN CM492', 'WiFi 1300 Mbps, Dual Band, USB 3.0, antena externa de alto alcance', 114990.00, NULL, 15, 'assets\\images\\productos\\Adaptador WiFi UGREEN CM492.jpeg', 1, 1, NULL, NULL),
(23, 'Mouse Logitech M170 Inalámbrico', 'Mouse inalámbrico 2.4 GHz, compacto, color negro', 37990.00, NULL, 40, 'assets\\images\\productos\\Mouse Logitech M170 Inalámbrico.jpeg', 1, 2, NULL, NULL),
(24, 'Mouse Razer DeathAdder Essential', 'Mouse gamer con sensor óptico de 6400 DPI, ergonómico', 104990.00, NULL, 25, 'assets\\images\\productos\\Mouse Razer DeathAdder Essential.jpeg', 1, 2, NULL, NULL),
(25, 'Mouse Microsoft Bluetooth Ergonomic', 'Diseño ergonómico, Bluetooth, hasta 12 meses de batería', 139990.00, NULL, 15, 'assets\\images\\productos\\Mouse Microsoft Bluetooth Ergonomi.jpeg', 1, 2, NULL, NULL),
(26, 'Mouse HP X1000 con Cable', 'Mouse óptico con cable USB, 3 botones, diseño clásico', 19990.00, NULL, 60, 'assets\\images\\productos\\Mouse HP X1000 con Cable.jpeg', 1, 2, NULL, NULL),
(27, 'Mouse Logitech G203 Lightsync RGB', 'Mouse gamer con iluminación RGB, sensor 8000 DPI', 84990.00, NULL, 30, 'assets\\images\\productos\\Mouse Logitech G203 Lightsync RGB.jpeg', 1, 2, NULL, NULL),
(28, 'Parlantes Logitech Z313', 'Sistema de altavoces 2.1 con subwoofer, 50W de potencia', 159990.00, NULL, 20, 'assets\\images\\productos\\Parlantes Logitech Z313.jpeg', 1, 3, NULL, NULL),
(29, 'Parlante JBL GO 3', 'Bluetooth, portátil, resistente al agua, batería de hasta 5 horas', 124990.00, NULL, 35, 'assets\\images\\productos\\Parlante JBL GO 3.jpeg', 1, 3, NULL, NULL),
(30, 'Parlantes Genius SP-HF1800A', 'Sistema estéreo 2.0, 50W RMS, entrada RCA y jack 3.5mm', 189990.00, NULL, 9, 'assets\\images\\productos\\Parlantes Genius SP-HF1800A.jpeg', 1, 3, NULL, NULL),
(31, 'Parlante Bose SoundLink Flex', 'Bluetooth, resistente al agua y al polvo, sonido envolvente', 549990.00, NULL, 8, 'assets\\images\\productos\\Parlante Bose SoundLink Flex.jpeg', 1, 3, NULL, NULL),
(32, 'Parlante Xiaomi Mi Portable', 'Bluetooth 5.0, IPX7 resistente al agua, batería 13h', 99990.00, NULL, 18, 'assets\\images\\productos\\Parlante Xiaomi Mi Portable.jpeg', 1, 3, NULL, NULL),
(33, 'Micrófono USB Fifine K669B', 'Micrófono de condensador, plug & play, ideal para streaming y podcast', 129990.00, NULL, 25, 'assets\\images\\productos\\Micrófono USB Fifine K669B.jpeg', 1, 1, NULL, NULL),
(34, 'Micrófono Blue Yeti', 'Micrófono profesional con múltiples patrones de grabación, USB', 449990.00, NULL, 10, 'assets\\images\\productos\\Micrófono Blue Yeti.jpeg', 1, 1, NULL, NULL),
(35, 'Micrófono Trust GXT 232 Mantis', 'Micrófono cardioide con trípode para gaming y voz', 89990.00, NULL, 20, 'assets\\images\\productos\\Micrófono Trust GXT 232 Mantis.jpeg', 1, 1, NULL, NULL),
(36, 'Micrófono HyperX SoloCast', 'USB, plug & play, ideal para creadores de contenido', 189990.00, NULL, 11, 'assets\\images\\productos\\Micrófono HyperX SoloCast.png', 1, 1, NULL, NULL),
(37, 'Micrófono Maono AU-A04', 'Kit de micrófono de estudio con brazo y filtro pop', 159990.00, NULL, 18, 'assets\\images\\productos\\Micrófono Maono AU-A04.jpeg', 1, 1, NULL, NULL),
(38, 'Smart TV Samsung 55\" 4K UHD', 'Televisor 4K con Tizen, control por voz y apps integradas', 1799990.00, NULL, 8, 'assets\\images\\productos\\Smart TV Samsung 55 4K UHD.jpeg', 1, 1, NULL, NULL),
(39, 'LG Smart TV 43\" Full HD', 'TV Full HD con webOS, control remoto mágico', 1199990.00, NULL, 10, 'assets\\images\\productos\\LG Smart TV 43 Full HD.jpeg', 1, 1, NULL, NULL),
(40, 'TCL 32\" Android TV', 'Televisor HD con Android TV, Google Assistant y Chromecast', 899990.00, NULL, 15, 'assets\\images\\productos\\TCL 32 Android TV.jpeg', 1, 1, NULL, NULL),
(41, 'Sony Bravia 65\" 4K HDR', 'Smart TV 4K con Android TV, control por voz, HDMI ARC', 2699990.00, NULL, 5, 'assets\\images\\productos\\Sony Bravia 65 4K HDR.jpeg', 1, 1, NULL, NULL),
(42, 'Hisense 50\" 4K UHD', 'Smart TV con sistema VIDAA, HDR10 y puertos HDMI/USB', 1399990.00, NULL, 7, 'assets\\images\\productos\\Hisense 50 4K UHD.jpeg', 1, 1, NULL, NULL),
(43, 'Cámara Web Logitech C920s HD Pro', '1080p, micrófono estéreo, tapa de privacidad', 249990.00, NULL, 19, 'assets\\images\\productos\\Cámara Web Logitech C920s HD Pro.jpeg', 1, 1, NULL, NULL),
(44, 'Cámara Web Microsoft LifeCam HD-3000', '720p, micrófono integrado, clip universal', 119990.00, NULL, 24, 'assets\\images\\productos\\Cámara Web Microsoft LifeCam HD-3000.jpeg', 1, 1, NULL, NULL),
(45, 'Cámara Web Redragon Hitman GW800', '1080p, micrófono estéreo, plug and play', 99990.00, NULL, 30, 'assets\\images\\productos\\Cámara Web Redragon Hitman GW800.jpeg', 1, 1, NULL, NULL),
(46, 'Cámara Web Genius WideCam F100', '120° ángulo, 1080p, ideal para videollamadas en grupo', 149990.00, NULL, 12, 'assets\\images\\productos\\Cámara Web Genius WideCam F100.jpeg', 1, 1, NULL, NULL),
(47, 'Cámara Web Nexxt Solutions NHC-E610', '1080p, USB, compatible con Windows y macOS', 84990.00, NULL, 14, 'assets\\images\\productos\\Cámara Web Nexxt Solutions NHC-E610.jpeg', 1, 1, NULL, NULL),
(48, 'Mouse Logitech M720 Triathlon', 'Inalámbrico, conexión por Bluetooth y receptor USB, multitarea con 3 dispositivos', 169990.00, NULL, 20, 'assets\\images\\productos\\Mouse Logitech M720 Triathlon.jpeg', 1, 2, NULL, NULL),
(49, 'Mouse Redragon M601 Centrophorus', 'Con cable, sensor de 7200 DPI, iluminación LED roja, ideal para gaming', 84990.00, NULL, 25, 'assets\\images\\productos\\Mouse Redragon M601 Centrophorus.jpeg', 1, 2, NULL, NULL),
(50, 'Mouse Razer Viper Mini', 'Ultraligero, sensor óptico 8500 DPI, RGB Chroma, 6 botones programables', 129990.00, NULL, 15, 'assets\\images\\productos\\Mouse Razer Viper Min.jpeg', 1, 2, NULL, NULL),
(51, 'Mouse Microsoft Bluetooth Mouse', 'Diseño compacto, conexión Bluetooth, batería de hasta 12 meses', 74990.00, NULL, 30, 'assets\\images\\productos\\Mouse Microsoft Bluetooth Mouse.jpeg', 1, 2, NULL, NULL),
(52, 'Mouse HP X500', 'Mouse óptico con cable USB, diseño ambidiestro', 29990.00, NULL, 39, 'assets\\images\\productos\\Mouse HP X500.jpeg', 1, 2, NULL, NULL),
(54, 'Mouse Genius DX-110', 'Mouse óptico con cable, sensor de 1000 DPI, diseño ergonómico', 19990.00, NULL, 49, 'assets\\images\\productos\\Mouse Genius DX-110.jpeg', 1, 2, NULL, NULL),
(55, 'Mouse Asus ROG Gladius II Core', 'Diseño ergonómico, sensor 6200 DPI, RGB Aura Sync', 189990.00, NULL, 8, 'assets\\images\\productos\\Mouse Asus ROG Gladius II Core.jpeg', 1, 2, NULL, NULL),
(56, 'Mouse Logitech M185', 'Inalámbrico, compacto, con receptor USB nano y batería de larga duración', 49990.00, NULL, 60, 'assets\\images\\productos\\Mouse Logitech M185.jpeg', 1, 2, NULL, NULL),
(57, 'Mouse Trust GXT 105', 'Mouse para juegos con iluminación LED, 6 botones, sensor de 2400 DPI', 59990.00, NULL, 22, 'assets\\images\\productos\\Mouse Trust GXT 105.jpeg', 1, 2, NULL, NULL),
(58, 'parlante logitech x50', 'Sistema 2.1 con subwoofer, 25W RMS, control de volumen con cable', 189990.00, NULL, 20, 'assets\\images\\productos\\parlante logitech x50.jpeg', 1, 3, NULL, NULL),
(59, 'Parlante JBL flip 4', 'Altavoz portátil Bluetooth, resistente al agua IP67, hasta 5 horas de música', 149990.00, NULL, 30, 'assets\\images\\productos\\Parlante JBL flip 4.jpeg', 1, 3, NULL, NULL),
(60, 'Parlante Genius gx gaming', 'Sistema 2.0 de madera, 50W RMS, control de tono y volumen', 599990.00, NULL, 12, 'assets\\images\\productos\\Parlante Genius gx gaming.jpeg', 1, 3, NULL, NULL),
(61, 'Parlante Sony SRS-XB13', 'Bluetooth, extra bass, resistente al agua y polvo IP67', 209990.00, NULL, 18, 'assets\\images\\productos\\Parlante Sony SRS-XB13.jpeg', 1, 3, NULL, NULL),
(62, 'Parlante Redragon Anvil GS520', 'Altavoces RGB para PC, con conexión USB y jack 3.5 mm', 109990.00, NULL, 25, 'assets\\images\\productos\\Parlante Redragon Anvil GS520.jpeg', 1, 3, NULL, NULL),
(63, 'Parlante Bose SoundLink Revolve II', 'Sonido 360°, Bluetooth, batería de hasta 13 horas, resistente al agua', 699990.00, NULL, 8, 'assets\\images\\productos\\Parlante Bose SoundLink Revolve II.jpeg', 1, 3, NULL, NULL),
(64, 'Parlante HP DHS-2111', 'Altavoces estéreo USB para PC, 4W RMS, control de volumen', 59990.00, NULL, 40, 'assets\\images\\productos\\Parlante HP DHS-2111.jpeg', 1, 3, NULL, NULL),
(65, 'Parlante Xiaomi Mi Compact Bluetooth Speaker 2', 'Altavoz portátil, hasta 6 horas de reproducción, micrófono integrado', 84990.00, NULL, 35, 'assets\\images\\productos\\Parlante Xiaomi Mi Compact Bluetooth Speaker 2.jpeg', 1, 3, NULL, NULL),
(66, 'Parlante Trust GXT 609', 'Altavoces gaming RGB, 12W RMS, USB, jack 3.5 mm', 99990.00, NULL, 15, 'assets\\images\\productos\\Parlante Trust GXT 609.jpeg', 1, 3, NULL, NULL),
(67, 'Parlante Klip Xtreme KWS-601', 'Parlante estéreo Bluetooth con micrófono y entrada auxiliar', 89990.00, NULL, 16, 'assets\\images\\productos\\Parlante Klip Xtreme KWS-601.jpeg', 1, 3, NULL, NULL),
(68, 'Portátil Asus ZenBook 14', 'Intel Core i7-1165G7, 16GB RAM, 1TB SSD, 14\" FHD, Windows 11', 3199990.00, NULL, 6, 'assets\\images\\productos\\Portátil Asus ZenBook 14.jpeg', 1, 4, NULL, NULL),
(69, 'Portátil Dell XPS 13', 'Intel Core i5-1230U, 8GB RAM, 512GB SSD, 13.4\" FHD+, Windows 11', 3699990.00, NULL, 5, 'assets\\images\\productos\\Portátil Dell XPS 13.jpeg', 1, 4, NULL, NULL),
(70, 'Portátil HP ENVY 16', 'Intel Core i7-13700H, 16GB RAM, 1TB SSD, RTX 4060, 16\" 2.5K, Windows 11', 6499990.00, NULL, 3, 'assets\\images\\productos\\Portátil HP ENVY 16.jpeg', 1, 4, NULL, NULL),
(71, 'Portátil LG Gram 16', 'Intel Core i7-1360P, 16GB RAM, 1TB SSD, 16\" WQXGA, Windows 11', 5799990.00, NULL, 4, 'assets\\images\\productos\\Portátil LG Gram 16.jpeg', 1, 4, NULL, NULL),
(72, 'Portátil Samsung Galaxy Book3', 'Intel Core i5-1335U, 8GB RAM, 512GB SSD, 15.6\" FHD, Windows 11', 2899990.00, NULL, 7, 'assets\\images\\productos\\Portátil Samsung Galaxy Book3.jpeg', 1, 4, NULL, NULL),
(73, 'Portátil Avell A62 LIV', 'AMD Ryzen 9 7945HX, 32GB RAM, 1TB SSD, RTX 4080, 16\" QHD+, Windows 11', 8999990.00, NULL, 2, 'assets\\images\\productos\\Portátil Avell A62 LIV.jpeg', 1, 4, NULL, NULL),
(74, 'Portátil Chuwi HeroBook Pro', 'Intel Celeron N4020, 8GB RAM, 256GB SSD, 14.1\" FHD, Windows 11', 799990.00, NULL, 10, 'assets\\images\\productos\\Portátil Chuwi HeroBook Pro.jpeg', 1, 4, NULL, NULL),
(75, 'Portátil TUF Gaming F15', 'Intel Core i5-12500H, 16GB RAM, 512GB SSD, RTX 3050, 15.6\" FHD, Win 11', 3799990.00, NULL, 6, 'assets\\images\\productos\\Portátil TUF Gaming F15.jpeg', 1, 4, NULL, NULL),
(76, 'Portátil Gateway Ultra Slim', 'Intel Core i3-1115G4, 8GB RAM, 256GB SSD, 15.6\" FHD, Windows 11', 1299990.00, NULL, 8, 'assets\\images\\productos\\Portátil Gateway Ultra Slim.jpeg', 1, 4, NULL, NULL),
(77, 'Portátil Avita Pura', 'AMD A9-9420E, 4GB RAM, 128GB SSD, 14\" HD, Windows 10 Home', 659990.00, NULL, 12, 'assets\\images\\productos\\Portátil Avita Pura.jpeg', 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` enum('pendiente','pagada','cancelada') DEFAULT 'pendiente',
  `fecha_reserva` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `id_cliente`, `id_producto`, `cantidad`, `estado`, `fecha_reserva`) VALUES
(1, 9, 47, 1, 'pagada', '2025-11-11 04:45:31'),
(2, 9, 47, 1, 'pagada', '2025-11-11 04:45:45'),
(3, 9, 47, 1, 'pagada', '2025-11-11 04:46:27'),
(4, 9, 47, 1, 'pagada', '2025-11-11 04:47:41'),
(5, 9, 30, 1, 'pagada', '2025-11-11 15:35:24'),
(6, 9, 67, 2, 'pagada', '2025-11-11 15:37:05'),
(7, 9, 67, 1, 'pagada', '2025-11-11 15:38:50'),
(8, 9, 67, 1, 'pagada', '2025-11-11 15:44:21'),
(9, 9, 67, 1, 'pagada', '2025-11-11 15:46:53'),
(10, 9, 67, 1, 'pagada', '2025-11-11 15:48:31'),
(11, 9, 55, 2, 'pagada', '2025-11-11 16:04:42'),
(12, 9, 52, 1, 'pagada', '2025-11-11 16:06:27'),
(13, 9, 54, 1, 'pagada', '2025-11-11 16:15:35'),
(14, 9, 43, 1, 'pagada', '2025-11-11 16:40:48'),
(15, 9, 36, 1, 'pagada', '2025-11-11 16:44:21'),
(16, 9, 44, 1, 'pagada', '2025-11-11 17:15:20'),
(17, 11, 18, 1, 'pagada', '2025-11-13 00:36:25'),
(18, 11, 46, 1, 'pendiente', '2025-11-13 00:57:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'ANGEL', 'SIFUENTES', 'angelsifuentes2580@gmail.com', '1234', NULL, 1),
(2, 'hola', 'como', 'esta@gmail.com', '$2y$10$ZX9BeymxshOoe/I3pGoIp.6Ai5mrVxN1rdS4nrAQILsOjE9DPwdXW', NULL, 1),
(3, 'yeyher', 'jordan', 'yeyherjordanmoreno@gmail.com', '$2y$10$P.61zxuzPnXpkZQqiPHjQexlminemggM6i9NL7wZHYWjrzlpOQEc.', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos` (
`id` int(11)
,`nombre` varchar(255)
,`descripcion` longtext
,`cantidad` int(11)
,`imagen` varchar(150)
,`estado` int(11)
,`id_categoria` int(11)
,`precio_original` decimal(10,2)
,`precio_oferta` decimal(10,2)
,`fecha_inicio` date
,`fecha_fin` date
,`precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos`
--
DROP TABLE IF EXISTS `vista_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos`  AS SELECT `p`.`id` AS `id`, `p`.`nombre` AS `nombre`, `p`.`descripcion` AS `descripcion`, `p`.`cantidad` AS `cantidad`, `p`.`imagen` AS `imagen`, `p`.`estado` AS `estado`, `p`.`id_categoria` AS `id_categoria`, `p`.`precio` AS `precio_original`, `p`.`precio_oferta` AS `precio_oferta`, `p`.`fecha_inicio` AS `fecha_inicio`, `p`.`fecha_fin` AS `fecha_fin`, CASE WHEN `p`.`precio_oferta` is not null AND curdate() between `p`.`fecha_inicio` and `p`.`fecha_fin` THEN `p`.`precio_oferta` ELSE `p`.`precio` END AS `precio` FROM `productos` AS `p` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `limpiar_ofertas_vencidas` ON SCHEDULE EVERY 1 DAY STARTS '2025-11-10 22:54:51' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
  UPDATE productos
  SET precio_oferta = NULL, fecha_inicio = NULL, fecha_fin = NULL
  WHERE fecha_fin < CURDATE();
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
