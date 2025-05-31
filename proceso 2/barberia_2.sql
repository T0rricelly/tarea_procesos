DROP DATABASE IF EXISTS barberia_2;
create database barberia_2;
use barberia_2;

CREATE TABLE Rh (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    rh VARCHAR(50)
);
CREATE TABLE Rol (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    rol VARCHAR(50)
);
CREATE TABLE Tipo_documento (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_documento VARCHAR(100)
);
CREATE TABLE Estado_Producto (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    estado VARCHAR(50)
);
CREATE TABLE Marca (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    marca VARCHAR(100)
);
CREATE TABLE Categoria (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    categoria VARCHAR(100)
);
CREATE TABLE Tipo_Servicio (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_servicio VARCHAR(100)
);
CREATE TABLE Cliente (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    documento INT(10),
    telefono INT(10),
    direccion VARCHAR(255),
    primer_apellido VARCHAR(100),
    segundo_apellido VARCHAR(100),
    correo VARCHAR(255)
);
ALTER TABLE cliente
ADD COLUMN Tipo_documentoid INT(10);
SELECT * FROM cliente;

CREATE TABLE Empleado (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    primerApellido VARCHAR(100),
    segundoApellido VARCHAR(100),
    documento INT(10) UNIQUE,
    telefono INT(10),
    direccion VARCHAR(255),
    correo VARCHAR(255) UNIQUE,
    Tipo_documentoid INT(10),
    Rhid INT(10),
    Rolid INT(10)
);
-- Constraint Rhid
ALTER TABLE Empleado
ADD CONSTRAINT Fk_rhid
FOREIGN KEY (Rhid)
REFERENCES Rh(id);
-- Constraint Rolid
ALTER TABLE Empleado
ADD CONSTRAINT Fk_rolid
FOREIGN KEY (Rolid)
REFERENCES Rol(id);
-- Constraint Tipo De Documento
ALTER TABLE Empleado
ADD CONSTRAINT Fk_tipo_documento
FOREIGN KEY (Tipo_documentoid)
REFERENCES Tipo_Documento(id);

CREATE TABLE Estado_Cita (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    estado VARCHAR(100)
);

CREATE TABLE Producto (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    precio INT(10),
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    stock INT(10),
    Categoriaid INT(10),
    Marcaid INT(10),
    Estado_Productoid INT(10)
);
-- Constraint Categoria
ALTER TABLE Producto
ADD CONSTRAINT Fk_categoriaid
FOREIGN KEY (Categoriaid)
REFERENCES Categoria(id);
-- Constraint Marca
ALTER TABLE Producto 
ADD CONSTRAINT Fk_marcaid
FOREIGN KEY (Marcaid)
REFERENCES Marca(id);
-- Constraint Estado
ALTER TABLE Producto 
ADD CONSTRAINT Fk_estado_productoid
FOREIGN KEY (Estado_Productoid)
REFERENCES Estado_Producto(id);
CREATE TABLE Servicio (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Tipo_Servicioid INT(10),
    precio INT(10),
    descripcion VARCHAR(255)
);
-- Constraint Tipo De Servicio
ALTER TABLE Servicio  
ADD CONSTRAINT Fk_tipo_servicioid
FOREIGN KEY (Tipo_Servicioid)
REFERENCES Tipo_Servicio(id);
CREATE TABLE Venta_Producto (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_venta TIMESTAMP,
    total_venta INT(10),
    producto_id INT(10),
    cantidad INT(10),
    cliente_id INT(10),
    empleado_id INT(10)
);
-- Constraint Producto id
ALTER TABLE Venta_Producto 
ADD CONSTRAINT Fk_empleado_id
FOREIGN KEY (empleado_id)
REFERENCES empleado(id);

ALTER TABLE Venta_Producto 
ADD CONSTRAINT Fk_cliente_id
FOREIGN KEY (cliente_id)
REFERENCES cliente(id);

ALTER TABLE Venta_Producto 
ADD CONSTRAINT Fk_venta_productoid
FOREIGN KEY (producto_id)
REFERENCES Producto(id);

CREATE TABLE Venta_Servicio (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    documento INT(10),
    telefono INT(10),
    direccion VARCHAR(255),
    nombre VARCHAR(100),
    primer_apellido VARCHAR(100),
    segundo_apellido VARCHAR(100),
    correo VARCHAR(255),
    Servicioid INT(10)
);
-- Constraint Servicio id 
ALTER TABLE Venta_Servicio 
ADD CONSTRAINT Fk_venta_servicioid
FOREIGN KEY (Servicioid)
REFERENCES Servicio(id);

CREATE TABLE Cita (
    id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_cita TIMESTAMP,
    fecha_creacion DATE,
    Servicioid INT(10),
    Estado_Citaid INT(10),
    Clienteid INT(10),
    Empleadoid INT(10)
);

-- Constraint Servicio id
ALTER TABLE Cita 
ADD CONSTRAINT Fk_servicioid
FOREIGN KEY (Servicioid)
REFERENCES Servicio(id);
-- Constraint Estado Cita id
ALTER TABLE Cita 
ADD CONSTRAINT Fk_estado_citaid
FOREIGN KEY (Estado_Citaid)
REFERENCES Estado_Cita(id);
-- Constraint Cliente id 
ALTER TABLE Cita 
ADD CONSTRAINT Fk_clienteid
FOREIGN KEY (Clienteid)
REFERENCES Cliente(id);
-- Constraint Empleado id
ALTER TABLE Cita 
ADD CONSTRAINT Fk_empleadoid
FOREIGN KEY (Empleadoid)
REFERENCES Empleado(id);

CREATE TABLE Factura (
    id INT(10) PRIMARY KEY ,
    fechaVenta TIMESTAMP,
    cantidad INT(10),
    total INT(10),
    servicio_id INT(10),
    producto_id INT(10),
    cliente_id INT(10),
    empleado_id INT(10)
);
ALTER TABLE factura
MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;
-- Constraint Servicio id 
ALTER TABLE Factura 
ADD CONSTRAINT Fk_factura_servicioid
FOREIGN KEY (servicio_id)
REFERENCES Servicio(id);
-- Constraint Producto id
ALTER TABLE Factura 
ADD CONSTRAINT Fk_factura_productoid
FOREIGN KEY (producto_id)
REFERENCES Producto(id);
-- Constraint  Cliente id
ALTER TABLE Factura 
ADD CONSTRAINT Fk_factura_clienteid
FOREIGN KEY (cliente_id)
REFERENCES Cliente(id);
-- Constraint Empleado id
ALTER TABLE Factura 
ADD CONSTRAINT Fk_factura_empleadoid
FOREIGN KEY (empleado_id)
REFERENCES Empleado(id);

-- Cambiar campo
ALTER TABLE Cliente CHANGE COLUMN correo email VARCHAR(50);








