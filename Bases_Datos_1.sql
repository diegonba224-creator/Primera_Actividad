--- Creacion de la base de datos Tech_World
CREATE DATABASE Tech_World;

--- Entrada a la base de datos
USE Tech_World;

--- Creacion de tabla Clientes_Tech
CREATE TABLE Clientes_Tech(
	Tipo_ID ENUM ('Cedula', 'C.E', 'T.I', 'Pasaporte', 'PEP', 'PPT', 'NIT') NOT NULL,
	ID_Cliente VARCHAR(20) UNIQUE NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR (20) NOT NULL,
	Celular VARCHAR (15) NOT NULL UNIQUE,
	Email VARCHAR(40) NOT NULL UNIQUE,
	Direccion VARCHAR (50) NOT NULL,
	Fecha_nac DATE NOT NULL,
	PRIMARY KEY (ID_Cliente)
);

--- Muestra la tabla Clientes_Tech
DESCRIBE Clientes_Tech;

--- Creacion de tabla Productos
CREATE TABLE Productos(
	Codigo_producto INT NOT NULL AUTO_INCREMENT,
	Categoria ENUM ('Computadores', 'Smartphones', 'Accesorios') NOT NULL,
	Marca VARCHAR(30) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Precio_Unidad DECIMAL (10,2) NOT NULL,
	Stock_Disponible INT NOT NULL,
	PRIMARY KEY (Codigo_producto)
);

--- Muestra la tabla Productos
DESCRIBE Productos;

--- Creacion de tabla Ventas
CREATE TABLE Ventas(
	Num_factura INT NOT NULL AUTO_INCREMENT,
	Fecha DATE NOT NULL,
	Id_cliente VARCHAR (20) NOT NULL, 
	Total_compra DECIMAL (10,2) NOT NULL,
	Metodo_pago ENUM ('Efectivo', 'Transferencia', 'Tarjeta debito', 'Tarjeta credito', 'Credito', 'Bono') NOT NULL,
	PRIMARY KEY (Num_factura),
	FOREIGN KEY (Id_cliente) REFERENCES Clientes_Tech(ID_Cliente)
);

--- Muestra la tabla Ventas	
DESCRIBE Ventas;

--- Creacion de tabla Detalle_Ventas (con clave primaria compuesta, para asi evitar duplicados, que no aparezca el mismo producto 2 veces o mas en una misma factura).
CREATE TABLE Detalle_Ventas(
	Num_factura INT NOT NULL,
	Codigo_Producto INT NOT NULL,
	Cantidad INT NOT NULL,
	Precio_Unidad DECIMAL (10,2) NOT NULL,
	PRIMARY KEY (Num_factura, Codigo_Producto),
	FOREIGN KEY (Num_factura) REFERENCES Ventas(Num_factura), 
	FOREIGN KEY (Codigo_Producto) REFERENCES Productos(Codigo_producto)
);

--- Muestra la tabla Detalle_Ventas
DESCRIBE	Detalle_Ventas;

--- Creacion de tabla Tecnico_Servicio
CREATE TABLE Tecnico_Servicio(
	ID_Servicio INT NOT NULL AUTO_INCREMENT,
	ID_Tecnico INT UNIQUE NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR (20) NOT NULL,
	Especialidad ENUM ('Computadores', 'Smartphones', 'Circuitos', 'Display') NOT NULL,
	PRIMARY KEY (ID_Servicio)
);

--- Muestra la tabla Tecnico_Servicio
DESCRIBE	Tecnico_Servicio;

--- Muestra todas las tablas creadas previamente, simultaneamente
DESCRIBE Clientes_Tech;
DESCRIBE Productos;
DESCRIBE Ventas;
DESCRIBE Detalle_Ventas;
DESCRIBE Tecnico_Servicio;

--- Insercion de datos en tabla Clientes_Tech
INSERT INTO Clientes_Tech(Tipo_ID, ID_Cliente, Nombre, Apellido, Celular, Email, Direccion, Fecha_nac) VALUES (
'Cedula', '70811595', 'Alvaro', 'Escobar', '3007669826', 'vao@gmail.com', 'Tv 33 sur # 31e-52 piso 3', '1968-08-31')

--- Visualizacion de datos insertados en la tabla Clientes_Tech
SELECT * FROM clientes_tech

--- Insercion de datos en tabla Productos
INSERT INTO Productos(Codigo_producto, Categoria, Marca, Nombre, Precio_Unidad, Stock_Disponible) VALUES (
'58', 'Computadores', 'Samsung', 'PC Portatil core i7 SSD 1TB', '5150999.99', '15')

--- Insercion de datos en tabla Productos
INSERT INTO Productos(Codigo_producto, Categoria, Marca, Nombre, Precio_Unidad, Stock_Disponible) VALUES (
'59', 'Smartphones', 'Samsumg', 'S27 512GB Gris', '4890000', '9')

--- Visualizacion de datos insertados en la tabla Productos
SELECT * FROM productos

--- Insercion de datos en tabla Ventas
INSERT INTO Ventas(Num_factura, Fecha , Id_cliente, Total_compra, Metodo_pago) VALUES(
'12345', '2025-09-28', '70811595', '15191999.98', 'Efectivo')

--- Visualizacion de datos insertados en la tabla Ventas
SELECT * FROM Ventas

--- Insercion de datos en tabla Detalle_Ventas
INSERT INTO Detalle_Ventas(Num_factura, Codigo_Producto, Cantidad, Precio_Unidad) 
VALUES
	('12345', '58', '2', '5150999.99'),
	('12345', '59', '1', '4890000');

--- Visualizacion de datos insertados en la tabla Detalle_Ventas
SELECT * FROM Detalle_Ventas

--- Eliminacion de registros de pruebas insertados con anterioridad
DELETE FROM Clientes_Tech WHERE ID_Cliente = '1037602562'
DELETE FROM Clientes_Tech WHERE ID_Cliente = '1152443084'
DELETE FROM productos WHERE Codigo_producto = '167'
DELETE FROM Detalle_Ventas WHERE ID_Detalle = '4'