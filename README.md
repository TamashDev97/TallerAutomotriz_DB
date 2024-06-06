
# ProyectoDB_TallerAuto

El objetivo de este proyecto es desarrollar un sistema de gestión de base de datos
avanzada para un taller automotriz, utilizando MySQL, que permita administrar de
manera eficiente todos los aspectos operativos del taller. 

Este sistema centralizará la información de clientes, vehículos, servicios, reparaciones, empleados, proveedores, citas, inventarios, órdenes de compra y facturación,asegurando la integridad y consistencia de los datos a través de técnicas de normalización.



## Tablas y Relaciones

    Clientes
    • Campos:
        ◦ ClienteID: Clave primaria, identificador único para cada cliente.
        ◦ Nombre: Nombre del cliente.
        ◦ Apellido: Apellido del cliente.
        ◦ Dirección: Dirección del cliente.
        ◦ Teléfono: Número de teléfono del cliente.
        ◦ Email: Dirección de correo electrónico del cliente.
    
    Historial_Clientes
    • Campos:
        ◦ HistorialID: Clave primaria, identificador único para cada registro de historial.
        ◦ ClienteID: Clave foránea que referencia a Clientes (ClienteID).
        ◦ Nombre: Nombre del cliente.
        ◦ Apellido: Apellido del cliente.
        ◦ Dirección: Dirección del cliente.
        ◦ Teléfono: Número de teléfono del cliente.
        ◦ Email: Dirección de correo electrónico del cliente.
        ◦ FechaCambio: Fecha y hora del cambio.
        ◦ TipoAcción: Tipo de acción (por ejemplo, 'Actualizar', 'Eliminar').
    
    Vehículos
    • Campos:
        ◦ VehículoID: Clave primaria, identificador único para cada vehículo.
        ◦ Placa: Número de placa del vehículo.
        ◦ Marca: Marca del vehículo.
        ◦ Modelo: Modelo del vehículo.
        ◦ Año: Año del vehículo.
        ◦ ClienteID: Clave foránea que referencia a Clientes (ClienteID).
    
    Historial_Vehículos
    • Campos:
        ◦ HistorialID: Clave primaria, identificador único para cada registro de historial.
        ◦ VehículoID: Clave foránea que referencia a Vehículos (VehículoID).
        ◦ Placa: Número de placa del vehículo.
        ◦ Marca: Marca del vehículo.
        ◦ Modelo: Modelo del vehículo.
        ◦ Año: Año del vehículo.
        ◦ ClienteID: Clave foránea que referencia a Clientes (ClienteID).
        ◦ FechaCambio: Fecha y hora del cambio.
        ◦ TipoAcción: Tipo de acción (por ejemplo, 'Actualizar', 'Eliminar').
   
   Servicios
    • Campos:
        ◦ ServicioID: Clave primaria, identificador único para cada servicio.
        ◦ Nombre: Nombre del servicio.
        ◦ Descripción: Descripción del servicio.
        ◦ Costo: Costo del servicio.
    
    Paquetes_Servicios
    • Campos:
        ◦ PaqueteID: Clave primaria, identificador único para cada paquete de servicios.
        ◦ NombrePaquete: Nombre del paquete.
        ◦ DescripciónPaquete: Descripción del paquete.
        ◦ CostoPaquete: Costo del paquete.
    
    Servicios_Paquetes
    • Campos:
        ◦ PaqueteID: Clave foránea que referencia a Paquetes_Servicios (PaqueteID).
        ◦ ServicioID: Clave foránea que referencia a Servicios (ServicioID).
        ◦ PrimaryKey: Clave primaria compuesta (PaqueteID, ServicioID).
    
    Empleados
    • Campos:
        ◦ EmpleadoID: Clave primaria, identificador único para cada empleado.
        ◦ Nombre: Nombre del empleado.
        ◦ Apellido: Apellido del empleado.
        ◦ Cargo: Puesto de trabajo del empleado.
        ◦ Teléfono: Número de teléfono del empleado.
    
    Proveedores
    • Campos:
        ◦ ProveedorID: Clave primaria, identificador único para cada proveedor.
        ◦ Nombre: Nombre del proveedor.
        ◦ Contacto: Persona de contacto en el proveedor.
        ◦ Teléfono: Número de teléfono del proveedor.
        ◦ Email: Dirección de correo electrónico del proveedor.
    
    Piezas
    • Campos:
        ◦ PiezaID: Clave primaria, identificador único para cada pieza.
        ◦ Nombre: Nombre de la pieza.
        ◦ Descripción: Descripción de la pieza.
        ◦ Precio: Precio de la pieza.
    
    Proveedor_Pieza
    • Campos:
        ◦ Proveedor_PiezaID: Clave primaria, identificador único para cada relación proveedor-pieza.
        ◦ ProveedorID: Clave foránea que referencia a Proveedores (ProveedorID).
        ◦ PiezaID: Clave foránea que referencia a Piezas (PiezaID).
        ◦ Precio: Precio de la pieza del proveedor.
    
    Inventarios
    • Campos:
        ◦ InventarioID: Clave primaria, identificador único para cada registro de inventario.
        ◦ PiezaID: Clave foránea que referencia a Piezas (PiezaID).
        ◦ Cantidad: Cantidad de la pieza en inventario.
        ◦ Ubicación: Ubicación de la pieza en inventario.
    
    
    Historial_Inventario
    • Campos:
        ◦ HistorialID: Clave primaria, identificador único para cada registro de historial de inventario.
        ◦ InventarioID: Clave foránea que referencia a Inventarios (InventarioID).
        ◦ PiezaID: Clave foránea que referencia a Piezas (PiezaID).
        ◦ Cantidad: Cantidad de la pieza al momento del cambio.
        ◦ Ubicación: Ubicación de la pieza al momento del cambio.
        ◦ FechaCambio: Fecha y hora del cambio.
        ◦ TipoCambio: Tipo de cambio (por ejemplo, 'Añadido', 'Eliminado', 'Ajustado').

    Órdenes_Compra
    • Campos:
        ◦ OrdenID: Clave primaria, identificador único para cada orden de compra.
        ◦ Fecha: Fecha de la orden.
        ◦ ProveedorID: Clave foránea que referencia a Proveedores (ProveedorID).
        ◦ EmpleadoID: Clave foránea que referencia a Empleados (EmpleadoID).
        ◦ Total: Costo total de la orden.
    
    Detalles_Orden
    • Campos:
        ◦ OrdenID: Clave foránea que referencia a Órdenes_Compra (OrdenID).
        ◦ PiezaID: Clave foránea que referencia a Piezas (PiezaID).
        ◦ Cantidad: Cantidad de la pieza ordenada.
        ◦ Precio: Precio de la pieza ordenada.
        ◦ PrimaryKey: Clave primaria compuesta (OrdenID, PiezaID).
    
    Reparaciones
    • Campos:
        ◦ ReparaciónID: Clave primaria, identificador único para cada reparación.
        ◦ Fecha: Fecha de la reparación.
        ◦ VehículoID: Clave foránea que referencia a Vehículos (VehículoID).
        ◦ EmpleadoID: Clave foránea que referencia a Empleados (EmpleadoID).
        ◦ Descripción: Descripción de la reparación.
        ◦ ServicioID: Clave foránea que referencia a Servicios (ServicioID).
        ◦ CostoTotal: Costo total de la reparación.
    
    Reparación_Servicios
    • Campos:
        ◦ Reparación_ServicioID: Clave primaria, identificador único para cada relación reparación-servicio.
        ◦ ReparaciónID: Clave foránea que referencia a Reparaciones (ReparaciónID).
        ◦ ServicioID: Clave foránea que referencia a Servicios (ServicioID).
        ◦ Costo: Costo del servicio.
    
    Reparación_Piezas
    • Campos:
        ◦ ReparaciónID: Clave foránea que referencia a Reparaciones (ReparaciónID).
        ◦ PiezaID: Clave foránea que referencia a Piezas (PiezaID).
        ◦ Cantidad: Cantidad de la pieza utilizada en la reparación.
        ◦ Proveedor_PiezaID: Clave foránea que referencia a Proveedor_Pieza (Proveedor_PiezaID).
        ◦ PrimaryKey: Clave primaria compuesta (ReparaciónID, PiezaID).
    
    Citas
    • Campos:
        ◦ CitaID: Clave primaria, identificador único para cada cita.
        ◦ FechaHora: Fecha y hora de la cita.
        ◦ ClienteID: Clave foránea que referencia a Clientes (ClienteID).
        ◦ VehículoID: Clave foránea que referencia a Vehículos (VehículoID).
        ◦ ServicioID: Clave foránea que referencia a Servicios (ServicioID).
        ◦ PaqueteID: Clave foránea que referencia a Paquetes_Servicios (PaqueteID).
    
    Facturación
    • Campos:
        ◦ FacturaID: Clave primaria, identificador único para cada factura.
        ◦ Fecha: Fecha de la factura.
        ◦ ClienteID: Clave foránea que referencia a Clientes (ClienteID).
        ◦ Total: Importe total de la factura.
    
    Detalles_Factura
    • Campos:
        ◦ FacturaID: Clave foránea que referencia a Facturación (FacturaID).
        ◦ ReparaciónID: Clave foránea que referencia a Reparaciones (ReparaciónID).
        ◦ Cantidad: Cantidad del ítem facturado.
        ◦ Precio: Precio del ítem facturado.
        ◦ PrimaryKey: Clave primaria compuesta (FacturaID, ReparaciónID).
    
    Logs
    • Campos:
        ◦ LogID: Clave primaria, identificador único para cada entrada de log.
        ◦ FechaHoraLog: Fecha y hora de la entrada de log.
        ◦ NivelID: Nivel de log (por ejemplo, 'INFO', 'ERROR').
        ◦ TipoEvento: Tipo de evento registrado.
        ◦ Descripción: Descripción de la entrada de log.
    
    Feedback
    • Campos:
        ◦ RetroalimentaciónID: Clave primaria, identificador único para cada entrada de retroalimentación.
        ◦ ClienteID: Clave foránea que referencia a Clientes (ClienteID).
        ◦ ServicioID: Clave foránea que referencia a Servicios (ServicioID).
        ◦ Comentario: Retroalimentación del cliente.
        ◦ FechaRetroalimentación: Fecha de la retroalimentación.


# Resumen de Relaciones #
• Clientes a Historial_Clientes: Uno a muchos (un cliente puede tener múltiples registros de historial).
• Clientes a Vehículos: Uno a muchos (un cliente puede poseer múltiples vehículos).
• Vehículos a Historial_Vehículos: Uno a muchos (un vehículo puede tener múltiples registros de historial).
• Servicios a Servicios_Paquetes: Uno a muchos (un servicio puede pertenecer a múltiples paquetes).
• Paquetes_Servicios a Servicios_Paquetes: Uno a muchos (un paquete puede contener múltiples servicios).
• Piezas a Inventarios: Uno a muchos (una pieza puede estar en múltiples registros de inventario).
• Piezas a Proveedor_Pieza: Uno a muchos (una pieza puede tener múltiples relaciones proveedor-pieza).
• Proveedores a Proveedor_Pieza: Uno a muchos (un proveedor puede suministrar múltiples piezas).
• Inventarios a Historial_Inventario: Uno a muchos (un registro de inventario puede tener múltiples registros de historial).
• Órdenes_Compra a Detalles_Orden: Uno a muchos (una orden de compra puede tener múltiples detalles de orden).
• Reparaciones a Reparación_Servicios: Uno a muchos (una reparación puede involucrar múltiples servicios).
• Reparaciones a Reparación_Piezas: Uno a muchos (una reparación puede involucrar múltiples piezas).
• Clientes a Citas: Uno a muchos (un cliente puede tener múltiples citas).
• Vehículos a Citas: Uno a muchos (un vehículo puede tener múltiples citas).
• Servicios a Citas: Uno a muchos (un servicio puede ser parte de múltiples citas).
• Paquetes_Servicios a Citas: Uno a muchos (un paquete puede ser parte de múltiples citas).
• Facturación a Detalles_Factura: Uno a muchos (una factura puede tener múltiples detalles de factura).
• Clientes a Retroalimentación: Uno a muchos (un cliente puede proporcionar múltiples retroalimentaciones).
• Servicios a Retroalimentación: Uno a muchos (un servicio puede tener múltiples retroalimentaciones).
## Consultas

-- 1. Obtener el historial de reparaciones de un vehículo específico
SELECT r.Repair_Id, r.Vehicle_Id, r.Repair_Date, r.Total_Cost
FROM Repairs r
JOIN Vehicles v ON r.Vehicle_Id = v.Vehicle_Id
WHERE v.Vehicle_Id = @vehicleId;

-- 2. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo
SELECT SUM(r.Total_Cost) AS Total_Cost
FROM Repairs r
JOIN Employees e ON r.Employee_Id = e.Employee_Id
WHERE e.Employee_Id = @employeeId AND r.Repair_Date BETWEEN @startDate AND @endDate;

-- 3. Listar todos los clientes y los vehículos que poseen
SELECT c.Client_Id, c.Name, c.Last_Name, v.Plate_Number, v.Brand, v.Model
FROM Clients c
JOIN Vehicles v ON c.Client_Id = v.Client_Id;

-- 4. Obtener la cantidad de piezas en inventario para cada pieza
SELECT p.Part_Name, i.Quantity
FROM Parts p
JOIN Inventories i ON p.Part_Id = i.Part_Id;

-- 5. Obtener las citas programadas para un día específico
SELECT a.Appointment_Id, a.Date_Time, a.Client_Id
FROM Appointments a
WHERE a.Date_Time = @appointmentDate;

-- 6. Generar una factura para un cliente específico en una fecha determinada
SELECT i.Invoice_Id, i.Client_Id, i.Invoice_Date, i.Total_Cost
FROM Invoices i
WHERE i.Client_Id = @clientId AND i.Invoice_Date = @invoiceDate;

-- 7. Listar todas las órdenes de compra y sus detalles
SELECT po.Order_Id, po.Order_Date, po.Total_Cost, od.Part_Id, od.Quantity, od.Part_Price
FROM Purchase_Orders po
JOIN Order_Details od ON po.Order_Id = od.Order_Id;

-- 8. Obtener el costo total de piezas utilizadas en una reparación específica
SELECT SUM(rp.Quantity * p.Part_Price) AS Total_Cost
FROM Repair_Parts rp
JOIN Parts p ON rp.Part_Id = p.Part_Id
WHERE rp.Repair_Id = @repairId;

-- 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad menor que un umbral)
SELECT p.Part_Name, i.Quantity
FROM Parts p
JOIN Inventories i ON p.Part_Id = i.Part_Id
WHERE i.Quantity < @threshold;

-- 10. Obtener la lista de servicios más solicitados en un período específico
SELECT s.Service_Name, COUNT(rs.Repair_Id) AS Count
FROM Services s
JOIN Repair_Services rs ON s.Service_Id = rs.Service_Id
WHERE rs.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY s.Service_Name
ORDER BY Count DESC;

-- 11. Obtener el costo total de reparaciones para cada cliente en un período específico
SELECT c.Client_Id, SUM(r.Total_Cost) AS Total_Cost
FROM Clients c
JOIN Repairs r ON c.Client_Id = r.Client_Id
WHERE r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY c.Client_Id;

-- 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un período específico
SELECT e.Employee_Id, COUNT(r.Repair_Id) AS Count
FROM Employees e
JOIN Repairs r ON e.Employee_Id = r.Employee_Id
WHERE r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY e.Employee_Id
ORDER BY Count DESC;

-- 13. Obtener las piezas más utilizadas en reparaciones durante un período específico
SELECT p.Part_Name, COUNT(rp.Part_Id) AS Count
FROM Parts p
JOIN Repair_Parts rp ON p.Part_Id = rp.Part_Id
WHERE rp.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY p.Part_Name
ORDER BY Count DESC;

-- 14. Calcular el promedio de costo de reparaciones por vehículo
SELECT AVG(r.Total_Cost) AS Average_Cost
FROM Repairs r;

-- 15. Obtener el inventario de piezas por proveedor
SELECT s.Supplier_Name, p.Part_Name, i.Quantity
FROM Suppliers s
JOIN Supplier_Parts sp ON s.Supplier_Id = sp.Supplier_Id
JOIN Parts p ON sp.Part_Id = p.Part_Id
JOIN Inventories i ON p.Part_Id = i.Part_Id;

-- 16. Listar los clientes que no han realizado reparaciones en el último año
SELECT c.Client_Id, c.Name, c.Last_Name
FROM Clients c
LEFT JOIN Repairs r ON c.Client_Id = r.Client_Id
WHERE r.Repair_Date

-- 16. Listar los clientes que no han realizado reparaciones en el último año
SELECT c.Client_Id, c.Name, c.Last_Name
FROM Clients c
LEFT JOIN Repairs r ON c.Client_Id = r.Client_Id
WHERE r.Repair_Date IS NULL OR r.Repair_Date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 17. Obtener las ganancias totales del taller en un período específico
SELECT SUM(i.Total_Cost) AS Total_Gain
FROM Invoices i
WHERE i.Invoice_Date BETWEEN @startDate AND @endDate;

-- 18. Listar los empleados y el total de horas trabajadas en reparaciones en un período específico
SELECT e.Employee_Id, SUM(r.Repair_Time) AS Total_Hours
FROM Employees e
JOIN Repairs r ON e.Employee_Id = r.Employee_Id
WHERE r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY e.Employee_Id;

-- 19. Obtener el listado de servicios prestados por cada empleado en un período específico
SELECT e.Employee_Id, s.Service_Name, COUNT(rs.Repair_Id) AS Count
FROM Employees e
JOIN Repairs r ON e.Employee_Id = r.Employee_Id
JOIN Repair_Services rs ON r.Repair_Id = rs.Repair_Id
JOIN Services s ON rs.Service_Id = s.Service_Id
WHERE r.Repair_Date BETWEEN @startDate AND @endDate
GROUP BY e.Employee_Id, s.Service_Name
ORDER BY Count DESC;


--- SUBCONSULTAS PROPUESTAS ---

-- 1. Obtener el cliente que ha gastado más en reparaciones durante el último año
SELECT c.Client_Id, c.Name, c.Last_Name, SUM(r.Total_Cost) AS Total_Spent
FROM Clients c
JOIN Repairs r ON c.Client_Id = r.Client_Id
WHERE r.Repair_Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY c.Client_Id, c.Name, c.Last_Name
ORDER BY Total_Spent DESC
LIMIT 1;

-- 2. Obtener la pieza más utilizada en reparaciones durante el último mes
SELECT p.Part_Name, COUNT(rp.Part_Id) AS Count
FROM Parts p
JOIN Repair_Parts rp ON p.Part_Id = rp.Part_Id
JOIN Repairs r ON rp.Repair_Id = r.Repair_Id
WHERE r.Repair_Date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.Part_Name
ORDER BY Count DESC
LIMIT 1;

-- 3. Obtener los proveedores que suministran las piezas más caras
SELECT s.Supplier_Name, p.Part_Name, p.Part_Price
FROM Suppliers s
JOIN Supplier_Parts sp ON s.Supplier_Id = sp.Supplier_Id
JOIN Parts p ON sp.Part_Id = p.Part_Id
ORDER BY p.Part_Price DESC;

-- 4. Listar las reparaciones que no utilizaron piezas específicas durante el último año
SELECT r.Repair_Id, r.Vehicle_Id, r.Repair_Date, r.Total_Cost
FROM Repairs r
LEFT JOIN Repair_Parts rp ON r.Repair_Id = rp.Repair_Id
WHERE rp.Part_Id IS NULL AND r.Repair_Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial
SELECT p.Part_Name, i.Quantity, p.Initial_Stock
FROM Parts p
JOIN Inventories i ON p.Part_Id = i.Part_Id
WHERE i.Quantity <= p.Initial_Stock * 0.1;
