--- Inserciones correspondiente para el taller de la base de datos ---

--- Clients ---
INSERT INTO Clients (Client_Id, Name, Last_Name, Address, Phone, Email, Created_at, Updated_at) 
VALUES 
('CL001', 'John', 'Doe', '123 Main St', '1234567890', 'john.doe@example.com', NOW(), NOW()),
('CL002', 'Jane', 'Smith', '456 Elm St', '0987654321', 'jane.smith@example.com', NOW(), NOW()),
('CL003', 'Bob', 'Johnson', '789 Oak St', '5551234567', 'bob.johnson@example.com', NOW(), NOW()),
('CL004', 'Alice', 'Williams', '321 Maple St', '5559876543', 'alice.williams@example.com', NOW(), NOW()),
('CL005', 'Mike', 'Davis', '901 Pine St', '5555551234', 'ike.davis@example.com', NOW(), NOW());

--- Clients_History ---
INSERT INTO Client_History (History_Id, Client_Id, Name, Last_Name, Address, Phone, Email, Changed_At, Action_Type) 
VALUES 
('CH001', 'CL001', 'John', 'Doe', '123 Main St', '1234567890', 'john.doe@example.com', NOW(), 'INSERT'),
('CH002', 'CL002', 'Jane', 'Smith', '456 Elm St', '0987654321', 'jane.smith@example.com', NOW(), 'INSERT'),
('CH003', 'CL003', 'Bob', 'Johnson', '789 Oak St', '5551234567', 'bob.johnson@example.com', NOW(), 'INSERT'),
('CH004', 'CL004', 'Alice', 'Williams', '321 Maple St', '5559876543', 'alice.williams@example.com', NOW(), 'INSERT'),
('CH005', 'CL005', 'Mike', 'Davis', '901 Pine St', '5555551234', 'ike.davis@example.com', NOW(), 'INSERT');

--- Vehicles ---
INSERT INTO Vehicles (Vehicle_Id, Plate_Number, Brand, Model, Client_Id) 
VALUES 
('VH001', 'ABC123', 'Toyota', 'Camry', 'CL001'),
('VH002', 'DEF456', 'Honda', 'Civic', 'CL002'),
('VH003', 'GHI789', 'Ford', 'Fusion', 'CL003'),
('VH004', 'JKL012', 'Nissan', 'Altima', 'CL004'),
('VH005', 'MNO345', 'Chevrolet', 'Cruze', 'CL005');

--- Vehicles_History ---
INSERT INTO Vehicle_History (History_Id, Vehicle_Id, Plate_Number, Brand, Model, Client_Id, Changed_At, Action_Type) 
VALUES 
('VH001', 'VH001', 'ABC123', 'Toyota', 'Camry', 'CL001', NOW(), 'INSERT'),
('VH002', 'VH002', 'DEF456', 'Honda', 'Civic', 'CL002', NOW(), 'INSERT'),
('VH003', 'VH003', 'GHI789', 'Ford', 'Fusion', 'CL003', NOW(), 'INSERT'),
('VH004', 'VH004', 'JKL012', 'Nissan', 'Altima', 'CL004', NOW(), 'INSERT'),
('VH005', 'VH005', 'MNO345', 'Chevrolet', 'Cruze', 'CL005', NOW(), 'INSERT');

--- Appointments ---
INSERT INTO Appointments (Appointment_Id, Date_Time, Client_Id, Vehicle_Id) 
VALUES 
('AP001', NOW(), 'CL001', 'VH001'),
('AP002', NOW(), 'CL002', 'VH002'),
('AP003', NOW(), 'CL003', 'VH003'),
('AP004', NOW(), 'CL004', 'VH004'),
('AP005', NOW(), 'CL005', 'VH005');

--- Service_Packages ---
INSERT INTO Service_Packages (Package_Id, Package_Name, Package_Description, Package_Cost) 
VALUES 
('SP001', 'Basic', 'Oil change and tire rotation', 50.00),
('SP002', 'Standard', 'Oil change, tire rotation, and brake inspection', 100.00),
('SP003', 'Premium', 'Oil change, tire rotation, brake inspection, and vehicle detailing', 200.00),
('SP004', 'Deluxe', 'Oil change, tire rotation, brake inspection, vehicle detailing, and wheel alignment', 300.00),
('SP005', 'Elite', 'Oil change, tire rotation, brake inspection, vehicledetailing, wheel alignment, and engine tune-up', 500.00);

--- Services ---
INSERT INTO Services (Service_Id, Service_Name, Service_Description, Service_Cost) 
VALUES 
('SV001', 'Oil Change', 'Synthetic oil change', 25.00),
('SV002', 'Tire Rotation', 'Tire rotation and balancing', 20.00),
('SV003', 'Brake Inspection', 'Brake pad inspection and replacement', 50.00),
('SV004', 'Vehicle Detailing', 'Interior and exterior vehicle detailing', 100.00),
('SV005', 'Wheel Alignment', 'Wheel alignment and balancing', 75.00);

--- Package_Service ---
INSERT INTO Package_Services (Package_Id, Service_Id) 
VALUES 
('SP001', 'SV001'),
('SP001', 'SV002'),
('SP002', 'SV001'),
('SP002', 'SV002'),
('SP002', 'SV003'),
('SP003', 'SV001'),
('SP003', 'SV002'),
('SP003', 'SV003'),
('SP003', 'SV004'),
('SP004', 'SV001'),
('SP004', 'SV002'),
('SP004', 'SV003'),
('SP004', 'SV004'),
('SP004', 'SV005'),
('SP005', 'SV001'),
('SP005', 'SV002'),
('SP005', 'SV003'),
('SP005', 'SV004'),
('SP005', 'SV005');

--- Feedback ---
INSERT INTO Feedback (Feedback_Id, Client_Id, Service_Id, Rating, Comments, Feedback_Date) 
VALUES 
('FB001', 'CL001', 'SV001', 5, 'Excellent service!', NOW()),
('FB002', 'CL002', 'SV002', 4, 'Good job!', NOW()),
('FB003', 'CL003', 'SV003', 5, 'Very satisfied!', NOW()),
('FB004', 'CL004', 'SV004', 4, 'Good service!', NOW()),
('FB005', 'CL005', 'SV005', 5, 'Excellent work!', NOW());

--- Suppliers ---
INSERT INTO Suppliers (Supplier_Id, Supplier_Name, Contact_Person, Phone, Email) 
VALUES 
('SU001', 'Auto Parts Inc.', 'John Smith', '5551234567', 'john.smith@autopartsinc.com'),
('SU002', 'Car Care Co.', 'Jane Doe', '5559876543', 'jane.doe@carcareco.com'),
('SU003', 'Vehicle Solutions', 'Bob Johnson', '5555551234', 'bob.johnson@vehiclesolutions.com'),
('SU004', 'Parts R Us', 'Alice Williams', '5555555555', 'alice.williams@partsrus.com'),
('SU005', 'Auto Supply Co.', 'Mike Davis', '5555551234', 'ike.davis@autosupplyco.com');

--- Parts ---
INSERT INTO Parts (Part_Id, Part_Name, Part_Description, Part_Price) 
VALUES 
('PT001', 'Oil Filter', 'Synthetic oil filter', 10.00),
('PT002', 'Tire', 'All-season tire', 50.00),
('PT003', 'Brake Pad', 'High-performance brake pad', 20.00),
('PT004', 'Air Filter', 'Cabin air filter', 15.00),
('PT005', 'Spark Plug', 'High-performance spark plug', 25.00);

--- Supplier_Parts ---
INSERT INTO Supplier_Parts (Supplier_Part_Id, Supplier_Id, Part_Id, Part_Price) 
VALUES 
('SP001', 'SU001', 'PT001', 10.00),
('SP002', 'SU002', 'PT002', 50.00),
('SP003', 'SU003', 'PT003', 20.00),
('SP004', 'SU004', 'PT004', 15.00),
('SP005', 'SU005', 'PT005', 25.00);

--- Inventories ---
INSERT INTO Inventories (Inventory_Id, Part_Id, Quantity, Location) 
VALUES 
('IN001', 'PT001', 10, 'Warehouse A'),
('IN002', 'PT002', 20, 'Warehouse B'),
('IN003', 'PT003', 15, 'Warehouse C'),
('IN004', 'PT004', 25, 'Warehouse D'),
('IN005', 'PT005', 30, 'Warehouse E');

--- Inventory_History ---
INSERT INTO Inventory_History (History_Id, Inventory_Id, Part_Id, Quantity, Location, Change_Date, Change_Time) 
VALUES 
('IH001', 'IN001', 'PT001', 10, 'Warehouse A', NOW(), NOW()),
('IH002', 'IN002', 'PT002', 20, 'Warehouse B', NOW(), NOW()),
('IH003', 'IN003', 'PT003', 15, 'Warehouse C', NOW(), NOW()),
('IH004', 'IN004', 'PT004', 25, 'Warehouse D', NOW(), NOW()),
('IH005', 'IN005', 'PT005', 30, 'Warehouse E', NOW(), NOW());

--- Purchase_Orders ---
INSERT INTO Purchase_Orders (Order_Id, Order_Date, Supplier_Id, Employee_Id, Total_Cost) 
VALUES 
('PO001', NOW(), 'SU001', 'EM001', 100.00),
('PO002', NOW(), 'SU002', 'EM002', 200.00),
('PO003', NOW(), 'SU003', 'EM003', 300.00),
('PO004', NOW(), 'SU004', 'EM004', 400.00),
('PO005', NOW(), 'SU005', 'EM005', 500.00);

--- Order Details ---
INSERT INTO Order_Details (Order_Id, Part_Id, Quantity, Part_Price) 
VALUES 
('PO001', 'PT001', 10, 10.00),
('PO002', 'PT002', 20, 50.00),
('PO003', 'PT003', 15, 20.00),
('PO004', 'PT004', 25, 15.00),
('PO005', 'PT005', 30, 25.00);

--- Employees ---
INSERT INTO Employees (Employee_Id, Employee_Name, Employee_Last_Name, Job_Title, Phone) 
VALUES 
('EM001', 'John', 'Doe', 'Mechanic', '5551234567'),
('EM002', 'Jane', 'Smith', 'Service Advisor', '5559876543'),
('EM003', 'Bob', 'Johnson', 'Technician', '5555551234'),
('EM004', 'Alice', 'Williams', 'Parts Manager', '5555555555'),
('EM005', 'Mike', 'Davis', 'Service Manager', '5555551234');

--- Employee_Skills ---
INSERT INTO Employee_Skills (Skill_Id, Employee_Id, Acquisition_Date) 
VALUES 
(1, 'EM001', NOW()),
(2, 'EM002', NOW()),
(3, 'EM003', NOW()),
(4, 'EM004', NOW()),
(5, 'EM005', NOW());

--- Repairs ---
INSERT INTO Repairs (Repair_Id, Repair_Date, Vehicle_Id, Employee_Id, Repair_Description, Service_Id, Total_Cost) 
VALUES 
('RP001', NOW(), 'VH001', 'EM001', 'Oil change and tire rotation', 'SV001', 50.00),
('RP002', NOW(), 'VH002', 'EM002', 'Brake inspection and replacement', 'SV003', 100.00),
('RP003', NOW(), 'VH003', 'EM003', 'Vehicle detailing and wheel alignment', 'SV004', 200.00),
('RP004', NOW(), 'VH004', 'EM004', 'Engine tune-up and spark plug replacement', 'SV005', 300.00),
('RP005', NOW(), 'VH005', 'EM005', 'Transmission repair and replacement', 'SV002', 400.00);

--- Repair_Services ---
INSERT INTO Repair_Services (Repair_Service_Id, Repair_Id, Service_Id, Service_Cost) 
VALUES 
('RS001', 'RP001', 'SV001', 25.00),
('RS002', 'RP002', 'SV003', 50.00),
('RS003', 'RP003', 'SV004', 100.00),
('RS004', 'RP004', 'SV005', 150.00),
('RS005', 'RP005', 'SV002', 200.00);

--- Repair_Parts ---
INSERT INTO Repair_Parts (Repair_Id, Part_Id, Quantity, Supplier_Part_Id) 
VALUES 
('RP001', 'PT001', 1, 'SP001'),
('RP002', 'PT003', 2, 'SP003'),
('RP003', 'PT004', 3, 'SP004'),
('RP004', 'PT005', 4, 'SP005'),
('RP005', 'PT002', 5, 'SP002');

--- Invoices ---
INSERT INTO Invoices (Invoice_Id, Invoice_Date, Client_Id, Total_Cost) 
VALUES 
('IV001', NOW(), 'CL001', 100.00),
('IV002', NOW(), 'CL002', 200.00),
('IV003', NOW(), 'CL003', 300.00),
('IV004', NOW(), 'CL004', 400.00),
('IV005', NOW(), 'CL005', 500.00);

--- Invoice_Details ---
INSERT INTO Invoice_Details (Invoice_Id, Repair_Id, Quantity, Part_Price) 
VALUES 
('IV001', 'RP001', 1, 25.00),
('IV002', 'RP002', 2, 50.00),
('IV003', 'RP003', 3, 100.00),
('IV004', 'RP004', 4, 150.00),
('IV005', 'RP005', 5, 200.00);

--- Logs ---
INSERT INTO Logs (Log_Id, Event_Time, User_Id, Event_Type, Description) 
VALUES 
('LG001', NOW(), 'USR001', 'LOGIN', 'User logged in'),
('LG002', NOW(), 'USR002', 'LOGOUT', 'User logged out'),
('LG003', NOW(), 'USR003', 'CREATE', 'New client created'),
('LG004', NOW(), 'USR004', 'UPDATE', 'Client information updated'),
('LG005', NOW(), 'USR005', 'DELETE', 'Client deleted');