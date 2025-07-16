-- ========================================
-- CreateTable_OrderDetail.sql
-- Crea la tabla [sales.OrderDetail] del sistema de ventas.
-- Esta tabla almacena el detalle de cada orden, registrando los productos adquiridos,
-- sus cantidades y precios unitarios.
-- La clave primaria está compuesta por [OrdersId] y [ProductId], que además son claves foráneas,
-- lo que garantiza la unicidad del producto por orden y mantiene integridad referencial.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

CREATE TABLE sales.OrdersDetail
(
    -- 🔑 Clave primaria compuesta (PK) que relaciona una orden con un producto
    OrdersId INT NOT NULL,
    ProductId INT NOT NULL,

    -- 📄 Otras columnas
    Quantity INTEGER NOT NULL
        CONSTRAINT CK_Quantity_Positive_Num
        CHECK (Quantity > 0),

    UnitPrice NUMERIC(10,2) NOT NULL
        CONSTRAINT CK_UnitPrice_NonNegative
        CHECK (UnitPrice >= 0),

    SubTotal NUMERIC(10,2) NOT NULL
        CONSTRAINT CK_SubTotal_NonNegative
        CHECK (SubTotal >= 0),

    -- 🧷 Restricción de clave primaria
    CONSTRAINT PK_OrdersDetail PRIMARY KEY (OrdersId, ProductId)
);
GO