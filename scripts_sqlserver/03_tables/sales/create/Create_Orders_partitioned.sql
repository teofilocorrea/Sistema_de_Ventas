-- ========================================
-- CreateTable_Order_Partitioned.sql
-- Crea la tabla [sales.Order] con partición basada en la columna [Total].
-- Permite registrar órdenes de clientes y segmentarlas por rangos de monto
-- para mejorar el rendimiento en consultas y análisis económicos.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

CREATE TABLE sales.Orders
(
    -- 🔑 Clave primaria (PK) con autoincremento
    OrdersId INT IDENTITY (1,1) NOT NULL,

    -- 🔑 Clave foranea
    CustomerId INT NOT NULL,         -- Referencia a client.Customer
    PaymentMethodId INT NOT NULL,    -- Referencia a sales.PaymentMethod

    -- 📄 Otras columnas
   DateOrder DATETIME2 NOT NULL,

   TotalOrder NUMERIC(10,2) NOT NULL
       CONSTRAINT CK_TotalOrder_NonNegative
       CHECK (TotalOrder >= 0),

    -- 🧷 Clave primaria compuesta para compatibilidad con partición
    CONSTRAINT PK_OrdersId PRIMARY KEY (OrdersId, DateOrder)

)
ON PS_Orders_ByYear(DateOrder);
GO