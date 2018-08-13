
DELIMITER $$
CREATE PROCEDURE agregarVehiculoImagen (
	IN foto VARCHAR(255), 
	IN marcaVehi VARCHAR(20), 
	IN modeloVehi VARCHAR(20), 
	IN numSerie VARCHAR(25), 
	IN anio VARCHAR(4), 
	IN placaVehi VARCHAR(8), 
	IN tanque INT(4), 
	IN combustible VARCHAR(9), 
	IN rendiVehi FLOAT, 
	IN numTarjeta VARCHAR(25), 
	IN estTarjeta VARCHAR(25), 
	IN vijeTarjeta DATE, 
	IN km INT(8), 
	IN manteVehi VARCHAR(20), 
	IN estadoVehi VARCHAR(15))  
BEGIN
	INSERT INTO vehiculos(foto_vehiculo,marca,modelo,no_serie,anio,placa,capacidad_tanque,tipo_combustible,
    rendimiento,numero_tarjeta,estado_tarjeta,vigencia_tarjeta,kilometraje,periodo_mantenimiento,estado_vehiculo)
    
    VALUES(foto,marcaVehi,modeloVehi,numSerie,anio,placaVehi,tanque,combustible,
    rendiVehi,numTarjeta,estTarjeta,vijeTarjeta,km,manteVehi,estadoVehi);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_presupuesto (
	IN dist INT(5), 
	IN precio_c FLOAT, 
	IN total_c FLOAT, 
	IN litros_C FLOAT, 
	IN vale_c TINYINT(4), 
	IN n_vale VARCHAR(10), 
	IN t_casetas INT(2), 
	IN g_casetas FLOAT, 
	IN n_personas INT(2), 
	IN t_hotel FLOAT, 
	IN t_comida FLOAT, 
	IN t_biaticos FLOAT, 
	IN t_presupuesto FLOAT, 
	IN id_via INT(8))  
BEGIN
    INSERT INTO presupuestos(distancia,precio_combustible,total_combustible,litros_combustible,vale_gasolina,no_vale,
                            total_casetas,gasto_casetas,no_personas,hotel,comida,total_biaticos, total_presupuesto,id_viaje)
        VALUES(dist,precio_c,total_c,litros_c,vale_c,n_vale,t_casetas,g_casetas,n_personas,t_hotel,t_comida,t_biaticos,t_presupuesto,id_via);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_revision (
	IN aceite_m VARCHAR(25), 
	IN aceite_t VARCHAR(25), 
	IN anti VARCHAR(25), 
	IN liquido_fre VARCHAR(25), 
	IN llanta TINYINT(4), 
	IN llave TINYINT(4), 
	IN veri TINYINT(4), 
	IN poliza TINYINT(4), 
	IN gato TINYINT(4), 
	IN tarjeta TINYINT(4), 
	IN cin INT(2), 
	IN mat INT(2), 
	IN cob INT(2), 
	IN col INT(2), 
	IN ram INT(2), 
	IN limpieza VARCHAR(10), 
	IN nivel FLOAT, 
	IN obs VARCHAR(100), 
	IN foto_f VARCHAR(50), 
	IN foto_t VARCHAR(50), 
	IN foto_i VARCHAR(50), 
	IN foto_d VARCHAR(50), 
	IN id_via INT(8))  
BEGIN
    INSERT INTO revision_vehiculo(aceite_motor,aceite_transmision,anticongelante,liquido_frenos,llanta_refaccion,llave_ruedas,
                            verificacion,poliza_seguro,gato,tarjeta_circulacion,cinchos,matracas,cobijas,colchones,rampas,limpieza_vehiculo,
			     nivel_gasolina_ida,observaciones,foto_frontal,foto_trasera,foto_izquierda,foto_derecha,id_viaje)
	VALUES(aceite_m,aceite_t,anti,liquido_fre,llanta,llave,veri,poliza,gato,tarjeta,cin,mat,cob,col,ram,limpieza,nivel,obs,foto_f,
	       foto_t,foto_i,foto_d,id_via);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_revision_final (
	IN fecha DATE, 
	IN kilometros_e INT(10), 
	IN kilometros_t INT(10), 
	IN aceite_m VARCHAR(25), 
	IN aceite_t VARCHAR(25), 
	IN anti VARCHAR(25), 
	IN liquido_fre VARCHAR(25), 
	IN llanta TINYINT(4), 
	IN llave TINYINT(4), 
	IN veri TINYINT(4), 
	IN poliza TINYINT(4), 
	IN gato TINYINT(4), 
	IN tarjeta TINYINT(4), 
	IN cin INT(2), 
	IN mat INT(2), 
	IN cob INT(2), 
	IN col INT(2), 
	IN ram INT(2), 
	IN limpieza VARCHAR(10), 
	IN nivel FLOAT, 
	IN obs VARCHAR(100), 
	IN foto_f VARCHAR(50), 
	IN foto_t VARCHAR(50), 
	IN foto_i VARCHAR(50), 
	IN foto_d VARCHAR(50), 
	IN id_via INT(8)) 
 BEGIN
    INSERT INTO revision_final(fecha_llegada, kilometros_entrada, total_km_recorridos, aceite_motor,aceite_transmision,anticongelante,liquido_frenos,llanta_refaccion,llave_ruedas,
                            verificacion,poliza_seguro,gato,tarjeta_circulacion,cinchos,matracas,cobijas,colchones,rampas,limpieza_vehiculo,
			     nivel_gasolina_llegada,observaciones,foto_frontal,foto_trasera,foto_izquierda,foto_derecha,id_viaje)
	VALUES(fecha,kilometros_e,kilometros_t,aceite_m,aceite_t,anti,liquido_fre,llanta,llave,veri,poliza,gato,tarjeta,cin,mat,cob,col,ram,limpieza,nivel,obs,foto_f,
	       foto_t,foto_i,foto_d,id_via);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_travel (
	IN f_salida DATE, 
	IN dest VARCHAR(20), 
	IN mot VARCHAR(35), 
	IN obs VARCHAR(50), 
	IN id_ve INT(8), 
	IN id_us INT(4))  
BEGIN
    INSERT INTO viajes(fecha_salida,destino,motivo,estado_viaje,
		       observaciones,id_vehiculo,id_usuario)
    VALUES(f_salida,dest,mot,'Iniciado',obs,id_ve,id_us);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user (
IN name VARCHAR(25), 
IN last_name VARCHAR(25), 
IN rol VARCHAR(15), 
IN email VARCHAR(25), 
IN pass VARCHAR(20))  
BEGIN
    INSERT INTO usuarios(nombre,apellido,rol,correo,contrasenia)
    VALUES(name,last_name,rol,email,pass);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE insert_seguro(
	IN poliza INT(4),
    IN seguro VARCHAR(35),
    IN periodo VARCHAR(25),
    IN fecha DATE,
    IN fotoPoliza VARCHAR(255),
    IN idVehiculo INT(4))
BEGIN
	INSERT INTO seguro(no_poliza,aseguradora,fecha_pago,periodo_pago,fecha_registro,foto_poliza,foto_recibo,id_vehiculo,monto_total)
    VALUES(poliza,seguro,null,periodo,fecha,fotoPoliza,null,idVehiculo,null);
END $$
DELIMITER ;