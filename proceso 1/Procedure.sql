DELIMITER //
CREATE PROCEDURE `registrar_compra` (
    IN fechaVenta TIMESTAMP, 
    IN cantidad INT,
    IN Servicioid INT, 
    IN Productoid INT, 
    IN Clienteid INT, 
    IN Empleadoid INT,
    IN precio INT
)
BEGIN 
	DECLARE stock_actual INT;
    DECLARE total_calculado INT;
    SELECT stock INTO stock_actual FROM producto WHERE id = Productoid;
    SET total_calculado = calcular_total_venta(cantidad, precio);
    INSERT INTO venta_producto (fecha_venta, total_venta, producto_id, cantidad, cliente_id, empleado_id )
    VALUES(fecha_venta, total_calculado, Productoid, cantidad, Clienteid, Empleadoid );

    INSERT INTO factura (fechaVenta, cantidad, total, servicio_id, producto_id, cliente_id, empleado_id) 
    VALUES (fechaVenta, cantidad, total_calculado, Servicioid, Productoid, Clienteid, Empleadoid);
    
    IF stock < cantidad THEN 
		SIGNAL SQLSTATE '50000'
        SET MESSAGE_TEXT = 'Stock Insuficiente';
	END IF;
END;//