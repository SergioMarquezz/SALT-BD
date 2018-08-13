
CREATE VIEW vista_detalle_viaje  
AS  select viajes.id_viaje AS id_viaje,
viajes.fecha_salida AS fecha_salida,
viajes.destino AS destino,
viajes.motivo AS motivo,
viajes.observaciones AS observaciones,
viajes.estado_viaje AS estado_viaje,
vehiculos.marca AS marca,
vehiculos.modelo AS modelo,
vehiculos.placa AS placa,
vehiculos.rendimiento AS rendimiento,
vehiculos.vigencia_tarjeta AS vigencia_tarjeta,
vehiculos.kilometraje AS kilometraje,
usuarios.nombre AS nombre 
from ((viajes join vehiculos on(vehiculos.id_vehiculo = viajes.id_vehiculo)) 
join usuarios on(usuarios.id_usuario = viajes.id_usuario)) ;


CREATE VIEW vista_viajes  
AS  select viajes.id_viaje AS ID,
viajes.fecha_salida AS FECHA_SALIDA,
viajes.destino AS DESTINO,
viajes.estado_viaje AS ESTADO_VIAJE,
viajes.motivo AS MOTIVO,
viajes.observaciones AS OBSERVACIONES,
vehiculos.id_vehiculo AS ID_VEHICULO,
vehiculos.modelo AS MODELO_VEHICULO,
usuarios.id_usuario AS ID_USUARIO,
usuarios.nombre AS CONDUCTOR 
from ((viajes join vehiculos on(vehiculos.id_vehiculo = viajes.id_vehiculo)) 
join usuarios on(usuarios.id_usuario = viajes.id_usuario)) ;
