CREATE DATABASE hotel;
use  hotel;
-- drop database hotel;
CREATE TABLE cliente
(
	id_cliente smallint primary key,
    nombre_cleinte char(60) not null,
    telefono_cliente smallint not null,
    correo_cliente char(40) not null    
);

create table estado (
id_estado int primary key,
nombre_estado char(30) -- Activo  varchar(max)
);

create table habitacion (
id_habitacion int primary key auto_increment,
cantidad_persona_habitacion int, -- Ingresar cuantas personas caben por habotancion 
id_estado int -- 1 
);

ALTER TABLE habitacion  ADD  constraint fk_habitacion_estado foreign key (id_estado) references estado(id_estado);

# Tabla de reservas
CREATE TABLE reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    fecha_reserva TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    id_habitacion INT NOT NULL,
    id_cliente SMALLINT NOT NULL,
    costo_base DECIMAL(10,2),
    descuento_aplicado DECIMAL(5,2),
    costo_total DECIMAL(10,2)
  );
  
# Agregar Referencias FK

ALTER TABLE reserva ADD constraint fk_reserva_habitacion foreign key (id_habitacion) REFERENCES habitacion(id_habitacion);
ALTER TABLE reserva ADD constraint fk_reserva_cliente foreign key (id_cliente) REFERENCES cliente(id_cliente);
