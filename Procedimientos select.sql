
DELIMITER $$
CREATE PROCEDURE select_cars ()  
BEGIN
	SELECT * FROM vehiculos WHERE estado_vehiculo = 'Activo';
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_drivers ()  
BEGIN
	SELECT * FROM usuarios WHERE rol = 'Conductor';
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_kilometraje (
	IN idVehiculo INT(4))  
BEGIN
	SELECT kilometraje FROM vehiculos WHERE id_vehiculo = idVehiculo;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_presupuesto (
	IN id_travel INT(8))  
BEGIN
	SELECT * FROM presupuestos WHERE id_viaje = id_travel;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_primera_revision (
	IN id_travel INT(8))  
BEGIN
	SELECT * FROM revision_vehiculo WHERE id_viaje = id_travel;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_rendimiento (
	IN id INT(8))  
BEGIN
	SELECT rendimiento FROM vehiculos WHERE id_vehiculo = id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_revision_final (
	IN idViaje INT(8))  
BEGIN
	SELECT FECHA_SALIDA,MODELO_VEHICULO,CONDUCTOR,ID FROM vista_viajes WHERE ID = idViaje;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_segunda_revision (
	IN id_travel INT(8))  
BEGIN
	SELECT * FROM revision_final WHERE id_viaje = id_travel;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_segunda_revision (
	IN id_travel INT(8))  
BEGIN
	SELECT * FROM revision_final WHERE id_viaje = id_travel;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_travel_detail (
IN id_travel INT(8))  
BEGIN
	SELECT * FROM vista_detalle_viaje WHERE id_viaje = id_travel;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_users (
IN idUsuario INT(4))  
BEGIN
	SELECT * FROM usuarios where estado_usuario = 'Activo' and id_usuario != idUsuario;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_vehiculo (
IN id_carro INT(4))  
BEGIN
	SELECT * FROM vehiculos WHERE id_vehiculo = id_carro;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_viajes ()  
BEGIN
	SELECT * FROM vista_viajes WHERE estado_viaje = 'Iniciado' 
	OR ESTADO_VIAJE = 'Presupuestado' 
    OR ESTADO_VIAJE = 'Primera revision';
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE validacion_user (
	IN user VARCHAR(50), 
	IN pass VARCHAR(50))  
BEGIN
	SELECT id_usuario,nombre,apellido,rol,correo,contrasenia FROM usuarios WHERE correo = user AND contrasenia = pass;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE select_verificaciones( 
    IN id_carro INT(4))
BEGIN 
    SELECT verificaciones.foto_factura, verificaciones.fecha_verificacion, verificaciones.proveedor, verificaciones.importe, 
    verificaciones.descripcion, usuarios.nombre FROM verificaciones 
    INNER JOIN usuarios ON usuarios.id_usuario = verificaciones.id_usuario 
    WHERE id_vehiculo = id_carro; 
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE select_seguro(
	IN idVehiculo INT(4))
BEGIN
	SELECT no_poliza, aseguradora,fecha_pago,fecha_registro,foto_poliza,monto_total,periodo_pago,modelo
    FROM seguro
    INNER JOIN vehiculos on vehiculos.id_vehiculo = seguro.id_vehiculo WHERE vehiculos.id_vehiculo = idVehiculo;
END $$
DELIMITER ;

DELIMITER $$
CREATE procedure select_fecha(
	IN cadena VARCHAR(25),
    IN IdVehiculo INT(4))
BEGIN

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
END $$
DELIMITER ;

DELIMITER $$
CREATE procedure select_seguro_importe(
	IN IdVehiculo INT(4))
BEGIN		      
SELECT SUM(monto_total) AS gasto FROM seguro WHERE id_vehiculo = IdVehiculo;
END $$
DELIMITER ;