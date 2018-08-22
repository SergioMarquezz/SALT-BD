
DELIMITER $$

#Procedimientos
CREATE PROCEDURE `agregarVehiculoImagen` (IN `foto` VARCHAR(255), IN `marcaVehi` VARCHAR(20), IN `modeloVehi` VARCHAR(20), IN `numSerie` VARCHAR(25), IN `anio` VARCHAR(4), IN `placaVehi` VARCHAR(8), IN `tanque` INT(4), IN `combustible` VARCHAR(9), IN `rendiVehi` FLOAT, IN `numTarjeta` VARCHAR(25), IN `estTarjeta` VARCHAR(25), IN `vijeTarjeta` DATE, IN `km` INT(8), IN `manteVehi` VARCHAR(20), IN `estadoVehi` VARCHAR(15))  BEGIN
	INSERT INTO vehiculos(foto_vehiculo,marca,modelo,no_serie,anio,placa,capacidad_tanque,tipo_combustible,
    rendimiento,numero_tarjeta,estado_tarjeta,vigencia_tarjeta,kilometraje,periodo_mantenimiento,estado_vehiculo)
    
    VALUES(foto,marcaVehi,modeloVehi,numSerie,anio,placaVehi,tanque,combustible,
    rendiVehi,numTarjeta,estTarjeta,vijeTarjeta,km,manteVehi,estadoVehi);
END$$

CREATE PROCEDURE `cambiar_contrasenia` (IN `id` INT(4), IN `pass` VARCHAR(20))  BEGIN    
	UPDATE usuarios SET contrasenia = pass WHERE id_usuario = id;
END$$

CREATE PROCEDURE `insert_presupuesto` (IN `dist` INT(5), IN `precio_c` FLOAT, IN `total_c` FLOAT, IN `litros_C` FLOAT, IN `vale_c` TINYINT(4), IN `n_vale` VARCHAR(10), IN `t_casetas` INT(2), IN `g_casetas` FLOAT, IN `n_personas` INT(2), IN `t_hotel` FLOAT, IN `t_comida` FLOAT, IN `t_biaticos` FLOAT, IN `t_presupuesto` FLOAT, IN `id_via` INT(8))  BEGIN
    INSERT INTO presupuestos(distancia,precio_combustible,total_combustible,litros_combustible,vale_gasolina,no_vale,
                            total_casetas,gasto_casetas,no_personas,hotel,comida,total_biaticos, total_presupuesto,id_viaje)
        VALUES(dist,precio_c,total_c,litros_c,vale_c,n_vale,t_casetas,g_casetas,n_personas,t_hotel,t_comida,t_biaticos,t_presupuesto,id_via);
END$$

CREATE PROCEDURE `insert_revision` (IN `aceite_m` VARCHAR(25), IN `aceite_t` VARCHAR(25), IN `anti` VARCHAR(25), IN `liquido_fre` VARCHAR(25), IN `llanta` TINYINT(4), IN `llave` TINYINT(4), IN `veri` TINYINT(4), IN `poliza` TINYINT(4), IN `gato` TINYINT(4), IN `tarjeta` TINYINT(4), IN `cin` INT(2), IN `mat` INT(2), IN `cob` INT(2), IN `col` INT(2), IN `ram` INT(2), IN `limpieza` VARCHAR(10), IN `nivel` FLOAT, IN `obs` VARCHAR(100), IN `foto_f` VARCHAR(50), IN `foto_t` VARCHAR(50), IN `foto_i` VARCHAR(50), IN `foto_d` VARCHAR(50), IN `id_via` INT(8))  BEGIN
    INSERT INTO revision_vehiculo(aceite_motor,aceite_transmision,anticongelante,liquido_frenos,llanta_refaccion,llave_ruedas,
                            verificacion,poliza_seguro,gato,tarjeta_circulacion,cinchos,matracas,cobijas,colchones,rampas,limpieza_vehiculo,
			     nivel_gasolina_ida,observaciones,foto_frontal,foto_trasera,foto_izquierda,foto_derecha,id_viaje)
	VALUES(aceite_m,aceite_t,anti,liquido_fre,llanta,llave,veri,poliza,gato,tarjeta,cin,mat,cob,col,ram,limpieza,nivel,obs,foto_f,
	       foto_t,foto_i,foto_d,id_via);
END$$

CREATE PROCEDURE `insert_revision_final` (IN `fecha` DATE, IN `kilometros_e` INT(10), IN `kilometros_t` INT(10), IN `aceite_m` VARCHAR(25), IN `aceite_t` VARCHAR(25), IN `anti` VARCHAR(25), IN `liquido_fre` VARCHAR(25), IN `llanta` TINYINT(4), IN `llave` TINYINT(4), IN `veri` TINYINT(4), IN `poliza` TINYINT(4), IN `gato` TINYINT(4), IN `tarjeta` TINYINT(4), IN `cin` INT(2), IN `mat` INT(2), IN `cob` INT(2), IN `col` INT(2), IN `ram` INT(2), IN `limpieza` VARCHAR(10), IN `nivel` FLOAT, IN `obs` VARCHAR(100), IN `foto_f` VARCHAR(50), IN `foto_t` VARCHAR(50), IN `foto_i` VARCHAR(50), IN `foto_d` VARCHAR(50), IN `id_via` INT(8))  BEGIN
    INSERT INTO revision_final(fecha_llegada, kilometros_entrada, total_km_recorridos, aceite_motor,aceite_transmision,anticongelante,liquido_frenos,llanta_refaccion,llave_ruedas,
                            verificacion,poliza_seguro,gato,tarjeta_circulacion,cinchos,matracas,cobijas,colchones,rampas,limpieza_vehiculo,
			     nivel_gasolina_llegada,observaciones,foto_frontal,foto_trasera,foto_izquierda,foto_derecha,id_viaje)
	VALUES(fecha,kilometros_e,kilometros_t,aceite_m,aceite_t,anti,liquido_fre,llanta,llave,veri,poliza,gato,tarjeta,cin,mat,cob,col,ram,limpieza,nivel,obs,foto_f,
	       foto_t,foto_i,foto_d,id_via);
END$$

CREATE PROCEDURE `insert_seguro` (IN `poliza` INT(4), IN `seguro` VARCHAR(35), IN `periodo` VARCHAR(25), IN `fecha` DATE, IN `fotoPoliza` VARCHAR(255), IN `idVehiculo` INT(4))  BEGIN
	INSERT INTO seguro(no_poliza,aseguradora,fecha_pago,periodo_pago,fecha_registro,foto_poliza,foto_recibo,id_vehiculo,monto_total)
    VALUES(poliza,seguro,null,periodo,fecha,fotoPoliza,null,idVehiculo,null);
END$$

CREATE PROCEDURE `insert_travel` (IN `f_salida` DATE, `dest` VARCHAR(20), `mot` VARCHAR(35), `obs` VARCHAR(50), `id_ve` INT(8), `id_us` INT(4))  BEGIN
    INSERT INTO viajes(fecha_salida,destino,motivo,estado_viaje,
		       observaciones,id_vehiculo,id_usuario)
    VALUES(f_salida,dest,mot,'Iniciado',obs,id_ve,id_us);
END$$

CREATE PROCEDURE `insert_user` (IN `name` VARCHAR(25), `last_name` VARCHAR(25), `rol` VARCHAR(15), `email` VARCHAR(25), `pass` VARCHAR(20))  BEGIN
    INSERT INTO usuarios(nombre,apellido,rol,correo,contrasenia)
    VALUES(name,last_name,rol,email,pass);
END$$

CREATE PROCEDURE `insert_verificacion` (IN `f_veri` DATE, IN `prov` VARCHAR(25), IN `imp` FLOAT, IN `id_us` INT(4), IN `des` VARCHAR(100), IN `foto` VARCHAR(50), IN `proxima` DATE, IN `id_ve` INT(4))  BEGIN
    INSERT INTO verificaciones(fecha_verificacion, proveedor, importe, id_usuario,
		       descripcion, foto_factura, proxima_fecha, id_vehiculo)
    VALUES(f_veri,prov,imp,id_us,des,foto,proxima,id_ve);
END$$

CREATE PROCEDURE `select_cars` ()  BEGIN
SELECT * FROM vehiculos WHERE estado_vehiculo = 'Activo';
END$$

CREATE PROCEDURE `select_dias_verificacion` (IN `FECHA` DATE)  BEGIN		      
SELECT DATEDIFF(CURDATE(), FECHA)*-1 as dias;
END$$

CREATE PROCEDURE `select_drivers` ()  BEGIN
SELECT id_usuario,nombre,rol FROM usuarios WHERE rol = "Conductor";
END$$


CREATE PROCEDURE `select_fecha` (IN `cadena` VARCHAR(25), IN `IdVehiculo` INT(4))  BEGIN

IF strcmp(cadena, 'Mensual') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 1 MONTH) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;

IF strcmp(cadena, 'Anual') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 1 YEAR) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;

IF strcmp(cadena, 'Trimestral') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 3 MONTH) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;

IF strcmp(cadena, 'Semestral') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 6 MONTH) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;
END$$

CREATE PROCEDURE `select_gasto_man` ()  BEGIN		      
SELECT SUM(importe) AS gasto FROM mantenimientos;
END$$

CREATE PROCEDURE `select_gasto_seg` ()  BEGIN		      
SELECT SUM(monto_total) AS gasto FROM seguros;
END$$

CREATE PROCEDURE `select_gasto_veri` ()  BEGIN		      
SELECT SUM(importe) AS gasto FROM verificaciones;
END$$

CREATE PROCEDURE `select_gasto_verificaciones` (IN `ID` INT(4))  BEGIN		      
SELECT SUM(importe) as gasto FROM verificaciones WHERE id_vehiculo = ID;
END$$

CREATE PROCEDURE `select_kilometraje` (IN `idVehiculo` INT(4))  BEGIN
SELECT kilometraje FROM vehiculos WHERE id_vehiculo = idVehiculo;
END$$

CREATE PROCEDURE `select_no_users` ()  BEGIN		      
SELECT COUNT(*) AS no_usuarios FROM usuarios WHERE estado_usuario = 'Activo';
END$$

CREATE PROCEDURE `select_no_vehiculos` ()  BEGIN		      
SELECT COUNT(*) AS no_vehiculos FROM vehiculos WHERE estado_vehiculo = 'Activo';
END$$

CREATE PROCEDURE `select_no_verificaciones` (IN `ID` INT(4))  BEGIN		      
select count(*) AS 'no_verificaciones' from verificaciones
  where id_vehiculo = ID;
END$$

CREATE PROCEDURE `select_no_viajes` ()  BEGIN		      
SELECT COUNT(*) AS no_viajes FROM viajes WHERE estado_viaje <> 'Eliminado';
END$$

CREATE PROCEDURE `select_presupuesto` (IN `id_travel` INT(8))  BEGIN
	SELECT * FROM presupuestos WHERE id_viaje = id_travel;
END$$

CREATE PROCEDURE `select_primera_revision` (IN `id_travel` INT(8))  BEGIN
	SELECT * FROM revision_vehiculo WHERE id_viaje = id_travel;
END$$

CREATE PROCEDURE `select_proxima_verificacion` (IN `ID` INT(4))  BEGIN		      
SELECT proxima_fecha from verificaciones WHERE id_vehiculo = ID order by fecha_verificacion DESC LIMIT 1;
END$$

CREATE PROCEDURE `select_rendimiento` (`id` INT(8))  BEGIN
SELECT rendimiento FROM vehiculos WHERE id_vehiculo = id;
END$$

CREATE PROCEDURE `select_revision_final` (`idViaje` INT(8))  BEGIN
	SELECT FECHA_SALIDA,MODELO_VEHICULO,CONDUCTOR,ID FROM vista_viajes WHERE ID = idViaje;
END$$

CREATE PROCEDURE `select_segunda_revision` (IN `id_travel` INT(8))  BEGIN
	SELECT * FROM revision_final WHERE id_viaje = id_travel;
END$$

CREATE PROCEDURE `select_seguro` (IN `idVehiculo` INT(4))  BEGIN
	SELECT id_seguro, no_poliza, aseguradora,fecha_pago,fecha_registro,foto_poliza,monto_total,periodo_pago,modelo
    FROM seguro
    INNER JOIN vehiculos on vehiculos.id_vehiculo = seguro.id_vehiculo where vehiculos.id_vehiculo = idVehiculo;
END$$

CREATE PROCEDURE `select_seguro_importe` (IN `IdVehiculo` INT(4))  BEGIN		      
SELECT SUM(monto_total) AS gasto FROM seguro WHERE id_vehiculo = IdVehiculo;
END$$

CREATE PROCEDURE `select_total_viajes_mes` ()  BEGIN		
DECLARE mes INT;		  
DECLARE anio INT;		  
SELECT Date_format(CURDATE(), '%m') INTO @mes;
SELECT Date_format(CURDATE(), '%Y') INTO @anio;
SELECT COUNT(*) AS no_viajes FROM viajes WHERE viajes.estado_viaje <> 'Eliminado' AND MONTH(fecha_salida) = @mes AND YEAR(fecha_salida) = @anio;
END$$

CREATE PROCEDURE `select_travel_detail` (IN `id_travel` INT(8))  BEGIN
	SELECT * FROM vista_detalle_viaje WHERE id_viaje = id_travel;
END$$

CREATE PROCEDURE `select_users` (
	IN idUsuario INT(4))  
BEGIN
SELECT id_usuario,nombre,rol,correo,foto_perfil FROM usuarios WHERE estado_usuario = 'Activo' AND  id_usuario != idUsuario;
END$$

CREATE PROCEDURE `select_vehiculo` (IN `id_carro` INT(4))  BEGIN
	SELECT * FROM vehiculos WHERE id_vehiculo = id_carro;
END$$

CREATE PROCEDURE `select_verificaciones` (IN `id_carro` INT(4))  BEGIN 
    SELECT verificaciones.foto_factura, verificaciones.fecha_verificacion, verificaciones.proveedor, verificaciones.importe, verificaciones.descripcion, usuarios.nombre FROM verificaciones INNER JOIN usuarios ON usuarios.id_usuario = verificaciones.id_usuario WHERE id_vehiculo = id_carro; 
END$$

CREATE PROCEDURE `select_viajes` ()  BEGIN
SELECT * FROM vista_viajes WHERE estado_viaje = 'Iniciado' 
	OR ESTADO_VIAJE = 'Presupuestado' 
    OR ESTADO_VIAJE = 'Primera revision';
END$$

CREATE PROCEDURE `select_viajes_mes` ()  BEGIN		      
SELECT Date_format(CURDATE(), '%m') INTO @mes;
SELECT Date_format(CURDATE(), '%y') INTO @anio;
SELECT COUNT(*) AS viajes FROM viajes WHERE estado_viaje <> 'Eliminado' AND MONTH(fecha_salida) = @mes AND YEAR(fecha_salida) = @anio ;
END$$

CREATE PROCEDURE `select_viajes_transcurso` ()  BEGIN		      
SELECT COUNT(*) AS viajes FROM viajes WHERE estado_viaje NOT IN('Eliminado','FINALIZADO');
END$$

CREATE PROCEDURE `update_kilometraje` (IN `id` INT(4), IN `kilo` INT(8))  BEGIN    
	UPDATE vehiculos SET kilometraje = kilo WHERE id_vehiculo = id;
END$$

CREATE PROCEDURE `update_seguro` (IN `fecha` DATE, IN `idSeguro` INT(4), IN `total` INT(10), IN `foto` VARCHAR(255))  BEGIN
	update seguro set fecha_pago = fecha, monto_total = total, foto_recibo = foto where id_seguro = idSeguro;
END$$

CREATE PROCEDURE `update_travel` (IN `id_vi` INT(8), IN `f_salida` DATE, IN `dest` VARCHAR(20), IN `mot` VARCHAR(35), IN `edo` VARCHAR(15), IN `obs` VARCHAR(100), IN `id_ve` INT(8), IN `id_us` INT(4))  BEGIN    
	UPDATE viajes SET fecha_salida = f_salida, destino = dest, motivo = mot, observaciones = obs, id_vehiculo = id_ve,
		     id_usuario = id_us WHERE id_viaje = id_vi;
END$$

CREATE PROCEDURE `update_travel_status` (IN `id` INT(4), IN `edo` VARCHAR(25))  BEGIN    
	UPDATE viajes SET estado_viaje = edo WHERE id_viaje = id;
END$$

CREATE PROCEDURE `update_user` (IN `id` INT(4), IN `name` VARCHAR(25), IN `lname` VARCHAR(25), IN `user_rol` VARCHAR(15), IN `email` VARCHAR(50))  BEGIN
	UPDATE usuarios set nombre = name, apellido = lname, rol = user_rol, 
    correo = email WHERE id_usuario = id;
END$$

CREATE PROCEDURE `validacion_user` (IN `user` VARCHAR(50), IN `pass` VARCHAR(50))  BEGIN
SELECT id_usuario,nombre,apellido,rol,correo,contrasenia FROM usuarios where correo = user and contrasenia = pass;
END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_vehiculo(
	IN idVehiculo INT(4),
    IN placas VARCHAR(8),
    IN rendi FLOAT,
    IN estado VARCHAR(25),
    IN numero VARCHAR(25),
    IN vigencia DATE,
    IN manteni VARCHAR(20),
    IN statusVe VARCHAR(15))
BEGIN
	UPDATE vehiculos SET placa = placas, rendimiento = rendi, estado_tarjeta = estado, numero_tarjeta = numero, vigencia_tarjeta = vigencia,
    periodo_mantenimiento = manteni, estado_vehiculo = statusVe
    WHERE id_vehiculo = idVehiculo;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE update_status_vehiculo(
	IN idVehiculo INT(4))
BEGIN
	UPDATE vehiculos SET estado_vehiculo = 'Vendido' WHERE id_vehiculo = IdVehiculo;
END $$
DELIMITER ;
    

DELIMITER $$
CREATE PROCEDURE ultimo_seguro(
	IN idVehiculo INT(4))
BEGIN
	SELECT id_seguro,fecha_pago,monto_total FROM seguro where id_vehiculo = idVehiculo ORDER BY id_seguro desc LIMIT 1;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE update_estado_usuario(
	IN idUsuario INT(4))
BEGIN
	UPDATE usuarios SET estado_usuario = 'Inactivo' WHERE id_usuario = idUsuario;
END $$
DELIMITER ;

# Script de las tablas

CREATE TABLE `actualizacion_kilometraje` (
  `id_actualizacion` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_vehiculo` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `anterior_kilometraje` int(8) DEFAULT NULL,
  `nuevo_kilometraje` int(8) DEFAULT NULL,
  `fecha_cambiado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `actualizacion_kilometraje`
--

INSERT INTO `actualizacion_kilometraje` (`id_actualizacion`, `id_vehiculo`, `anterior_kilometraje`, `nuevo_kilometraje`, `fecha_cambiado`) VALUES
(0000000008, 00000022, 157966, 158170, '2018-08-09'),
(0000000009, 00000024, 130421, 140000, '2018-08-10'),
(0000000010, 00000022, 158170, 158176, '2018-08-10'),
(0000000011, 00000025, 66874, 67430, '2018-08-10'),
(0000000012, 00000025, 67430, 67480, '2018-08-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biaticos_extra`
--

CREATE TABLE `biaticos_extra` (
  `id_biatico` int(8) UNSIGNED ZEROFILL NOT NULL,
  `fecha` date NOT NULL,
  `concepto` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `importe` float(4,2) NOT NULL,
  `observaciones` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_gasolina`
--

CREATE TABLE `factura_gasolina` (
  `id_factura` int(8) UNSIGNED ZEROFILL NOT NULL,
  `fecha` date NOT NULL,
  `tipo_combustible` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `litros_recargados` float(4,1) NOT NULL,
  `importe` float(4,2) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_factura` mediumblob DEFAULT NULL,
  `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidentes`
--

CREATE TABLE `incidentes` (
  `id_incidente` int(8) UNSIGNED ZEROFILL NOT NULL,
  `proveedor` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `importe` float(4,2) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_factura` mediumblob DEFAULT NULL,
  `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientos`
--

CREATE TABLE `mantenimientos` (
  `id_manteniento` int(8) UNSIGNED ZEROFILL NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `proveedor` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `importe` float(4,2) NOT NULL,
  `alineacion` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `estado_llantas` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `foto_factura` mediumblob DEFAULT NULL,
  `id_vehiculo` int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos`
--

CREATE TABLE `presupuestos` (
  `id_presupuesto` int(8) UNSIGNED ZEROFILL NOT NULL,
  `distancia` int(5) NOT NULL,
  `precio_combustible` float NOT NULL,
  `total_combustible` float NOT NULL,
  `litros_combustible` float NOT NULL,
  `vale_gasolina` tinyint(4) NOT NULL,
  `no_vale` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `total_casetas` int(2) NOT NULL,
  `gasto_casetas` float NOT NULL,
  `no_personas` int(2) NOT NULL,
  `hotel` float NOT NULL,
  `comida` float NOT NULL,
  `total_biaticos` float NOT NULL,
  `total_presupuesto` float NOT NULL,
  `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `presupuestos`
--

INSERT INTO `presupuestos` (`id_presupuesto`, `distancia`, `precio_combustible`, `total_combustible`, `litros_combustible`, `vale_gasolina`, `no_vale`, `total_casetas`, `gasto_casetas`, `no_personas`, `hotel`, `comida`, `total_biaticos`, `total_presupuesto`, `id_viaje`) VALUES
(00000027, 230, 18.7, 404.294, 21.6165, 1, '12344', 2, 390, 1, 0, 350, 350, 1144.29, 00000005),
(00000028, 380, 18.8, 743.352, 39.5421, 1, 'NA', 3, 800, 2, 0, 600, 600, 2143.35, 00000009),
(00000029, 300, 19, 350.36, 18.4388, 0, 'NA', 2, 700, 2, 0, 300, 300, 1350.36, 00000010),
(00000030, 360, 18, 447.84, 24.8791, 0, 'NA', 4, 1000, 3, 1200, 1000, 2200, 3647.84, 00000011),
(00000031, 350, 19, 398.62, 20.9832, 0, 'NA', 3, 1200, 1, 0, 150, 150, 1748.62, 00000012),
(00000032, 560, 19, 773.87, 40.7273, 0, 'NA', 9, 2300, 1, 0, 600, 600, 3673.87, 00000013),
(00000048, 560, 19, 999.97, 52.6316, 0, 'NA', 5, 1200, 1, 0, 300, 300, 2499.97, 00000014),
(00000049, 450, 19, 512.62, 26.9784, 0, 'NA', 4, 1200, 2, 0, 300, 300, 2012.62, 00000015),
(00000050, 750, 19, 1049.37, 55.2283, 1, '12345', 7, 2300, 2, 0, 700, 700, 4049.37, 00000016),
(00000051, 480, 19, 546.82, 28.777, 0, 'NA', 5, 1200, 2, 0, 500, 500, 2246.82, 00000017),
(00000052, 30, 19, 53.58, 2.81955, 0, 'NA', 0, 0, 3, 0, 60, 60, 113.58, 00000019);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision_final`
--

CREATE TABLE `revision_final` (
  `id_revision_final` int(8) UNSIGNED ZEROFILL NOT NULL,
  `fecha_llegada` date NOT NULL,
  `kilometros_entrada` int(10) NOT NULL,
  `total_km_recorridos` int(10) NOT NULL,
  `aceite_motor` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `aceite_transmision` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `anticongelante` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `liquido_frenos` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `llanta_refaccion` tinyint(4) NOT NULL,
  `llave_ruedas` tinyint(4) NOT NULL,
  `verificacion` tinyint(4) NOT NULL,
  `poliza_seguro` tinyint(4) DEFAULT NULL,
  `gato` tinyint(4) NOT NULL,
  `tarjeta_circulacion` tinyint(4) NOT NULL,
  `cinchos` int(2) NOT NULL,
  `matracas` int(2) NOT NULL,
  `cobijas` int(2) NOT NULL,
  `colchones` int(2) NOT NULL,
  `rampas` int(2) DEFAULT NULL,
  `limpieza_vehiculo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nivel_gasolina_llegada` float NOT NULL,
  `observaciones` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `foto_frontal` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_trasera` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_izquierda` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_derecha` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `revision_final`
--

INSERT INTO `revision_final` (`id_revision_final`, `fecha_llegada`, `kilometros_entrada`, `total_km_recorridos`, `aceite_motor`, `aceite_transmision`, `anticongelante`, `liquido_frenos`, `llanta_refaccion`, `llave_ruedas`, `verificacion`, `poliza_seguro`, `gato`, `tarjeta_circulacion`, `cinchos`, `matracas`, `cobijas`, `colchones`, `rampas`, `limpieza_vehiculo`, `nivel_gasolina_llegada`, `observaciones`, `foto_frontal`, `foto_trasera`, `foto_izquierda`, `foto_derecha`, `id_viaje`) VALUES
(00000006, '2018-08-28', 1111, 11, 'dasd', 'dsfsd', 'fdsfd', 'sdfd', 1, 0, 1, 1, 0, 1, 44, 44, 44, 44, 33, 'Limpia', 22.3, 'Bien', 'prueba', 'prueba', 'prueba', 'prueba', 00000005),
(00000010, '2018-08-02', 38745, 245, 'En condición', 'Cambio', 'En condición', 'Cambio', 1, 0, 0, 1, 1, 1, 5, 4, 2, 1, 6, 'Lavada', 45.5, 'El vehiculo viene lavado', 'prueba', 'prueba', 'prueba', 'prueba', 00000009),
(00000011, '2018-08-13', 158230, 264, 'En condición', 'En condición', 'Cambio', 'En condición', 1, 1, 0, 0, 1, 1, 5, 0, 3, 3, 0, 'Sucia', 31.05, 'El vehículo llego lavado.', '00000015-frontal-llegada.jpeg', '00000015-trasera-llegada.png', '00000015-izquierda-llegada.jpeg', '00000015-derecha-llegada.jpg', 00000015),
(00000013, '2018-08-12', 26971, 282, 'Cambio', 'En condición', 'Cambio', 'En condición', 1, 1, 1, 0, 1, 1, 5, 0, 3, 6, 7, 'Limpia', 42, 'El vehículo llegó lavado.', '00000016-frontal-llegada.jpg', '00000016-trasera-llegada.jpeg', '00000016-izquierda-llegada.jpeg', '00000016-derecha-llegada.jpeg', 00000016),
(00000014, '2018-08-21', 158170, 204, 'En condición', 'Cambio', 'Cambio', 'En condición', 1, 0, 1, 0, 1, 1, 0, 0, 3, 6, 5, 'Sucia', 31.05, 'El vehículo llegó sucio.', '00000017-frontal-llegada.jpg', '00000017-trasera-llegada.jpg', '00000017-izquierda-llegada.jpg', '00000017-derecha-llegada.jpg', 00000017),
(00000015, '2018-08-10', 140000, 9579, 'En condición', 'En condición', 'En condición', 'En condición', 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 'Limpia', 12, 'REGRESO OK', '00000005-frontal-llegada.png', '00000005-trasera-llegada.jpg', '00000005-izquierda-llegada.jpg', '00000005-derecha-llegada.png', 00000005),
(00000017, '2018-08-10', 67480, 50, 'En condición', 'En condición', 'En condición', 'En condición', 1, 1, 1, 1, 1, 1, 3, 3, 2, 6, 1, 'Limpia', 22.4, 'Llegó ok', '00000019-frontal-llegada.jpg', '00000019-trasera-llegada.jpg', '00000019-izquierda-llegada.jpg', '00000019-derecha-llegada.jpg', 00000019);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision_vehiculo`
--

CREATE TABLE `revision_vehiculo` (
  `id_revision` int(8) UNSIGNED ZEROFILL NOT NULL,
  `aceite_motor` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `aceite_transmision` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `anticongelante` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `liquido_frenos` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `llanta_refaccion` tinyint(4) NOT NULL,
  `llave_ruedas` tinyint(4) NOT NULL,
  `verificacion` tinyint(4) NOT NULL,
  `poliza_seguro` tinyint(4) NOT NULL,
  `gato` tinyint(4) NOT NULL,
  `tarjeta_circulacion` tinyint(4) DEFAULT NULL,
  `cinchos` int(2) NOT NULL,
  `matracas` int(2) NOT NULL,
  `cobijas` int(2) NOT NULL,
  `colchones` int(2) NOT NULL,
  `rampas` int(2) DEFAULT NULL,
  `limpieza_vehiculo` varchar(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `nivel_gasolina_ida` float NOT NULL,
  `observaciones` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `foto_frontal` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `foto_trasera` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `foto_izquierda` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `foto_derecha` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `revision_vehiculo`
--

INSERT INTO `revision_vehiculo` (`id_revision`, `aceite_motor`, `aceite_transmision`, `anticongelante`, `liquido_frenos`, `llanta_refaccion`, `llave_ruedas`, `verificacion`, `poliza_seguro`, `gato`, `tarjeta_circulacion`, `cinchos`, `matracas`, `cobijas`, `colchones`, `rampas`, `limpieza_vehiculo`, `nivel_gasolina_ida`, `observaciones`, `foto_frontal`, `foto_trasera`, `foto_izquierda`, `foto_derecha`, `id_viaje`) VALUES
(00000029, 'En condiciÃ³n', 'En condiciÃ³n', 'En condiciÃ³n', 'En condiciÃ³n', 1, 1, 1, 1, 1, NULL, 0, 0, 0, 0, 0, 'Limpia', 17.6, 'RASPON EN LA SALPICADERA TRASERA LADO COPILOTO', 'prueba', 'prueba', 'prueba', 'prueba', 00000009),
(00000042, 'En condiciÃ³n', 'En condiciÃ³n', 'En condiciÃ³n', 'En condiciÃ³n', 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 'Limpia', 10.4, 'Unidad sin golpes', 'prueba', 'prueba', 'prueba', '00000011-derecha_salida.jpg', 00000010),
(00000061, 'En condiciÃ³n', 'En condiciÃ³n', 'En condiciÃ³n', 'En condiciÃ³n', 1, 1, 1, 0, 0, 0, 0, 0, 3, 3, 0, 'Sucia', 7.7, 'vcgchfgh', '00000011-frontal-salida.jpg', '00000011-trasera-salida.jpeg', '00000011-izquierda-salida.jpeg', '00000011-derecha-salida.jpeg', 00000011),
(00000068, 'En condición', 'Cambiar durante viaje', 'En condición', 'Cambiar durante viaje', 1, 0, 1, 1, 0, 1, 0, 0, 3, 3, 2, 'Lavada', 31.5, 'el vehiculo va bien.', '00000012-frontal-salida.jpeg', '00000012-trasera-salida.jpg', '00000012-izquierda-salida.png', '00000012-derecha-salida.jpeg', 00000012),
(00000069, 'En condición', 'Cambiar durante viaje', 'En condición', 'En condición', 1, 1, 1, 1, 0, 1, 5, 0, 3, 3, 0, 'Lavada', 12.6, 'El vehiculo va lavado.', '00000015-frontal-salida.jpg', '00000015-trasera-salida.jpeg', '00000015-izquierda-salida.jpeg', '00000015-derecha-salida.jpeg', 00000015),
(00000070, 'En condición', 'Cambiar durante viaje', 'Cambio', 'En condición', 1, 1, 1, 1, 0, 1, 7, 3, 6, 9, 4, 'Limpia', 60, 'El vehículo lleva tanque lleno.', '00000016-frontal-salida.jpg', '00000016-trasera-salida.jpeg', '00000016-izquierda-salida.jpeg', '00000016-derecha-salida.jpeg', 00000016),
(00000074, 'En condición', 'En condición', 'En condición', 'En condición', 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 'Limpia', 10.4, 'REVISION OK', '00000005-frontal-salida.jpg', '00000005-trasera-salida.jpg', '00000005-izquierda-salida.png', '00000005-derecha-salida.png', 00000005);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id_seguro` int(4) UNSIGNED ZEROFILL NOT NULL,
  `no_poliza` int(15) NOT NULL,
  `aseguradora` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `periodo_pago` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `foto_poliza` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_recibo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_vehiculo` int(4) UNSIGNED ZEROFILL NOT NULL,
  `monto_total` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(4) UNSIGNED ZEROFILL NOT NULL,
  `nombre` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `rol` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contrasenia` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `foto_perfil` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_usuario` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `rol`, `correo`, `contrasenia`, `foto_perfil`, `estado_usuario`) VALUES
(0001, 'Miguel', 'Montiel', 'Administrador', 'miguel@gmail.com', '123', NULL, 'Activo'),
(0009, 'Ingeniero', 'Garrido', 'Administrador', 'ing.garrido@gmail.com', 'inggarrido20', NULL, 'Activo'),
(0017, 'Alfredo ', 'Escobedo', 'Conductor', 'alfredoescobedo@gmail.com', 'alfredo10', NULL, 'Activo'),
(0018, 'Jose Luis', 'Luna', 'Conductor', 'joseluis@gmail.com', 'joseluis20', NULL, 'Activo'),
(0019, 'Juan', 'Hernandez', 'Conductor', 'juanhernandez@gmail.com', 'juan30', NULL, 'Activo'),
(0020, 'Jose Manuel', 'Benitez', 'Conductor', 'josemanuel@gmail.com', 'jose40', NULL, 'Activo'),
(0021, 'Rodrigo', 'Garcia', 'Conductor', 'rodrigo@gmail.com', 'rodrigo50', NULL, 'Activo'),
(0022, 'Francisco Daniel', 'Tellez', 'Conductor', 'francisco@gmail.com', 'francisco60', NULL, 'Activo'),
(0023, 'Carlos', 'Martinez', 'Conductor', 'carlosmartinez@gmail.com', 'carlos70', NULL, 'Activo'),
(0024, 'Humberto', 'Hernandez', 'Conductor', 'humberto@gmail.com', 'humberto80', NULL, 'Activo'),
(0025, 'Magdaleno', 'Pasaran', 'Conductor', 'pasaran@gmail.com', 'pasaran90', NULL, 'Activo'),
(0026, 'Rigoberto', 'Santos', 'Conductor', 'rigo@gmail.com', 'rigo100', NULL, 'Activo'),
(0027, 'Daniel', 'Castañeda', 'Conductor', 'castaneda@gmail.com', 'castaneda200', NULL, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int(4) UNSIGNED ZEROFILL NOT NULL,
  `foto_vehiculo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marca` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `no_serie` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `anio` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `placa` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `capacidad_tanque` int(4) NOT NULL,
  `tipo_combustible` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `rendimiento` float NOT NULL,
  `numero_tarjeta` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `estado_tarjeta` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `vigencia_tarjeta` date NOT NULL,
  `kilometraje` int(8) NOT NULL,
  `periodo_mantenimiento` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `estado_vehiculo` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `foto_vehiculo`, `marca`, `modelo`, `no_serie`, `anio`, `placa`, `capacidad_tanque`, `tipo_combustible`, `rendimiento`, `numero_tarjeta`, `estado_tarjeta`, `vigencia_tarjeta`, `kilometraje`, `periodo_mantenimiento`, `estado_vehiculo`) VALUES
(0017, NULL, 'Chevrolet', 'Beat', 'MA6CA6CD0JT029431', '2018', 'HPX568A', 45, 'Gasolina', 16.27, '13000291830', 'Hidalgo', '2018-07-10', 4344, '5000', 'Activo'),
(0018, NULL, 'Ford', 'Transit 44', 'VF0RS5HP8GTA59130', '2016', 'SM16644', 80, 'Diesel', 9.61, '2900450', 'Puebla', '2018-07-10', 31374, '8000', 'Activo'),
(0019, NULL, 'Chevrolet', 'Aveo', '3G1TA5AF7GL237794', '2016', 'XWV2797', 45, 'Gasolina', 13.75, '135930741', 'Tlaxcala', '2018-07-10', 33166, '5000', 'Activo'),
(0020, NULL, 'Peugeot', 'Partner', 'VF37R9HE9HJ643385', '2017', 'HH0495D', 60, 'Diesel', 13.58, '165095623', 'Hidalgo', '2018-07-10', 26689, '5000', 'Activo'),
(0021, NULL, 'Chevrolet', 'Matiz', 'KL8MJ6A03FC47869', '2015', 'MXH8251', 35, 'Gasolina', 14.47, '165095623', 'Hidalgo', '2018-07-10', 64516, '5000', 'Activo'),
(0022, NULL, 'Ford', 'Ikon', 'MAJFP1GD6DC116740', '2013', 'HMH3793', 45, 'Gasolina', 16.68, '085997574', 'Hidalgo', '2018-07-10', 158176, '5000', 'Activo'),
(0023, NULL, 'Ford', 'Transit 1C', 'WF0VS4MP4FTB43832', '2015', 'HH4491C', 80, 'Diesel', 8.25, '165080179', 'Hidalgo', '2018-07-10', 38498, '8000', 'Activo'),
(0024, NULL, 'Fiat', 'Ducato', 'ZFCNFFF25G2940453', '2016', 'HJ886F', 80, 'Diesel', 10.64, '165030831', 'Hidalgo', '2018-07-10', 140000, '8000', 'Activo'),
(0025, NULL, 'Ford', 'Transit 5B', 'WF0VS4MP3FTB67636', '2015', 'HH8095B', 80, 'Diesel', 10.64, '165029776', 'Hidalgo', '2018-07-10', 67480, '8000', 'Activo'),
(0026, NULL, 'Ford', 'Transit 178', 'WF0RS4H56AJA72311', '2010', 'HH34178', 80, 'Diesel', 10.64, '165697470', 'Hidalgo', '2019-07-10', 256230, '8000', 'Activo'),
(0027, NULL, 'Ford', 'Camion Redilas', '3FDXF46F92MA00039', '2002', 'HH34185', 151, 'Diesel', 7, '165029771', 'Hidalgo', '2019-07-10', 173869, '8000', 'Activo');

--
-- Disparadores `vehiculos`
--
DELIMITER $$
CREATE TRIGGER `kilometraje_bu` AFTER UPDATE ON `vehiculos` FOR EACH ROW INSERT INTO actualizacion_kilometraje(
	id_actualizacion, 
  id_vehiculo, 
	anterior_kilometraje,
	nuevo_kilometraje,    
  fecha_cambiado) VALUES
(0, OLD.id_vehiculo, OLD.kilometraje,
	 NEW.kilometraje, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificaciones`
--

CREATE TABLE `verificaciones` (
  `id_verificacion` int(4) UNSIGNED ZEROFILL NOT NULL,
  `fecha_verificacion` date NOT NULL,
  `proveedor` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `importe` float NOT NULL,
  `id_usuario` int(4) UNSIGNED ZEROFILL NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_factura` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proxima_fecha` date NOT NULL,
  `id_vehiculo` int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `verificaciones`
--

INSERT INTO `verificaciones` (`id_verificacion`, `fecha_verificacion`, `proveedor`, `importe`, `id_usuario`, `descripcion`, `foto_factura`, `proxima_fecha`, `id_vehiculo`) VALUES
(0007, '2018-08-09', 'Mécanico Juan', 3500, 0018, 'el estado del vehículo se encuentra bien.', '0017-2018-08-15.jpg', '2018-08-20', 0017),
(0008, '2018-08-02', 'Mécanico Normal', 4500, 0018, 'El vehiculo va bien.', '0017-2018-08-02.jpg', '2018-08-29', 0017),
(0009, '2018-08-20', 'Mécanico López', 2300, 0024, 'Verificación exitosa', '0017-2018-08-20.png', '2018-10-03', 0017),
(0010, '2018-10-03', 'Ford Zapata', 4300, 0018, 'Se realizo la verificación del vehiculo.', '0017-2018-10-03.jpg', '2018-12-12', 0017);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL,
  `fecha_salida` date NOT NULL,
  `destino` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `motivo` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `estado_viaje` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `observaciones` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_vehiculo` int(8) UNSIGNED ZEROFILL NOT NULL,
  `id_usuario` int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id_viaje`, `fecha_salida`, `destino`, `motivo`, `estado_viaje`, `observaciones`, `id_vehiculo`, `id_usuario`) VALUES
(00000005, '2018-07-24', 'Michoacan', 'VIAJE A MICHOACAN', 'Finalizado', '', 00000024, 0017),
(00000008, '2018-07-27', 'pachuca', 'traer equipos de pachuca', 'Iniciado', 'salio Humberto y David', 00000018, 0023),
(00000009, '2018-08-02', 'PUEBLA', 'ENTREGA DE LAMPARAS', 'Primera revision', 'CLINICA PRADOS', 00000018, 0017),
(00000010, '2018-08-08', 'Puerto de Veracruz', 'Dejar  autoclave.', 'Eliminado', 'Unidad limpia', 00000017, 0020),
(00000011, '2018-08-25', 'Puerto de Veracruz', 'Vacaciones', 'Eliminado', 'El vehiculo va en buen estado.', 00000021, 0019),
(00000012, '2018-08-30', 'Cholula', 'Viaje de negocios.', 'Eliminado', 'El vehiculo lleva raspaduras.', 00000022, 0020),
(00000013, '2018-08-10', 'Hermosillo', 'Entrega de equipo.', 'Eliminado', 'El viaje se inicia Viernes.', 00000019, 0023),
(00000014, '2018-08-10', 'Sonora', 'Entrega de equipos.', 'Eliminado', 'El vehículo va en buen estado.', 00000024, 0021),
(00000015, '2018-08-10', 'Xalapa', 'Entrega de Equipo Médico.', 'Finalizado', 'El vehiculo, lleva raspaduras en la salpicadera.', 00000022, 0019),
(00000016, '2018-08-08', 'Saltillo', 'Ir por equipo.', 'Finalizado', 'El vehículo va cargado.', 00000020, 0025),
(00000017, '2018-08-10', 'Saltillo', 'Entrega de equipos.', 'Finalizado', 'Llevan equipos grandes.', 00000022, 0017),
(00000018, '2018-08-31', 'Sin destino', 'prueba', 'Finalizado', 'prueba', 00000022, 0021),
(00000019, '2018-08-10', 'San pedro', 'Entregar 4 camas Stryker', 'Finalizado', 'Dr. Mejia', 00000025, 0025);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalle_viaje`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalle_viaje` (
`id_viaje` int(8) unsigned zerofill
,`fecha_salida` date
,`destino` varchar(20)
,`motivo` varchar(35)
,`observaciones` varchar(100)
,`estado_viaje` varchar(25)
,`marca` varchar(20)
,`modelo` varchar(20)
,`placa` varchar(8)
,`rendimiento` float
,`vigencia_tarjeta` date
,`kilometraje` int(8)
,`nombre` varchar(25)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_viajes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_viajes` (
`ID` int(8) unsigned zerofill
,`FECHA_SALIDA` date
,`DESTINO` varchar(20)
,`ESTADO_VIAJE` varchar(25)
,`MOTIVO` varchar(35)
,`OBSERVACIONES` varchar(100)
,`ID_VEHICULO` int(4) unsigned zerofill
,`MODELO_VEHICULO` varchar(20)
,`ID_USUARIO` int(4) unsigned zerofill
,`CONDUCTOR` varchar(25)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalle_viaje`
--
DROP VIEW IF EXISTS `vista_detalle_viaje`;

CREATE VIEW `vista_detalle_viaje`  AS  select `viajes`.`id_viaje` AS `id_viaje`,`viajes`.`fecha_salida` AS `fecha_salida`,`viajes`.`destino` AS `destino`,`viajes`.`motivo` AS `motivo`,`viajes`.`observaciones` AS `observaciones`,`viajes`.`estado_viaje` AS `estado_viaje`,`vehiculos`.`marca` AS `marca`,`vehiculos`.`modelo` AS `modelo`,`vehiculos`.`placa` AS `placa`,`vehiculos`.`rendimiento` AS `rendimiento`,`vehiculos`.`vigencia_tarjeta` AS `vigencia_tarjeta`,`vehiculos`.`kilometraje` AS `kilometraje`,`usuarios`.`nombre` AS `nombre` from ((`viajes` join `vehiculos` on(`vehiculos`.`id_vehiculo` = `viajes`.`id_vehiculo`)) join `usuarios` on(`usuarios`.`id_usuario` = `viajes`.`id_usuario`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_viajes`
--
DROP VIEW IF EXISTS `vista_viajes`;

CREATE VIEW `vista_viajes`  AS  select `viajes`.`id_viaje` AS `ID`,`viajes`.`fecha_salida` AS `FECHA_SALIDA`,`viajes`.`destino` AS `DESTINO`,`viajes`.`estado_viaje` AS `ESTADO_VIAJE`,`viajes`.`motivo` AS `MOTIVO`,`viajes`.`observaciones` AS `OBSERVACIONES`,`vehiculos`.`id_vehiculo` AS `ID_VEHICULO`,`vehiculos`.`modelo` AS `MODELO_VEHICULO`,`usuarios`.`id_usuario` AS `ID_USUARIO`,`usuarios`.`nombre` AS `CONDUCTOR` from ((`viajes` join `vehiculos` on(`vehiculos`.`id_vehiculo` = `viajes`.`id_vehiculo`)) join `usuarios` on(`usuarios`.`id_usuario` = `viajes`.`id_usuario`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actualizacion_kilometraje`
--
ALTER TABLE `actualizacion_kilometraje`
  ADD PRIMARY KEY (`id_actualizacion`);

--
-- Indices de la tabla `biaticos_extra`
--
ALTER TABLE `biaticos_extra`
  ADD PRIMARY KEY (`id_biatico`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `factura_gasolina`
--
ALTER TABLE `factura_gasolina`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD PRIMARY KEY (`id_incidente`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD PRIMARY KEY (`id_manteniento`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD PRIMARY KEY (`id_presupuesto`),
  ADD UNIQUE KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `revision_final`
--
ALTER TABLE `revision_final`
  ADD PRIMARY KEY (`id_revision_final`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `revision_vehiculo`
--
ALTER TABLE `revision_vehiculo`
  ADD PRIMARY KEY (`id_revision`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id_seguro`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- Indices de la tabla `verificaciones`
--
ALTER TABLE `verificaciones`
  ADD PRIMARY KEY (`id_verificacion`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id_viaje`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actualizacion_kilometraje`
--
ALTER TABLE `actualizacion_kilometraje`
  MODIFY `id_actualizacion` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `biaticos_extra`
--
ALTER TABLE `biaticos_extra`
  MODIFY `id_biatico` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_gasolina`
--
ALTER TABLE `factura_gasolina`
  MODIFY `id_factura` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  MODIFY `id_incidente` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  MODIFY `id_manteniento` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  MODIFY `id_presupuesto` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `revision_final`
--
ALTER TABLE `revision_final`
  MODIFY `id_revision_final` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `revision_vehiculo`
--
ALTER TABLE `revision_vehiculo`
  MODIFY `id_revision` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id_seguro` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `verificaciones`
--
ALTER TABLE `verificaciones`
  MODIFY `id_verificacion` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id_viaje` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `biaticos_extra`
--
ALTER TABLE `biaticos_extra`
  ADD CONSTRAINT `biaticos_extra_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id_viaje`);

--
-- Filtros para la tabla `factura_gasolina`
--
ALTER TABLE `factura_gasolina`
  ADD CONSTRAINT `factura_gasolina_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id_viaje`);

--
-- Filtros para la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD CONSTRAINT `incidentes_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id_viaje`);

--
-- Filtros para la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD CONSTRAINT `mantenimientos_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD CONSTRAINT `presupuestos_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id_viaje`);

--
-- Filtros para la tabla `revision_final`
--
ALTER TABLE `revision_final`
  ADD CONSTRAINT `revision_final_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id_viaje`);

--
-- Filtros para la tabla `revision_vehiculo`
--
ALTER TABLE `revision_vehiculo`
  ADD CONSTRAINT `revision_vehiculo_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id_viaje`);

--
-- Filtros para la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD CONSTRAINT `seguro_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `verificaciones`
--
ALTER TABLE `verificaciones`
  ADD CONSTRAINT `verificaciones_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `verificaciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;
