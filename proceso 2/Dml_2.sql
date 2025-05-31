SELECT * FROM tipo_documento;
SELECT * FROM estado_producto;
SELECT * FROM rh;
SELECT * FROM rol;
SELECT * FROM categoria;
SELECT * FROM venta_producto;
SELECT * FROM tipo_servicio;
SELECT * FROM servicio;
SELECT * FROM venta_servicio;
SELECT * FROM marca;
SELECT * FROM estado_cita;
SELECT * FROM cliente;
SELECT * FROM cita;
SELECT * FROM empleado;
SELECT * FROM factura;
SELECT * FROM producto;


-- Insertar dato Estado del producto
INSERT INTO estado_producto 
VALUES(1,"Disponible"),(2,"Agotado"); 


-- Insertar dato Rh
INSERT INTO rh 
VALUES(1,"O+"),(2,"O-"),(3,"A-"),(4,"A+"),(5,"B-"),(6,"B+"),(7,"AB-"), (8,"AB+"); 

-- insertar datos rol
INSERT INTO rol 
VALUES(1, "Barbero"),(2,"Estilista"),(3,"Manicurista");


-- insertar datos Marca
INSERT INTO marca 
VALUES(1, "Wahl"),(2,"Prime"),(3,"Imperio"),(4,"Gama");


-- insertar datos tipo documento 
INSERT INTO tipo_documento 
VALUES(1, "CC"),(2,"CE"),(3,"TI"),(4,"PP");

INSERT INTO categoria  
VALUES (1,"Maquina de cortar pelo"),(2,"Tratamientos capilares"),(3,"Fijadores de cabello");


-- insertar datos venta producto
INSERT INTO venta_producto (total_venta) 
VALUES(20000),(25000);

-- Tipo servicio
INSERT INTO tipo_servicio (tipo_servicio) 
VALUES("Barberia"),("Manicure"),("Peluqueria");


-- Servicio
INSERT INTO servicio (id,tipo_servicioid, precio, descripcion)
VALUES (1,1, 20000, "");


INSERT INTO venta_servicio 
VALUES(1, 1031652352,3152073134, "BOGOTA", "Santiago", "Torres", "Higuera", "santiago@gmail.com",1);

INSERT INTO estado_cita (estado)
VALUES ("Reservado"),("Cancelado"),("Pendiente");

INSERT INTO empleado (id,nombre,primerApellido,segundoApellido,documento,telefono,direccion,Tipo_documentoid,Rhid,Rolid)
VALUES(1,"Santiago", "Torres", "Higuera", 1031652358, 3152073134, "bogota", 1, 1, 1);
UPDATE empleado SET correo = "santiago@gmail.com" WHERE	correo IS NULL;

INSERT INTO cliente (nombre,documento,telefono,direccion,primer_apellido,segundo_apellido,email,Tipo_documentoid)
VALUES ("Trony", 103165253,3152073134, "Bogota", "Martinez", "Rodriguez", "trony@gmail.com", 1);

INSERT INTO cita (servicioid, Estado_citaid, clienteid, empleadoid)
VALUES (1,2,1,1);
UPDATE cita SET fecha_creacion = now() WHERE fecha_creacion IS NULL;

INSERT INTO producto (precio,nombre,descripcion,stock,Categoriaid,Marcaid,Estado_Productoid)
VALUES(10000, "Cera", "Cera capilar fijadora", 20, 3, 1, 1);

INSERT INTO factura (cantidad,total,servicio_id,producto_id,cliente_id,Empleadoid)
VALUES (5, 50000, 1, 1, 1, 1);