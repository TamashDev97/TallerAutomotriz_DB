-- 1. Obtener el historial de reparaciones de un vehículo específico
SELECT
    r.Repair_Id,
    r.Vehicle_Id,
    r.Repair_Date,
    r.Total_Cost
FROM
    Repairs AS r
JOIN
    Vehicles AS v ON r.Vehicle_Id = v.Vehicle_Id
WHERE
    v.Vehicle_Id = @vehicleId;

-- 2. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo
SELECT
    SUM(r.Total_Cost) AS Total_Cost
FROM
    Repairs AS r
JOIN
    Employees AS e ON r.Employee_Id = e.Employee_Id
WHERE
    e.Employee_Id = @employeeId AND
    r.Repair_Date BETWEEN @startDate AND @endDate;

-- 3. Listar todos los clientes y los vehículos que poseen
SELECT
    c.Client_Id,
    c.Name,
    c.Last_Name,
    v.Plate_Number,
    v.Brand,
    v.Model
FROM
    Clients AS c
JOIN
    Vehicles AS v ON c.Client_Id = v.Client_Id;

-- 4. Obtener la cantidad de piezas en inventario para cada pieza
SELECT
    p.Part_Name,
    i.Quantity
FROM
    Parts AS p
JOIN
    Inventories AS i ON p.Part_Id = i.Part_Id;

-- 5. Obtener las citas programadas para un día específico
SELECT
    a.Appointment_Id,
    a.Date_Time,
    a.Client_Id
FROM
    Appointments AS a
WHERE
    a.Date_Time = @appointmentDate;

-- 6. Generar una factura para un cliente específico en una fecha determinada
SELECT
    i.Invoice_Id,
    i.Client_Id,
    i.Invoice_Date,
    i.Total_Cost
FROM
    Invoices AS i
WHERE
    i.Client_Id = @clientId AND
    i.Invoice_Date = @invoiceDate;

-- 7. Listar todas las órdenes de compra y sus detalles
SELECT
    po.Order_Id,
    po.Order_Date,
    po.Total_Cost,
    od.Part_Id,
    od.Quantity,
    od.Part_Price
FROM
    Purchase_Orders AS po
JOIN
    Order_Details AS od ON po.Order_Id = od.Order_Id;

-- 8. Obtener el costo total de piezas utilizadas en una reparación específica
SELECT
    SUM(rp.Quantity * p.Part_Price) AS Total_Cost
FROM
    Repair_Parts AS rp
JOIN
    Parts AS p ON rp.Part_Id = p.Part_Id
WHERE
    rp.Repair_Id = @repairId;

-- 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad menor que un umbral)
SELECT
    p.Part_Name,
    i.Quantity
FROM
    Parts AS p
JOIN
    Inventories AS i ON p.Part_Id = i.Part_Id
WHERE
    i.Quantity < @threshold;

-- 10. Obtener el listado de servicios más solicitados en un período específico
SELECT
    s.Service_Name,
    COUNT(rs.Repair_Id) AS Count
FROM
    Services AS s
JOIN
    Repair_Services AS rs ON s.Service_Id = rs.Service_Id
WHERE
    rs.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY
    s.Service_Name
ORDER BY
    Count DESC;

-- 11. Obtener el costo total de reparaciones para cada cliente en un período específico
SELECT
    c.Client_Id,
    SUM(r.Total_Cost) AS Total_Cost
FROM
    Clients AS c
JOIN
    Repairs AS r ON c.Client_Id = r.Client_Id
WHERE
    r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY
    c.Client_Id;

-- 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un período específico
SELECT
    e.Employee_Id,
    COUNT(r.Repair_Id) AS Count
FROM
    Employees AS e
JOIN
    Repairs AS r ON e.Employee_Id = r.Employee_Id
WHERE
    r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY
    e.Employee_Id
ORDER BY
    Count DESC;

-- 13. Obtener las piezas más utilizadas en reparaciones durante un período específico
SELECT
    p.Part_Name,
    COUNT(rp.Part_Id) AS Count
FROM
    Parts AS p
JOIN
    Repair_Parts AS rp ON p.Part_Id = rp.Part_Id
WHERE
    rp.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY
    p.Part_Name
ORDER BY
    Count DESC;

-- 14. Calcular el promedio de costo de reparaciones por vehículo
SELECT
    AVG(r.Total_Cost) AS Average_Cost
FROM
    Repairs AS r;

-- 15. Obtener el inventario de piezas por proveedor
SELECT
    s.Supplier_Name,
    p.Part_Name,
    i.Quantity
FROM
    Suppliers AS s
JOIN
    Supplier_Parts AS sp ON s.Supplier_Id = sp.Supplier_Id
JOIN
    Parts AS p ON sp.Part_Id = p.Part_Id
JOIN
    Inventories AS i ON p.Part_Id = i.Part_Id;

-- 16. Listar los clientes que no han realizado reparaciones en el último año
SELECT
    c.Client_Id,
    c.Name,
    c.Last_Name
FROM
    Clients AS c
LEFT JOIN
    Repairs AS r ON c.Client_Id = r.Client_Id
WHERE
    r.Repair_Date IS NULL OR
    r.Repair_Date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 17. Obtener las ganancias totales del taller en un período específico
SELECT
    SUM(i.Total_Cost) AS Total_Gain
FROM
    Invoices AS i
WHERE
    i.Invoice_Date BETWEEN @startDate AND @endDate;

-- 18. Listar los empleados y el total de horas trabajadas en reparaciones en un período específico
SELECT
    e.Employee_Id,
    SUM(r.Repair_Time) AS Total_Hours
FROM
    Employees AS e
JOIN
    Repairs AS r ON e.Employee_Id = r.Employee_Id
WHERE
    r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY
    e.Employee_Id;

-- 19. Obtener el listado de servicios prestados por cada empleado en un período específico
SELECT
    e.Employee_Id,
    s.Service_Name,
    COUNT(rs.Repair_Id) AS Count
FROM
    Employees AS e
JOIN
    Repairs AS r ON e.Employee_Id = r.Employee_Id
JOIN
    Repair_Services AS rs ON r.Repair_Id = rs.Repair_Id
JOIN
    Services AS s ON rs.Service_Id = s.Service_Id
WHERE
    r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY
    e.Employee_Id,
    s.Service_Name
ORDER BY
    Count DESC;

--- Subqueries ---

-- 1. Obtener el cliente que ha gastado más en reparaciones durante el último año
SELECT
    c.Client_Id,
    c.Name,
    c.Last_Name,
    SUM(r.Total_Cost) AS Total_Spent
FROM
    Clients AS c
JOIN
    Repairs AS r ON c.Client_Id = r.Client_Id
WHERE
    r.Repair_Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY
    c.Client_Id,
    c.Name,
    c.Last_Name
ORDER BY
    Total_Spent DESC
LIMIT 1;

-- 2. Obtener la pieza más utilizada en reparaciones durante el último mes
SELECT
    p.Part_Name,
    COUNT(rp.Part_Id) AS Count
FROM
    Parts AS p
JOIN
    Repair_Parts AS rp ON p.Part_Id = rp.Part_Id
JOIN
    Repairs AS r ON rp.Repair_Id = r.Repair_Id
WHERE
    r.Repair_Date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY
    p.Part_Name
ORDER BY
    Count DESC
LIMIT 1;

-- 3. Obtener los proveedores que suministran las piezas más caras
SELECT
    s.Supplier_Name,
    p.Part_Name,
    p.Part_Price
FROM
    Suppliers AS s
JOIN
    Supplier_Parts AS sp ON s.Supplier_Id = sp.Supplier_Id
JOIN
    Parts AS p ON sp.Part_Id = p.Part_Id
ORDER BY
    p.Part_Price DESC;

-- 4. Listar las reparaciones que no utilizaron piezas específicas durante el último año
SELECT
    r.Repair_Id,
    r.Vehicle_Id,
    r.Repair_Date,
    r.Total_Cost
FROM
    Repairs AS r
LEFT JOIN
    Repair_Parts AS rp ON r.Repair_Id = rp.Repair_Id
WHERE
    rp.Part_Id IS NULL AND
    r.Repair_Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial
SELECT
    p.Part_Name,
    i.Quantity,
    p.Initial_Stock
FROM
    Parts AS p
JOIN
    Inventories AS i ON p.Part_Id = i.Part_Id
WHERE
    i.Quantity <= p.Initial_Stock * 0.1;