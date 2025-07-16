-- ========================================
-- CreateTable_PaymentMethod.sql
-- Crea la tabla [sales.PaymentMethod] del sistema de ventas.
-- Esta tabla actúa como catálogo de los distintos métodos de pago disponibles,
-- tales como efectivo, tarjeta de crédito, transferencia bancaria, entre otros.
-- Será referenciada por la tabla [sales.Orders] para registrar el método utilizado en cada orden.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;-- ========================================
-- CreateTable_PaymentMethod.sql
-- Crea la tabla [sales.PaymentMethod] del sistema de ventas.
-- Esta tabla actúa como catálogo de los distintos métodos de pago disponibles,
-- tales como efectivo, tarjeta de crédito, transferencia bancaria, entre otros.
-- Será referenciada por la tabla [sales.Orders] para registrar el método utilizado en cada orden.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

CREATE TABLE sales.PaymentMethod
(
    -- 🔑 Clave primaria (PK) con autoincremento
    PaymentMethodId INT IDENTITY (1,1) NOT NULL,

    -- 📄 Otras columnas
    TypeMethod NVARCHAR(30) NOT NULL
        CONSTRAINT CK_PaymentMethod_Type_Valid
        CHECK ( TypeMethod IN (N'Crédito', N'Débito', N'Efectivo') ),

    -- 🧷 Restricción de clave primaria
    CONSTRAINT PK_PmId PRIMARY KEY (PaymentMethodId)
);
GO
GO

CREATE TABLE sales.PaymentMethod
(
    -- 🔑 Clave primaria (PK) con autoincremento
    PaymentMethodId INT IDENTITY (1,1) NOT NULL,

    -- 📄 Otras columnas
    TypeMethod NVARCHAR(30) NOT NULL
        CONSTRAINT CK_PaymentMethod_Type_Valid
        CHECK ( TypeMethod IN (N'Crédito', N'Débito', N'Efectivo') ),

    -- 🧷 Restricción de clave primaria
    CONSTRAINT PK_PmId PRIMARY KEY (PaymentMethodId)
);
GO