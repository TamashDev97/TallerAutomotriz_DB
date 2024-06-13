--- INSERCIONES DE LAS TABLAS ---
-- Clients --
INSERT INTO clients (client_id, name, last_name, address, phone, email) 
VALUES 
(1, 'John', 'Doe', '123 Main St', '5551234567', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '456 Elm St', '5559876543', 'jane.smith@example.com'),
(3, 'Bob', 'Johnson', '789 Oak St', '5555551234', 'bob.johnson@example.com'),
(4, 'Alice', 'Williams', '321 Pine St', '5555555555', 'alice.williams@example.com'),
(5, 'Mike', 'Davis', '901 Maple St', '5555551234', 'ike.davis@example.com');

--- client_history ---
INSERT INTO client_history (history_id, client_id, name, last_name, address, phone, email, changed_at, action_type) 
VALUES 
(1, 1, 'John', 'Doe', '123 Main St', '5551234567', 'john.doe@example.com', NOW(), 'INSERT'),
(2, 2, 'Jane', 'Smith', '456 Elm St', '5559876543', 'jane.smith@example.com', NOW(), 'INSERT'),
(3, 3, 'Bob', 'Johnson', '789 Oak St', '5555551234', 'bob.johnson@example.com', NOW(), 'INSERT'),
(4, 4, 'Alice', 'Williams', '321 Pine St', '5555555555', 'alice.williams@example.com', NOW(), 'INSERT'),
(5, 5, 'Mike', 'Davis', '901 Maple St', '5555551234', 'ike.davis@example.com', NOW(), 'INSERT');

--- vehicles ---
INSERT INTO vehicles (vehicle_id, plate_number, brand, model, client_id) 
VALUES 
(1, 'ABC123', 'Toyota', 'Camry', 1),
(2, 'DEF456', 'Honda', 'Civic', 2),
(3, 'GHI789', 'Ford', 'Fusion', 3),
(4, 'JKL012', 'Nissan', 'Altima', 4),
(5, 'MNO345', 'Chevrolet', 'Cruze', 5);

--- vehicle_history ---
INSERT INTO vehicle_history (history_id, vehicle_id, plate_number, brand, model, client_id, changed_at, action_type) 
VALUES 
(1, 1, 'ABC123', 'Toyota', 'Camry', 1, NOW(), 'INSERT'),
(2, 2, 'DEF456', 'Honda', 'Civic', 2, NOW(), 'INSERT'),
(3, 3, 'GHI789', 'Ford', 'Fusion', 3, NOW(), 'INSERT'),
(4, 4, 'JKL012', 'Nissan', 'Altima', 4, NOW(), 'INSERT'),
(5, 5, 'MNO345', 'Chevrolet', 'Cruze', 5, NOW(), 'INSERT');

--- appointments ---
INSERT INTO appointments (appointment_id, date_time, client_id, vehicle_id) 
VALUES 
(1, NOW(), 1, 1),
(2, NOW(), 2, 2),
(3, NOW(), 3, 3),
(4, NOW(), 4, 4),
(5, NOW(), 5, 5);

--- service_packages ---
INSERT INTO service_packages (package_id, package_name, package_description, package_cost) 
VALUES 
(1, 'Basic', 'Oil change and tire rotation', 50.00),
(2, 'Standard', 'Oil change, tire rotation, and brake inspection', 100.00),
(3, 'Premium', 'Oil change, tire rotation, brake inspection, and vehicle detailing', 200.00),
(4, 'Deluxe', 'Oil change, tire rotation, brake inspection, vehicle detailing, and wheel alignment', 300.00),
(5, 'Elite', 'Oil change, tire rotation, brake inspection, vehicle detailing, wheel alignment, and engine tune-up', 500.00);

--- services ---
INSERT INTO services (service_id, service_name, service_description, service_cost) 
VALUES 
(1, 'Oil Change', 'Synthetic oil change', 25.00),
(2, 'Tire Rotation', 'Tire rotation and balancing', 20.00),
(3, 'Brake Inspection', 'Brake pad inspection and replacement', 50.00),
(4, 'Vehicle Detailing', 'Interior and exterior vehicle detailing', 100.00),
(5, 'Wheel Alignment','Wheel alignment and balancing', 75.00);

--- package_services ---
INSERT INTO package_services (package_id, service_id) 
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

--- feedback ---
INSERT INTO feedback (feedback_id, client_id, service_id, rating, comments, feedback_date) 
VALUES 
(1, 1, 1, 5, 'Excellent service!', NOW()),
(2, 2, 2, 4, 'Good job!', NOW()),
(3, 3, 3, 5, 'Very satisfied!', NOW()),
(4, 4, 4, 4, 'Good service!', NOW()),
(5, 5, 5, 5, 'Excellent work!', NOW());

--- suppliers ---
INSERT INTO suppliers (supplier_id, supplier_name, contact_person, phone, email) 
VALUES 
(1, 'Auto Parts Inc.', 'John Smith', '5551234567', 'john.smith@autopartsinc.com'),
(2, 'Car Care Co.', 'Jane Doe', '5559876543', 'jane.doe@carcareco.com'),
(3, 'Vehicle Solutions', 'Bob Johnson', '5555551234', 'bob.johnson@vehiclesolutions.com'),
(4, 'Parts R Us', 'Alice Williams', '5555555555', 'alice.williams@partsrus.com'),
(5, 'Auto Supply Co.', 'Mike Davis', '5555551234', 'ike.davis@autosupplyco.com');

--- parts ---
INSERT INTO parts (part_id, part_name, part_description, part_cost) 
VALUES 
(1, 'Oil Filter', 'Synthetic oil filter', 10.00),
(2, 'Tire', 'All-season tire', 50.00),
(3, 'Brake Pad', 'High-performance brake pad', 20.00),
(4, 'Air Filter', 'Cabin air filter', 15.00),
(5, 'Spark Plug', 'High-performance spark plug', 25.00);

--- supplier_parts ---
INSERT INTO supplier_parts (supplier_part_id, supplier_id, part_id, part_price) 
VALUES 
(1, 1, 1, 12.00),
(2, 2, 2, 60.00),
(3, 3, 3, 25.00),
(4, 4, 4, 18.00),
(5, 5, 5, 30.00);

--- inventories ---
INSERT INTO inventories (inventory_id, part_id, quantity, location) 
VALUES 
(1, 1, 50, 'Warehouse A'),
(2, 2, 100, 'Warehouse B'),
(3, 3, 75, 'Warehouse C'),
(4, 4, 125, 'Warehouse D'),
(5, 5, 150, 'Warehouse E');

--- inventory_history ---
INSERT INTO inventory_history (history_id, inventory_id, part_id, quantity, location, change_date, change_time) 
VALUES 
(1, 1, 1, 50, 'Warehouse A', NOW(), NOW()),
(2, 2, 2, 100, 'Warehouse B', NOW(), NOW()),
(3, 3, 3, 75, 'Warehouse C', NOW(), NOW()),
(4, 4, 4, 125, 'Warehouse D', NOW(), NOW()),
(5, 5, 5, 150, 'Warehouse E', NOW(), NOW());

--- employees ---
INSERT INTO employees (employee_id, employee_name, last_name, address, phone, email) 
VALUES 
(1, 'John', 'Doe', '123 Main St', '5551234567', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '456 Elm St', '5559876543', 'jane.smith@example.com'),
(3, 'Bob', 'Johnson', '789 Oak St', '5555551234', 'bob.johnson@example.com'),
(4, 'Alice', 'Williams', '321 Pine St', '5555555555', 'alice.williams@example.com'),
(5, 'Mike', 'Davis', '901 Maple St', '5555551234', 'ike.davis@example.com');

--- purchase_orders ---
INSERT INTO purchase_orders (order_id, order_date, supplier_id, employee_id, total_cost) 
VALUES 
(1, DATE '2022-01-01', 1, 1, 100.00),
(2, DATE '2022-01-05', 2, 2, 200.00),
(3, DATE '2022-01-10', 3, 3, 300.00),
(4, DATE '2022-01-15', 4, 4, 400.00),
(5, DATE '2022-01-20', 5, 5, 500.00);

--- order_details ---
INSERT INTO order_details (order_id, part_id, quantity, unit_price) 
VALUES 
(1, 1, 10, 10.00),
(2, 2, 20, 20.00),
(3, 3, 30, 30.00),
(4, 4, 40, 40.00),
(5, 5, 50, 50.00);

--- repairs ---
INSERT INTO repairs (repair_id, vehicle_id, service_id, employee_id, repair_date, repair_time, repair_cost) 
VALUES 
(1, 1, 1, 1, DATE '2022-01-01', TIME '10:00:00', 100.00),
(2, 2, 2, 2, DATE '2022-01-05', TIME '14:00:00', 200.00),
(3, 3, 3, 3, DATE '2022-01-10', TIME '08:00:00', 50.00),
(4, 1, 1, 2, DATE '2022-01-15', TIME '12:00:00', 150.00),
(5, 4, 4, 1, DATE '2022-01-20', TIME '16:00:00', 300.00);

--- repair_parts ---
INSERT INTO repair_parts (repair_id, part_id, quantity, part_price) 
VALUES 
(1, 1, 1, 100.00),
(2, 2, 2, 200.00),
(3, 3, 3, 300.00),
(4, 4, 4, 400.00),
(5, 5, 5, 500.00);

--- invoices ---
INSERT INTO invoices (invoice_id, client_id, total_cost) 
VALUES 
(1, 1, 100.00),
(2, 2, 200.00),
(3, 3, 300.00),
(4, 4, 400.00),
(5, 5, 500.00);

--- invoice_details ---
INSERT INTO invoice_details (invoice_id, repair_id, quantity, part_price) 
VALUES 
(1, 1, 1, 100.00),
(2, 2, 2, 200.00),
(3, 3, 3, 300.00),
(4, 4, 4, 400.00),
(5, 5, 5, 500.00);
