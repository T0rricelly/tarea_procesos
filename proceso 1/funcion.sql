DELIMITER //
CREATE FUNCTION `calcular_total_venta` (cantidad INT, precio INT)
RETURNS INTEGER
BEGIN
    RETURN cantidad * precio;
END;//