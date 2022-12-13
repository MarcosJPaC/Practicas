USE master;
GO
IF DB_ID(N'KFC')IS NOT NULL

CREATE DATABASE KFC
ON
(NAME = KFC_dat,
FILENAME= 'C:\BaseDatos\KFC.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME =CallDuty_log,
FILENAME = 'C:\BaseDatos\KFC.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE KFC;
GO
CREATE TABLE Area
(
idArea INT identity (1,1),
nombre VARCHAR(50) NOT NULL,
eficiencia VARCHAR(50) NOT NULL,
proyeccion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Proveedor
(
idProveedor INT identity (1,1),
nombre VARCHAR(50) NOT NULL,
rfc VARCHAR(50) NOT NULL,
estadoOrigen VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Almacen
(
idAlmacen INT identity (1,1),
tamaño VARCHAR(50) NOT NULL,
encargado VARCHAR(50) NOT NULL,
faltantes VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Menu
(
idMenu INT identity (1,1),
platillo VARCHAR(50) NOT NULL,
precio VARCHAR(50) NOT NULL,
cantidad VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Empleado
(
idEmpleado INT identity (1,1),
nombre VARCHAR(50) NOT NULL,
edad VARCHAR(50) NOT NULL,
salario VARCHAR(50) NOT NULL,
idCategoria INT NOT NULL,
idSucursal INT NOT NULL,
idArea INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Sucursal
(
idSucursal INT identity (1,1),
nombre VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
identificador VARCHAR(50) NOT NULL,
idAlmacen INT NOT NULL,
idMenu INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Plantilla
(
idPlantilla INT identity (1,1),
integrantes VARCHAR(50) NOT NULL,
trainer VARCHAR(50) NOT NULL,
area VARCHAR(50) NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Producto
(
idProducto INT identity (1,1),
nombre VARCHAR(50) NOT NULL,
cantidad VARCHAR(50) NOT NULL,
caducidad DATETIME NOT NULL,
idAlmacen INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Auditoria
(
idAuditoria INT identity (1,1),
encargado VARCHAR(50) NOT NULL,
fechaAuditoria VARCHAR(50) NOT NULL,
resultado varchar(50) NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Categoria
(
idCategoria INT identity (1,1),
nombre VARCHAR(50) NOT NULL,
tiempoRequerido VARCHAR(50) NOT NULL,
aumentoSalario varchar(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE ProductoProveedor
(
idProductoProveedor INT identity (1,1),
idProducto INT NOT NULL,
idProveedor INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE INDEX IX_Area ON Area(idArea);
GO
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor);
GO
CREATE INDEX IX_Almacen ON Almacen(idAlmacen);
GO
CREATE INDEX IX_Menu ON Menu(idMenu);
GO
CREATE INDEX IX_Empleado ON Empleado(idEmpleado);
GO
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal);
GO
CREATE INDEX IX_Plantilla ON Plantilla(idPlantilla);
GO
CREATE INDEX IX_Categoria ON Categoria(idCategoria);
GO
CREATE INDEX IX_Producto ON Producto(idProducto);
GO
CREATE INDEX IX_Auditoria ON Auditoria(idAuditoria);
GO
CREATE INDEX IX_ProductoProveedor ON ProductoProveedor(idProductoProveedor);
GO

ALTER TABLE Area ADD CONSTRAINT PK_Area PRIMARY KEY (idArea);
ALTER TABLE Proveedor ADD CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor);
ALTER TABLE Almacen ADD CONSTRAINT PK_Almacen PRIMARY KEY (idAlmacen);
ALTER TABLE Menu ADD CONSTRAINT PK_Menu PRIMARY KEY (idMenu);
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado);
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal);
ALTER TABLE Plantilla ADD CONSTRAINT PK_Plantilla PRIMARY KEY (idPlantilla);
ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (idCategoria);
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (idProducto);
ALTER TABLE Auditoria ADD CONSTRAINT PK_Auditoria PRIMARY KEY (idAuditoria);
ALTER TABLE ProductoProveedor ADD CONSTRAINT PK_ProductoProveedor PRIMARY KEY (idProductoProveedor);

ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoArea FOREIGN KEY (idArea) REFERENCES Area (idArea)
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoCategoria FOREIGN KEY (idCategoria) REFERENCES Categoria (idCategoria)
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoSucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal (idSucursal)

ALTER TABLE Sucursal ADD CONSTRAINT FK_SucursalAlmacen FOREIGN KEY (idAlmacen) REFERENCES Almacen (idAlmacen)
ALTER TABLE Sucursal ADD CONSTRAINT FK_SucursalMenu FOREIGN KEY (idMenu) REFERENCES Menu (idMenu)

ALTER TABLE Plantilla ADD CONSTRAINT FK_PlantillaSucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal (idSucursal)

ALTER TABLE Producto ADD CONSTRAINT FK_ProductoAlmacen FOREIGN KEY (idAlmacen) REFERENCES Almacen (idAlmacen)

ALTER TABLE Auditoria ADD CONSTRAINT FK_AuditoriaSucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal (idSucursal)

ALTER TABLE ProductoProveedor ADD CONSTRAINT FK_ProductoProveedorProducto FOREIGN KEY (idProducto) REFERENCES Producto (idProducto)
ALTER TABLE ProductoProveedor ADD CONSTRAINT FK_ProductoProveedorProveedor FOREIGN KEY (idProveedor) REFERENCES Proveedor (idProveedor)







