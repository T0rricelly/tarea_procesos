# Actualizar el estado de la Habitacion 

DELIMITER //
CREATE TRIGGER actualizar_estado_habitacion
AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
    UPDATE habitacion
    SET id_estado = 2
    WHERE id_habitacion = NEW.id_habitacion;
END //

DELIMITER ;
# validar cambio estado 
select * from habitacion 

# Validar si la habitacion esta disponible

DELIMITER //
CREATE TRIGGER validar_estado_y_disponibilidad_reserva
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN
    DECLARE estado_habitacion INT;

    #Verificar el estado actual de la habitación
    SELECT id_estado INTO estado_habitacion
    FROM habitacion
    WHERE id_habitacion = NEW.id_habitacion;

    #  Si la habitación no está en estado 1 (Disponible), lanzar error
    IF estado_habitacion != 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La habitación no está disponible para reservar.';
    END IF;

    # Verificar disponibilidad en rango de fechas usando tu función
    IF NOT habitacion_disponible(NEW.id_habitacion, NEW.fecha_entrada, NEW.fecha_salida) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La habitación ya está reservada en ese rango de fechas.';
    END IF;
END //

DELIMITER ;
