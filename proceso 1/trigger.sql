DELIMITER //
CREATE TRIGGER reducir_stock
AFTER INSERT ON venta_producto
FOR EACH ROW
BEGIN
    UPDATE producto 
    SET stock = stock - new.cantidad
    WHERE id = NEW.producto_id;
END;//
