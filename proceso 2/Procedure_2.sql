# procedimiento almacenado
DELIMITER $$
CREATE PROCEDURE sp_agendar_cita_segura(
    IN p_fecha_cita TIMESTAMP,
    IN p_fecha_creacion DATE,
    IN p_servicio_id INT,
    IN p_estado_cita_id INT,
    IN p_cliente_id INT,
    IN p_empleado_id INT
)
BEGIN
    # verifica la disponibilidad del barbero 
    IF fn_verificar_disponibilidad_barbero(p_empleado_id, p_fecha_cita) THEN
        INSERT INTO Cita (fecha_cita, fecha_creacion, Servicioid, Estado_Citaid, Clienteid, Empleadoid)
        VALUES (p_fecha_cita, p_fecha_creacion, p_servicio_id, p_estado_cita_id, p_cliente_id, p_empleado_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El barbero no está disponible para la fecha y hora seleccionadas.';
    END IF;
END$$
DELIMITER ;