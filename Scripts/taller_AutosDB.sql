--- Creacion de la base de datos ---
CREATE DATABASE tallerauto_DB;
USE tallerauto_DB;

--- Creacion de las tablas ---
CREATE TABLE Clients (
  Client_Id VARCHAR(255) PRIMARY KEY,
  Name VARCHAR(255),
  Last_Name VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(10),
  Email VARCHAR(255),
  Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Client_History (
  History_Id VARCHAR(255) PRIMARY KEY,
  Client_Id VARCHAR(255),
  Name VARCHAR(255),
  Last_Name VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(10),
  Email VARCHAR(255),
  Changed_At DATETIME,
  Action_Type VARCHAR(255),
  FOREIGN KEY (Client_Id) REFERENCES Clients(Client_Id)
);

CREATE TABLE Vehicles (
  Vehicle_Id VARCHAR(255) PRIMARY KEY,
  Plate_Number VARCHAR(255),
  Brand VARCHAR(255),
  Model VARCHAR(255),
  Client_Id VARCHAR(255),
  FOREIGN KEY (Client_Id) REFERENCES Clients(Client_Id)
);

CREATE TABLE Vehicle_History (
  History_Id VARCHAR(255) PRIMARY KEY,
  Vehicle_Id VARCHAR(255),
  Plate_Number VARCHAR(255),
  Brand VARCHAR(255),
  Model VARCHAR(255),
  Client_Id VARCHAR(255),
  Changed_At DATETIME,
  Action_Type VARCHAR(255),
  FOREIGN KEY (Vehicle_Id) REFERENCES Vehicles(Vehicle_Id)
);

CREATE TABLE Appointments (
  Appointment_Id VARCHAR(255) PRIMARY KEY,
  Date_Time DATETIME,
  Client_Id VARCHAR(255),
  Vehicle_Id VARCHAR(255),
  FOREIGN KEY (Client_Id) REFERENCES Clients(Client_Id),
  FOREIGN KEY (Vehicle_Id) REFERENCES Vehicles(Vehicle_Id)
);

CREATE TABLE Service_Packages (
  Package_Id VARCHAR(255) PRIMARY KEY,
  Package_Name VARCHAR(255),
  Package_Description VARCHAR(255),
  Package_Cost DECIMAL
);

CREATE TABLE Services (
  Service_Id VARCHAR(255) PRIMARY KEY,
  Service_Name VARCHAR(255),
  Service_Description VARCHAR(255),
  Service_Cost DECIMAL
);

CREATE TABLE Package_Services (
  Package_Id VARCHAR(255),
  Service_Id VARCHAR(255),
  PRIMARY KEY (Package_Id, Service_Id),
  FOREIGN KEY (Package_Id) REFERENCES Service_Packages(Package_Id),
  FOREIGN KEY (Service_Id) REFERENCES Services(Service_Id)
);

CREATE TABLE Feedback (
  Feedback_Id VARCHAR(255) PRIMARY KEY,
  Client_Id VARCHAR(255),
  Service_Id VARCHAR(255),
  Rating INT,
  Comments VARCHAR(255),
  Feedback_Date DATE,
  FOREIGN KEY (Client_Id) REFERENCES Clients(Client_Id),
  FOREIGN KEY (Service_Id) REFERENCES Services(Service_Id)
);

CREATE TABLE Suppliers (
  Supplier_Id VARCHAR(255) PRIMARY KEY,
  Supplier_Name VARCHAR(255),
  Contact_Person VARCHAR(255),
  Phone VARCHAR(10),
  Email VARCHAR(255)
);

CREATE TABLE Parts (
  Part_Id VARCHAR(255) PRIMARY KEY,
  Part_Name VARCHAR(255),
  Part_Description VARCHAR(255),
  Part_Price DECIMAL
);

CREATE TABLE Supplier_Parts (
  Supplier_Part_Id VARCHAR(255) PRIMARY KEY,
  Supplier_Id VARCHAR(255),
  Part_Id VARCHAR(255),
  Part_Price DECIMAL,
  FOREIGN KEY (Supplier_Id) REFERENCES Suppliers(Supplier_Id),
  FOREIGN KEY (Part_Id) REFERENCES Parts(Part_Id)
);

CREATE TABLE Inventories (
  Inventory_Id VARCHAR(255) PRIMARY KEY,
  Part_Id VARCHAR(255),
  Quantity INT,
  Location VARCHAR(255),
  FOREIGN KEY (Part_Id) REFERENCES Parts(Part_Id)
);

CREATE TABLE Inventory_History (
  History_Id VARCHAR(255) PRIMARY KEY,
  Inventory_Id VARCHAR(255),
  Part_Id VARCHAR(255),
  Quantity INT,
  Location VARCHAR(255),
  Change_Date DATE,
  Change_Time TIME,
  FOREIGN KEY (Inventory_Id) REFERENCES Inventories(Inventory_Id)
);

CREATE TABLE Purchase_Orders (
  Order_Id VARCHAR(255) PRIMARY KEY,
  Order_Date DATE,
  Supplier_Id VARCHAR(255),
  Employee_Id VARCHAR(255),
  Total_Cost DECIMAL,
  FOREIGN KEY (Supplier_Id) REFERENCES Suppliers(Supplier_Id)
);

CREATE TABLE Order_Details (
  Order_Id VARCHAR(255),
  Part_Id VARCHAR(255),
  Quantity INT,
  Part_Price DECIMAL,
  PRIMARY KEY (Order_Id, Part_Id),
  FOREIGN KEY (Order_Id) REFERENCES Purchase_Orders(Order_Id),
  FOREIGN KEY (Part_Id) REFERENCES Parts(Part_Id)
);

CREATE TABLE Employees (
  Employee_Id VARCHAR(255) PRIMARY KEY,
  Employee_Name VARCHAR(255),
  Employee_Last_Name VARCHAR(255),
  Job_Title VARCHAR(255),
  Phone VARCHAR(10)
);

CREATE TABLE Employee_Skills (
  Skill_Id INT,
  Employee_Id VARCHAR(255),
  Acquisition_Date DATE,
  PRIMARY KEY (Skill_Id, Employee_Id),
  FOREIGN KEY (Employee_Id) REFERENCES Employees(Employee_Id)
);

CREATE TABLE Repairs (
  Repair_Id VARCHAR(255) PRIMARY KEY,
  Repair_Date DATE,
  Vehicle_Id VARCHAR(255),
  Employee_Id VARCHAR(255),
  Repair_Description VARCHAR(255),
  Service_Id VARCHAR(255),
  Total_Cost DECIMAL,
  FOREIGN KEY (Vehicle_Id) REFERENCES Vehicles(Vehicle_Id),
  FOREIGN KEY (Employee_Id) REFERENCES Employees(Employee_Id),
  FOREIGN KEY (Service_Id) REFERENCES Services(Service_Id)
);

CREATE TABLE Repair_Services (
  Repair_Service_Id VARCHAR(255) PRIMARY KEY,
  Repair_Id VARCHAR(255),
  Service_Id VARCHAR(255),
  Service_Cost DECIMAL,
  FOREIGN KEY (Repair_Id) REFERENCES Repairs(Repair_Id),
  FOREIGN KEY (Service_Id) REFERENCES Services(Service_Id)
);

CREATE TABLE Repair_Parts (
  Repair_Id VARCHAR(255),
  Part_Id VARCHAR(255),
  Quantity INT,
  Supplier_Part_Id VARCHAR(255),
  PRIMARY KEY (Repair_Id, Part_Id),
  FOREIGN KEY (Repair_Id) REFERENCES Repairs(Repair_Id),
  FOREIGN KEY (Part_Id) REFERENCES Parts(Part_Id)
);

CREATE TABLE Invoices (
  Invoice_Id VARCHAR(255) PRIMARY KEY,
  Invoice_Date DATE,
  Client_Id VARCHAR(255),
  Total_Cost DECIMAL,
  FOREIGN KEY (Client_Id) REFERENCES Clients(Client_Id)
);

CREATE TABLE Invoice_Details (
  Invoice_Id VARCHAR(255),
  Repair_Id VARCHAR(255),
  Quantity INT,
  Part_Price DECIMAL,
  PRIMARY KEY (Invoice_Id, Repair_Id),
  FOREIGN KEY (Invoice_Id) REFERENCES Invoices(Invoice_Id),
  FOREIGN KEY (Repair_Id) REFERENCES Repairs(Repair_Id)
);

CREATE TABLE Logs (
  Log_Id VARCHAR(255) PRIMARY KEY,
  Event_Time DATETIME,
  User_Id VARCHAR(255),
  Event_Type VARCHAR(255),
  Description VARCHAR(255)
);


--- PRODECIMIENTOS ALMACENADOS ---
/*1. Crear un procedimiento almacenado para insertar una nueva reparación.*/

DELIMITER //
CREATE PROCEDURE sp_insertar_reparacion(
  IN p_vehicle_id VARCHAR(255),
  IN p_employee_id VARCHAR(255),
  IN p_service_id VARCHAR(255),
  IN p_repair_description VARCHAR(255),
  IN p_total_cost DECIMAL
)
BEGIN
  INSERT INTO Repairs (Vehicle_Id, Employee_Id, Service_Id, Repair_Description, Total_Cost)
  VALUES (p_vehicle_id, p_employee_id, p_service_id, p_repair_description, p_total_cost);
END//
DELIMITER ;

/*2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.*/

DELIMITER //
CREATE PROCEDURE sp_eliminar_cita(
  IN p_appointment_id VARCHAR(255)
)
BEGIN
  DELETE FROM Appointments
  WHERE Appointment_Id = p_appointment_id;
END//
DELIMITER ;

/*3. Crear un procedimiento almacenado para eliminar una cita*/

DELIMITER //
CREATE PROCEDURE sp_eliminar_cita(
  IN p_appointment_id VARCHAR(255)
)
BEGIN
  DELETE FROM Appointments
  WHERE Appointment_Id = p_appointment_id;
END//
DELIMITER ;

/*4. Crear un procedimiento almacenado para generar una factura*/

DELIMITER //
CREATE PROCEDURE sp_generar_factura(
  IN p_client_id VARCHAR(255),
  IN p_total_cost DECIMAL
)
BEGIN
  INSERT INTO Invoices (Client_Id, Total_Cost)
  VALUES (p_client_id, p_total_cost);
  
  INSERT INTO Invoice_Details (Invoice_Id, Repair_Id, Quantity, Part_Price)
  SELECT LAST_INSERT_ID(), r.Repair_Id, r.Quantity, r.Part_Price
  FROM Repairs r
  WHERE r.Client_Id = p_client_id;
END//
DELIMITER ;

/*5. Crear un procedimiento almacenado para obtener el historial de reparaciones de un vehículo*/

DELIMITER //
CREATE PROCEDURE sp_obtener_historial_reparaciones(
  IN p_vehicle_id VARCHAR(255)
)
BEGIN
  SELECT *
  FROM Repairs
  WHERE Vehicle_Id = p_vehicle_id
  ORDER BY Repair_Date DESC;
END//
DELIMITER ;

/*6. Crear un procedimiento almacenado para calcular el costo total de reparaciones de un cliente en un período*/

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

/*7. Crear un procedimiento almacenado para obtener la lista de vehículos que requieren mantenimiento basado en el kilometraje.*/

DELIMITER //
CREATE PROCEDURE sp_obtener_vehiculos_mantenimiento(
  IN p_kilometrage INT
)
BEGIN
  SELECT *
  FROM Vehicles
  WHERE Kilometrage >= p_kilometrage
  AND Maintenance_Due = 1;
END//
DELIMITER ;

/*8. Crear un procedimiento almacenado para insertar una nueva orden de compra*/

DELIMITER //
CREATE PROCEDURE sp_insertar_orden_compra(
  IN p_supplier_id VARCHAR(255),
  IN p_employee_id VARCHAR(255),
  IN p_total_cost DECIMAL
)
BEGIN
  INSERT INTO Purchase_Orders (Supplier_Id, Employee_Id, Total_Cost)
  VALUES (p_supplier_id, p_employee_id, p_total_cost);
END//
DELIMITER ;

/*9. Crear un procedimiento almacenado para actualizar los datos de un cliente*/

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
  UPDATE Clients
  SET Name = p_name,
      Last_Name = p_last_name,
      Address = p_address,
      Phone = p_phone,
      Email = p_email
  WHERE Client_Id = p_client_id;
END//
DELIMITER ;

/*10. Crear un procedimiento almacenado para obtener los servicios más solicitados en un período*/

DELIMITER //
CREATE PROCEDURE sp_obtener_servicios_mas_solicitados(
  IN p_start_date DATE,
IN p_end_date DATE
)
BEGIN
  SELECT s.Service_Name, COUNT(r.Service_Id) AS Cantidad
  FROM Services s
  JOIN Repairs r ON s.Service_Id = r.Service_Id
  WHERE r.Repair_Date BETWEEN p_start_date AND p_end_date
  GROUP BY s.Service_Name
  ORDER BY Cantidad DESC;
END//
DELIMITER ;