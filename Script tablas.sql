CREATE DATABASE salt;
USE salt;


CREATE TABLE actualizacion_kilometraje (
  id_actualizacion INT(10) UNSIGNED ZEROFILL NOT NULL,
  id_vehiculo INT(8) UNSIGNED ZEROFILL DEFAULT NULL,
  anterior_kilometraje INT(8) DEFAULT NULL,
  nuevo_kilometraje INT(8) DEFAULT NULL,
  fecha_cambiado DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE biaticos_extra (
  id_biatico INT(8) UNSIGNED ZEROFILL NOT NULL,
  fecha DATE NOT NULL,
  concepto VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  importe FLOAT(4,2) NOT NULL,
  observaciones VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  id_viaje INT(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE factura_gasolina (
  id_factura INT(8) UNSIGNED ZEROFILL NOT NULL,
  fecha DATE NOT NULL,
  tipo_combustible VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
  litros_recargados FLOAT NOT NULL,
  importe FLOAT NOT NULL,
  descripcion TEXT COLLATE utf8_unicode_ci DEFAULT NULL,
  foto_factura VARCHAR(255) DEFAULT NULL,
  id_viaje INT(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE incidentes (
  id_incidente INT(8) UNSIGNED ZEROFILL NOT NULL,
  proveedor VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  importe FLOAT(4,2) NOT NULL,
  descripcion VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  observaciones VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  foto_factura MEDIUMBLOB DEFAULT NULL,
  id_viaje INT(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE mantenimientos (
  id_manteniento INT(8) UNSIGNED ZEROFILL NOT NULL,
  fecha_mantenimiento DATE NOT NULL,
  proveedor VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  importe FLOAT(4,2) NOT NULL,
  alineacion VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  estado_llantas VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  descripcion VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
  foto_factura MEDIUMBLOB DEFAULT NULL,
  id_vehiculo INT(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE presupuestos (
  id_presupuesto INT(8) UNSIGNED ZEROFILL NOT NULL,
  distancia INT(5) NOT NULL,
  precio_combustible FLOAT NOT NULL,
  total_combustible FLOAT NOT NULL,
  litros_combustible FLOAT NOT NULL,
  vale_gasolina TINYINT(4) NOT NULL,
  no_vale VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  total_casetas INT(2) NOT NULL,
  gasto_casetas FLOAT NOT NULL,
  no_personas INT(2) NOT NULL,
  hotel FLOAT NOT NULL,
  comida FLOAT NOT NULL,
  total_biaticos FLOAT NOT NULL,
  total_presupuesto FLOAT NOT NULL,
  id_viaje INT(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE revision_final (
  id_revision_final INT(8) UNSIGNED ZEROFILL NOT NULL,
  fecha_llegada DATE NOT NULL,
  kilometros_entrada INT(10) NOT NULL,
  total_km_recorridos INT(10) NOT NULL,
  aceite_motor VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  aceite_transmision VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  anticongelante VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  liquido_frenos VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  llanta_refaccion TINYINT(4) NOT NULL,
  llave_ruedas TINYINT(4) NOT NULL,
  verificacion TINYINT(4) NOT NULL,
  poliza_seguro TINYINT(4) DEFAULT NULL,
  gato TINYINT(4) NOT NULL,
  tarjeta_circulacion TINYINT(4) NOT NULL,
  cinchos INT(2) NOT NULL,
  matracas INT(2) NOT NULL,
  cobijas INT(2) NOT NULL,
  colchones INT(2) NOT NULL,
  rampas INT(2) DEFAULT NULL,
  limpieza_vehiculo VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
  nivel_gasolina_llegada FLOAT NOT NULL,
  observaciones VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  foto_frontal VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  foto_trasera VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  foto_izquierda VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  foto_derecha VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  id_viaje INT(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE revision_vehiculo (
  id_revision INT(8) UNSIGNED ZEROFILL NOT NULL,
  aceite_motor VARCHAR(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  aceite_transmision VARCHAR(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  anticongelante VARCHAR(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  liquido_frenos VARCHAR(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  llanta_refaccion TINYINT(4) NOT NULL,
  llave_ruedas TINYINT(4) NOT NULL,
  verificacion TINYINT(4) NOT NULL,
  poliza_seguro TINYINT(4) NOT NULL,
  gato TINYINT(4) NOT NULL,
  tarjeta_circulacion TINYINT(4) DEFAULT NULL,
  cinchos INT(2) NOT NULL,
  matracas INT(2) NOT NULL,
  cobijas INT(2) NOT NULL,
  colchones INT(2) NOT NULL,
  rampas INT(2) DEFAULT NULL,
  limpieza_vehiculo VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  nivel_gasolina_ida FLOAT NOT NULL,
  observaciones VARCHAR(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  foto_frontal VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  foto_trasera VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  foto_izquierda VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  foto_derecha VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  id_viaje INT(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE seguro (
  id_seguro INT(4) UNSIGNED ZEROFILL NOT NULL,
  no_poliza INT(15) NOT NULL,
  aseguradora VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  fecha_pago DATE NOT NULL,
  foto_poliza MEDIUMBLOB DEFAULT NULL,
  id_vehiculo INT(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE usuarios (
  id_usuario INT(4) UNSIGNED ZEROFILL NOT NULL,
  nombre VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  apellido VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  rol VARCHAR(15) COLLATE utf8_unicode_ci NOT NULL,
  correo VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  contrasenia VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  foto_perfil VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE vehiculos (
  id_vehiculo INT(4) UNSIGNED ZEROFILL NOT NULL,
  foto_vehiculo VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  marca VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  modelo VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  no_serie VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  anio VARCHAR(4) COLLATE utf8_unicode_ci NOT NULL,
  placa VARCHAR(8) COLLATE utf8_unicode_ci NOT NULL,
  capacidad_tanque INT(4) NOT NULL,
  tipo_combustible VARCHAR(9) COLLATE utf8_unicode_ci NOT NULL,
  rendimiento FLOAT NOT NULL,
  numero_tarjeta VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  estado_tarjeta VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  vigencia_tarjeta DATE NOT NULL,
  kilometraje INT(8) NOT NULL,
  periodo_mantenimiento VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  estado_vehiculo VARCHAR(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE verificaciones (
  id_verificacion int(4) UNSIGNED ZEROFILL NOT NULL,
  fecha_verificacion date NOT NULL,
  proveedor varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  importe double(4,2) NOT NULL,
  encargado varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  descripcion varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  foto_factura mediumblob DEFAULT NULL,
  proxima_fecha date NOT NULL,
  id_vehiculo int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE viajes (
  id_viaje INT(8) UNSIGNED ZEROFILL NOT NULL,
  fecha_salida DATE NOT NULL,
  destino VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  motivo VARCHAR(35) COLLATE utf8_unicode_ci NOT NULL,
  estado_viaje VARCHAR(25) COLLATE utf8_unicode_ci NOT NULL,
  observaciones VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  id_vehiculo INT(8) UNSIGNED ZEROFILL NOT NULL,
  id_usuario INT(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE vista_detalle_viaje (
id_viaje int(8) unsigned zerofill,
fecha_salida date,
destino varchar(20),
motivo varchar(35),
observaciones varchar(100),
estado_viaje varchar(25),
marca varchar(20),
modelo varchar(20),
placa varchar(8),
rendimiento float,
vigencia_tarjeta date,
kilometraje int(8),
nombre varchar(25));


CREATE TABLE vista_viajes (
ID int(8) unsigned zerofill,
FECHA_SALIDA date,
DESTINO varchar(20),
ESTADO_VIAJE varchar(25),
MOTIVO varchar(35),
OBSERVACIONES varchar(100),
ID_VEHICULO int(4) unsigned zerofill,
MODELO_VEHICULO varchar(20),
ID_USUARIO int(4) unsigned zerofill,
CONDUCTOR varchar(25));