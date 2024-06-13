-- Create database

CREATE DATABASE tallerauto_DB;

USE tallerauto_DB;

-- Create tables with indexing and constraints

CREATE TABLE clients (
  client_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  phone VARCHAR(10),
  email VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_client_name (name),
  INDEX idx_client_last_name (last_name)
) COMMENT='Stores client information';

CREATE TABLE client_history (
  history_id INT PRIMARY KEY,
  client_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  phone VARCHAR(10),
  email VARCHAR(255),
  changed_at DATETIME,
  action_type VARCHAR(255),
  FOREIGN KEY (client_id) REFERENCES clients(client_id),
  INDEX idx_client_history_client_id (client_id)
) COMMENT='Stores client history';

CREATE TABLE vehicles (
  vehicle_id INT PRIMARY KEY,
  plate_number VARCHAR(255) NOT NULL,
  brand VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  client_id INT NOT NULL,
  FOREIGN KEY (client_id) REFERENCES clients(client_id),
  INDEX idx_vehicles_client_id (client_id)
) COMMENT='Stores vehicle information';

CREATE TABLE vehicle_history (
  history_id INT PRIMARY KEY,
  vehicle_id INT NOT NULL,
  plate_number VARCHAR(255) NOT NULL,
  brand VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  client_id INT NOT NULL,
  changed_at DATETIME,
  action_type VARCHAR(255),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
  INDEX idx_vehicle_history_vehicle_id (vehicle_id)
) COMMENT='Stores vehicle history';

CREATE TABLE appointments (
  appointment_id INT PRIMARY KEY,
  date_time DATETIME NOT NULL,
  client_id INT NOT NULL,
  vehicle_id INT NOT NULL,
  FOREIGN KEY (client_id) REFERENCES clients(client_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
  INDEX idx_appointments_client_id (client_id),
  INDEX idx_appointments_vehicle_id (vehicle_id)
) COMMENT='Stores appointment information';

CREATE TABLE service_packages (
  package_id INT PRIMARY KEY,
  package_name VARCHAR(255) NOT NULL,
  package_description VARCHAR(255),
  package_cost DECIMAL(10, 2) NOT NULL,
  INDEX idx_service_packages_package_name (package_name)
) COMMENT='Stores service package information';

CREATE TABLE services (
  service_id INT PRIMARY KEY,
  service_name VARCHAR(255) NOT NULL,
  service_description VARCHAR(255),
  service_cost DECIMAL(10, 2) NOT NULL,
  INDEX idx_services_service_name (service_name)
) COMMENT='Stores service information';

CREATE TABLE package_services (
  package_id INT NOT NULL,
  service_id INT NOT NULL,
  PRIMARY KEY (package_id, service_id),
  FOREIGN KEY (package_id) REFERENCES service_packages(package_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id),
  INDEX idx_package_services_package_id (package_id),
  INDEX idx_package_services_service_id (service_id)
) COMMENT='Stores many-to-many relationship between packages and services';

CREATE TABLE inventories (
  inventory_id INT PRIMARY KEY,
  part_id INT NOT NULL,
  quantity INT NOT NULL,
  location VARCHAR(255) NOT NULL,
  FOREIGN KEY (part_id) REFERENCES parts(part_id),
  INDEX idx_inventories_part_id (part_id)
) COMMENT='Stores inventory information';

CREATE TABLE inventory_history (
  history_id INT PRIMARY KEY,
  inventory_id INT NOT NULL,
  part_id INT NOT NULL,
  quantity INT NOT NULL,
  location VARCHAR(255) NOT NULL,
  change_date DATE,
  change_time TIME,
  FOREIGN KEY (inventory_id) REFERENCES inventories(inventory_id),
  INDEX idx_inventory_history_inventory_id (inventory_id)
) COMMENT='Stores inventory history';

CREATE TABLE purchase_orders (
  order_id INT PRIMARY KEY,
  order_date DATE NOT NULL,
  supplier_id INT NOT NULL,
  employee_id INT NOT NULL,
  total_cost DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  INDEX idx_purchase_orders_supplier_id (supplier_id),
  INDEX idx_purchase_orders_employee_id (employee_id)
) COMMENT='Stores purchase order information';

CREATE TABLE order_details (
  order_id INT NOT NULL,
  part_id INT NOT NULL,
  quantity INT NOT NULL,
  part_price DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (order_id, part_id),
  FOREIGN KEY (order_id) REFERENCES purchase_orders(order_id),
  FOREIGN KEY (part_id) REFERENCES parts(part_id),
  INDEX idx_order_details_order_id (order_id),
  INDEX idx_order_details_part_id (part_id)
) COMMENT='Stores purchase order details';

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  phone VARCHAR(10),
  email VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_employees_employee_name (employee_name),
  INDEX idx_employees_last_name (last_name)
) COMMENT='Stores employee information';

CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  phone VARCHAR(10),
  email VARCHAR(255),
  contact_person VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_suppliers_supplier_name (supplier_name)
) COMMENT='Stores supplier information';

CREATE TABLE parts (
  part_id INT PRIMARY KEY,
  part_name VARCHAR(255) NOT NULL,
  part_description VARCHAR(255),
  part_cost DECIMAL(10, 2) NOT NULL,
  INDEX idx_parts_part_name (part_name)
) COMMENT='Stores part information';

CREATE TABLE repairs (
  repair_id INT PRIMARY KEY,
  vehicle_id INT NOT NULL,
  service_id INT NOT NULL,
  employee_id INT NOT NULL,
  repair_date DATE NOT NULL,
  repair_time TIME NOT NULL,
  repair_cost DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  INDEX idx_repairs_vehicle_id (vehicle_id),
  INDEX idx_repairs_service_id (service_id),
  INDEX idx_repairs_employee_id (employee_id)
) COMMENT='Stores repair information';

CREATE TABLE repair_parts (
  repair_id INT NOT NULL,
  part_id INT NOT NULL,
  quantity INT NOT NULL,
  part_price DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (repair_id, part_id),
  FOREIGN KEY (repair_id) REFERENCES repairs(repair_id),
  FOREIGN KEY (part_id) REFERENCES parts(part_id),
  INDEX idx_repair_parts_repair_id (repair_id),
  INDEX idx_repair_parts_part_id (part_id)
) COMMENT='Stores parts used in repairs';

CREATE TABLE feedback (
  feedback_id INT PRIMARY KEY,
  client_id INT NOT NULL,
  service_id INT NOT NULL,
  rating INT NOT NULL,
  comments VARCHAR(255),
  feedback_date DATE,
  FOREIGN KEY (client_id) REFERENCES clients(client_id),
  FOREIGN KEY (service_id) REFERENCES services(service_id),
  INDEX idx_feedback_client_id (client_id),
  INDEX idx_feedback_service_id (service_id)
) COMMENT='Stores client feedback';

CREATE TABLE supplier_parts (
  supplier_part_id INT PRIMARY KEY,
  supplier_id INT,
  part_id INT,
  part_price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
  FOREIGN KEY (part_id) REFERENCES parts(part_id)
) COMMENT='Stores supplier-part relationships';

CREATE TABLE invoices (
  invoice_id INT PRIMARY KEY,
  client_id INT NOT NULL,
  total_cost DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (client_id) REFERENCES clients(client_id),
  INDEX idx_invoices_client_id (client_id)
) COMMENT='Stores invoice information';

CREATE TABLE invoice_details (
  invoice_id INT NOT NULL,
  repair_id INT NOT NULL,
  quantity INT NOT NULL,
  part_price DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (invoice_id, repair_id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
  FOREIGN KEY (repair_id) REFERENCES repairs(repair_id),
  INDEX idx_invoice_details_invoice_id (invoice_id),
  INDEX idx_invoice_details_repair_id (repair_id)
) COMMENT='Stores invoice details';

-- Stored Procedures --
/*1. Create a stored procedure to insert a new repair.*/
DELIMITER //
CREATE PROCEDURE sp_insertar_reparacion(
  IN p_vehicle_id VARCHAR(255),
  IN p_employee_id VARCHAR(255),
  IN p_service_id VARCHAR(255),
  IN p_repair_description VARCHAR(255),
  IN p_total_cost DECIMAL
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error inserting repair: ' AS Error_Message;
  END;
  
  START TRANSACTION;
  
  INSERT INTO Repairs (Vehicle_Id, Employee_Id, Service_Id, Repair_Description, Total_Cost)
  VALUES (p_vehicle_id, p_employee_id, p_service_id, p_repair_description, p_total_cost);
  
  COMMIT;
END//
DELIMITER ;

/*2. Create a stored procedure to update the inventory of a part.*/
DELIMITER //
CREATE PROCEDURE sp_actualizar_inventario(
  IN p_part_id VARCHAR(255),
  IN p_quantity INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error updating inventory: ' AS Error_Message;
  END;
  
  START TRANSACTION;
  
  UPDATE Inventory
  SET quantity = quantity - p_quantity
  WHERE part_id = p_part_id;
  
  COMMIT;
END//
DELIMITER ;

/*3. Create a stored procedure to delete an appointment.*/
DELIMITER //
CREATE PROCEDURE sp_eliminar_cita(
  IN p_appointment_id VARCHAR(255)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error deleting appointment: ' AS Error_Message;
  END;
  
  START TRANSACTION;
  
  DELETE FROM Appointments
  WHERE Appointment_Id = p_appointment_id;
  
  COMMIT;
END//
DELIMITER ;

/*4. Create a stored procedure to generate an invoice.*/
DELIMITER //
CREATE PROCEDURE sp_generar_factura(
  IN p_client_id VARCHAR(255),
  IN p_total_cost DECIMAL
)
BEGIN
  DECLARE invoice_id INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error generating invoice: ' AS Error_Message;
  END;
  
  START TRANSACTION;
  
  INSERT INTO Invoices (Client_Id, Total_Cost)
  VALUES (p_client_id, p_total_cost);
  
  SET invoice_id = LAST_INSERT_ID();
  
  INSERT INTO Invoice_Details (Invoice_Id, Repair_Id, Quantity, Part_Price)
  SELECT invoice_id, r.Repair_Id, r.Quantity, r.Part_Price
  FROM Repairs r
  WHERE r.Client_Id = p_client_id;
  
  COMMIT;
END//
DELIMITER ;

/*5. Create a stored procedure to retrieve the repair history of a vehicle.*/
DELIMITER //
CREATE PROCEDURE sp_obtener_historial_reparaciones(
  IN p_vehicle_id VARCHAR(255)
)
BEGIN
  SELECT 
    r.Repair_Id,
    r.Vehicle_Id,
    r.Employee_Id,
    r.Service_Id,
    r.Repair_Description,
    r.Total_Cost,
    r.Repair_Date
  FROM Repairs r
  WHERE r.Vehicle_Id = p_vehicle_id
  ORDER BY r.Repair_Date DESC;
END//
DELIMITER ;

/*6. Create a stored procedure to calculate the total cost of repairs for a client within a specified date range.*/
DELIMITER //
CREATE PROCEDURE sp_calcular_costo_total_reparaciones(
  IN p_client_id VARCHAR(255),
  IN p_start_date DATE,
  IN p_end_date DATE
)
BEGIN
  SELECT SUM(r.Total_Cost) AS Total_Cost
  FROM Repairs r
  WHERE r.Client_Id = p_client_id
  AND r.Repair_Date BETWEEN p_start_date AND p_end_date;
END//
DELIMITER ;

/*7. Create a stored procedure to retrieve the list of vehicles that require maintenance based on their kilometrage.*/
DELIMITER //
CREATE PROCEDURE sp_obtener_vehiculos_mantenimiento(
  IN p_kilometrage INT
)
BEGIN
  SELECT 
    v.Vehicle_Id,
    v.Make,
    v.Model,
    v.Kilometrage,
    v.Maintenance_Due
  FROM Vehicles v
  WHERE v.Kilometrage >= p_kilometrage
  AND v.Maintenance_Due = 1;
END//
DELIMITER ;

/*8. Create a stored procedure to insert a new purchase order.*/
DELIMITER //
CREATE PROCEDURE sp_insertar_orden_compra(
  IN p_supplier_id VARCHAR(255),
  IN p_employee_id VARCHAR(255),
  IN p_total_cost DECIMAL
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error inserting purchase order: ' AS Error_Message;
 END;
  
  START TRANSACTION;
  
  INSERT INTO Purchase_Orders (Supplier_Id, Employee_Id, Total_Cost)
  VALUES (p_supplier_id, p_employee_id, p_total_cost);
  
  COMMIT;
END//
DELIMITER ;

/*9. Create a stored procedure to update a client's information.*/
DELIMITER //
CREATE PROCEDURE sp_actualizar_cliente(
  IN p_client_id VARCHAR(255),
  IN p_name VARCHAR(255),
  IN p_last_name VARCHAR(255),
  IN p_address VARCHAR(255),
  IN p_phone VARCHAR(10),
  IN p_email VARCHAR(255)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error updating client: ' AS Error_Message;
  END;
  
  START TRANSACTION;
  
  UPDATE Clients
  SET 
    Name = p_name,
    Last_Name = p_last_name,
    Address = p_address,
    Phone = p_phone,
    Email = p_email
  WHERE Client_Id = p_client_id;
  
  COMMIT;
END//
DELIMITER ;

/*10. Create a stored procedure to retrieve the most requested services within a specified date range.*/
DELIMITER //
CREATE PROCEDURE sp_obtener_servicios_mas_solicitados(
  IN p_start_date DATE,
  IN p_end_date DATE
)
BEGIN
  SELECT 
    s.Service_Name,
    COUNT(r.Service_Id) AS Quantity
  FROM Services s
  JOIN Repairs r ON s.Service_Id = r.Service_Id
  WHERE r.Repair_Date BETWEEN p_start_date AND p_end_date
  GROUP BY s.Service_Name
  ORDER BY Quantity DESC;
END//
DELIMITER ;
