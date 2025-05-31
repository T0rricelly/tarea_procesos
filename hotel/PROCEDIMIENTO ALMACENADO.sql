# 1 Procedimiento almacenado para crear una nueva reserva 
DELIMITER //


CREATE PROCEDURE crear_reserva(
    IN p_fecha_reserva TIMESTAMP,
    IN p_fecha_entrada DATE,
    IN p_fecha_salida DATE,
    IN p_id_habitacion INT,
    IN p_id_cliente SMALLINT,
  
    IN p_costo_base DECIMAL(10,2)
)
BEGIN
    DECLARE dias_anticipacion INT;
    DECLARE descuento DECIMAL(5,2);
    DECLARE costo_total DECIMAL(10,2);

    # Calcular días de anticipación
    SET dias_anticipacion = DATEDIFF(p_fecha_entrada, DATE(p_fecha_reserva));

    #  Calcular descuento
    IF dias_anticipacion >= 15 THEN
        SET descuento = 0.10;
    ELSE
        SET descuento = 0.00;
    END IF;

    # Calcular costo total usando la función
    SET costo_total = calcular_costo_total(p_fecha_reserva, p_fecha_entrada, p_costo_base);

    # Insertar reserva
    INSERT INTO reserva (
        fecha_reserva,
        fecha_entrada,
        fecha_salida,
        id_habitacion,
        id_cliente,
     
        costo_base,
        descuento_aplicado,
        costo_total
    ) VALUES (
        p_fecha_reserva,
        p_fecha_entrada,
        p_fecha_salida,
        p_id_habitacion,
        p_id_cliente,
       
        p_costo_base,
        descuento,
        costo_total
    );
END //

# INSERTAMOS RESERVA

CALL crear_reserva(
    NOW(),               -- fecha_reserva
    '2025-06-20',        -- fecha_entrada
    '2025-06-25',        -- fecha_salida
    1,                   -- id_habitacion
    101,                 -- id_cliente
	500.00               -- costo_base
);