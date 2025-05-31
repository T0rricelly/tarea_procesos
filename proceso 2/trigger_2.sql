#  tigger

DELIMITER $$
CREATE TRIGGER trg_prevent_duplicate_cita
BEFORE INSERT ON Cita
FOR EACH ROW
BEGIN
       IF NOT fn_verificar_disponibilidad_barbero(NEW.Empleadoid, NEW.fecha_cita) THEN
	   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una cita agendada para este barbero en la fecha y hora seleccionadas. Por favor, elija otro horario.';
    END IF;
END$$
DELIMITER ;
