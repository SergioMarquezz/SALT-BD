DELIMITER $$
CREATE TRIGGER kilometraje_bu AFTER UPDATE ON vehiculos FOR EACH ROW 
INSERT INTO actualizacion_kilometraje(
	id_actualizacion, 
	id_vehiculo, 
	anterior_kilometraje,
	nuevo_kilometraje,    
	fecha_cambiado) 
  VALUES(0, OLD.id_vehiculo, OLD.kilometraje,
	 NEW.kilometraje, NOW())
$$
DELIMITER ;
