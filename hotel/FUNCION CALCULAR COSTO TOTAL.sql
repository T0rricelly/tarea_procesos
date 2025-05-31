# FUNCION
# funcion para calcular el costo de la reserva segun la fecha y realizar descuento calcular_costo_total

DELIMITER //
CREATE FUNCTION calcular_costo_total(
    fecha_reserva TIMESTAMP,
    fecha_entrada DATE,
    costo_base DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE dias_anticipacion INT;
    DECLARE costo_final DECIMAL(10,2);

    SET dias_anticipacion = DATEDIFF(fecha_entrada, DATE(fecha_reserva));

    IF dias_anticipacion >= 15 THEN
        SET costo_final = costo_base * 0.90;
    ELSE
        SET costo_final = costo_base;
    END IF;

    RETURN costo_final;
END //

DELIMITER ;

# Verificar funcionamiento de la funcion descuento segun 15 de la fecha 

SELECT 
  id_reserva,
  fecha_reserva,
  fecha_entrada,
  costo_base,
  calcular_costo_total(fecha_reserva, fecha_entrada, costo_base) AS costo_recalculado
FROM reserva;