
DELIMITER $$
CREATE PROCEDURE delete_user (
IN id INT)  
BEGIN
	DELETE FROM usuarios where id_usuario = id;
END$$
DELIMITER ;