-- Consult 1: Get repair history for a specific vehicle
SELECT
    r.repair_id,
    r.vehicle_id,
    r.repair_date,
    r.repair_cost
FROM
    repairs AS r
JOIN
    vehicles AS v ON r.vehicle_id = v.vehicle_id
WHERE
    v.vehicle_id = @vehicleId;

-- Consult 2: Calculate total cost of repairs for an employee in a specific period
SELECT
    SUM(r.repair_cost) AS TotalCost
FROM
    repairs AS r
JOIN
    employees AS e ON r.employee_id = e.employee_id
WHERE
    e.employee_id = @employeeId AND
    r.repair_date BETWEEN @startDate AND @endDate;

-- Consult 3: List all clients and their vehicles
SELECT
    c.client_id,
    c.name,
    c.last_name,
    v.plate_number,
    v.brand,
    v.model
FROM
    clients AS c
JOIN
    vehicles AS v ON c.client_id = v.client_id;

-- Consult 4: Get inventory quantity for each part
SELECT
    p.part_id,
    p.part_name,
    i.quantity
FROM
    parts AS p
JOIN
    inventories AS i ON p.part_id = i.part_id;

-- Consult 5: Get scheduled appointments for a specific date
SELECT
    a.appointment_id,
    a.date_time,
    a.client_id
FROM
    appointments AS a
WHERE
    a.date_time = @appointmentDate;

-- Consult 6: Generate an invoice for a client on a specific date
SELECT
    i.invoice_id,
    i.client_id,
    i.invoice_date,
    i.total_cost
FROM
    invoices AS i
WHERE
    i.client_id = @clientId AND
    i.invoice_date = @invoiceDate;

-- Consult 7: List all purchase orders and their details
SELECT
    po.order_id,
    po.order_date,
    po.total_cost,
    od.part_id,
    od.quantity,
    od.part_price
FROM
    purchase_orders AS po
JOIN
    order_details AS od ON po.order_id = od.order_id;

-- Consult 8: Get total cost of parts used in a specific repair
SELECT
    SUM(rp.quantity * p.part_cost) AS TotalCost
FROM
    repair_parts AS rp
JOIN
    parts AS p ON rp.part_id = p.part_id
WHERE
    rp.repair_id = @repairId;

-- Consult 9: Get inventory of parts that need to be restocked
SELECT
    p.part_id,
    p.part_name,
    i.quantity
FROM
    parts AS p
JOIN
    inventories AS i ON p.part_id = i.part_id
WHERE
    i.quantity < @threshold;

-- Consult 10: Get list of most requested services in a specific period
SELECT
    s.service_id,
    s.service_name,
    COUNT(rs.repair_id) AS Count
FROM
    services AS s
JOIN
    repair_services AS rs ON s.service_id = rs.service_id
WHERE
    rs.repair_date BETWEEN @startDate AND @endDate
GROUP BY
    s.service_id,
    s.service_name
HAVING
    COUNT(rs.repair_id) > 0
ORDER BY
    Count DESC;

-- Consult 11: Get total cost of repairs for each client in a specific period
SELECT
    c.client_id,
    SUM(r.repair_cost) AS TotalCost
FROM
    clients AS c
JOIN
    repairs AS r ON c.client_id = r.client_id
WHERE
    r.repair_date BETWEEN @startDate AND @endDate
GROUP BY
    c.client_id
HAVING
    SUM(r.repair_cost) > 0;

-- Consult 12: List employees with the most repairs in a specific period
SELECT
    e.employee_id,
    COUNT(r.repair_id) AS Count
FROM
    employees AS e
JOIN
    repairs AS r ON e.employee_id = r.employee_id
WHERE
    r.repair_date BETWEEN @startDate AND @endDate
GROUP BY
    e.employee_id
HAVING
    COUNT(r.repair_id) > 0
ORDER BY
    Count DESC;

-- Consult 13: Get most used parts in repairs during a specific period
SELECT
    p.part_id,
    p.part_name,
    COUNT(rp.part_id) AS Count
FROM
    parts AS p
JOIN
    repair_parts AS rp ON p.part_id = rp.part_id
JOIN
    repairs AS r ON rp.repair_id = r.repair_id
WHERE
    r.repair_date BETWEEN @startDate AND @endDate
GROUP BY
    p.part_id,
    p.part_name
HAVING
    COUNT(rp.part_id) > 0
ORDER BY
    Count DESC;

-- Consult 14: Get vehicles with no repairs
SELECT
    v.vehicle_id,
    v.plate_number,
    v.brand,
    v.model
FROM
    vehicles AS v
LEFT JOIN
    repairs AS r ON v.vehicle_id = r.vehicle_id
WHERE
    r.repair_id IS NULL;

-- Consult 15: Get clients with no repairs in the last year
SELECT
    c.client_id,
    c.name,
    c.last_name
FROM
    clients AS c
LEFT JOIN
    repairs AS r ON c.client_id = r.client_id
WHERE
    r.repair_date < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) OR
    r.repair_id IS NULL;

-- Consult 16: Get total cost of repairs for each client in the last year
SELECT
    c.client_id,
    SUM(r.repair_cost) AS TotalCost
FROM
    clients AS c
JOIN
    repairs AS r ON c.client_id = r.client_id
WHERE
    r.repair_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY
    c.client_id
HAVING
    SUM(r.repair_cost) > 0;

-- 17. Get total gain of the workshop in a specific period
SELECT
    SUM(i.total_cost) AS TotalGain
FROM
    invoices AS i
WHERE
    i.invoice_date BETWEEN @startDate AND @endDate;

-- 18. List employees and total hours worked in repairs in a specific period
SELECT
    e.employee_id,
    SUM(r.repair_time) AS TotalHours
FROM
    employees AS e
JOIN
    repairs AS r ON e.employee_id = r.employee_id
WHERE
    r.repair_date BETWEEN @startDate AND @endDate
GROUP BY
    e.employee_id;

-- 19. Get list of services provided by each employee in a specific period
SELECT
    e.employee_id,
    s.service_id,
    s.service_name,
    COUNT(rs.repair_id) AS Count
FROM
    employees AS e
JOIN
    repairs AS r ON e.employee_id = r.employee_id
JOIN
    repair_services AS rs ON r.repair_id = rs.repair_id
JOIN
    services AS s ON rs.service_id = s.service_id
WHERE
    r.repair_date BETWEEN @startDate AND @endDate
GROUP BY
    e.employee_id,
    s.service_id,
    s.service_name
ORDER BY
    Count DESC;

--- Subqueries ---

-- 1. Get the client who has spent the most on repairs during the last year
SELECT
    c.client_id,
    c.name,
    c.last_name,
    SUM(r.repair_cost) AS TotalSpent
FROM
    clients AS c
JOIN
    repairs AS r ON c.client_id = r.client_id
WHERE
    r.repair_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY
    c.client_id,
    c.name,
    c.last_name
ORDER BY
    TotalSpent DESC
LIMIT 1;

-- 2. Get the most used part in repairs during the last month
CREATE VIEW part_usage AS
SELECT
    p.part_id,
    p.part_name,
    COUNT(rp.part_id) AS Count
FROM
    parts AS p
JOIN
    repair_parts AS rp ON p.part_id = rp.part_id
JOIN
    repairs AS r ON rp.repair_id = r.repair_id
WHERE
    r.repair_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY
    p.part_id,
    p.part_name
ORDER BY
    Count DESC
LIMIT 1;

-- 3. Get the suppliers who supply the most expensive parts
CREATE VIEW expensive_parts AS
SELECT
    s.supplier_id,
    s.supplier_name,
    p.part_id,
    p.part_name,
    p.part_cost
FROM
    suppliers AS s
JOIN
    supplier_parts AS sp ON s.supplier_id = sp.supplier_id
JOIN
    parts AS p ON sp.part_id = p.part_id
ORDER BY
    p.part_cost DESC;

-- 4. List repairs that did not use specific parts during the last year
CREATE VIEW no_part_repairs AS
SELECT
    r.repair_id,
    r.vehicle_id,
    r.repair_date,
    r.repair_cost
FROM
    repairs AS r
LEFT JOIN
    repair_parts AS rp ON r.repair_id = rp.repair_id
WHERE
    rp.part_id IS NULL AND
    r.repair_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 5. Get parts that are in inventory below 10% of the initial stock
CREATE VIEW low_stock_parts AS
SELECT
    p.part_id,
    p.part_name,
    i.quantity,
    p.initial_stock
FROM
    parts AS p
JOIN
    inventories AS i ON p.part_id = i.part_id
WHERE
    i.quantity <= p.initial_stock * 0.1;

