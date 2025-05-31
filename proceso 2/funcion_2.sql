# funcion 

DELIMITER $$
CREATE FUNCTION fn_verificar_disponibilidad_barbero(
    p_empleado_id INT,
    p_fecha_hora_cita TIMESTAMP
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_citas_existentes INT;

    -- Cuenta cuántas citas existen para el empleado en la fecha y hora, considerando solo los estados de cita que "ocupan" al barbero (Programada o Confirmada).
    SELECT COUNT(*)
    INTO v_citas_existentes
    FROM Cita
    WHERE Empleadoid = p_empleado_id
      AND fecha_cita = p_fecha_hora_cita
      AND Estado_Citaid IN (1, 3); -- 1 es programada y 3 en confirmada

       IF v_citas_existentes > 0 THEN
        RETURN FALSE; 
    ELSE
        RETURN TRUE;
    END IF;
END$$
DELIMITER ;
