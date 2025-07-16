-- ========================================
-- CreateTable_Order_Partitioned.sql
-- Crea la tabla [sales.[Order]] del sistema de ventas con partición basada en el campo [Total].
-- Esta tabla permite registrar las órdenes realizadas por los clientes.
-- La partición se define sobre la columna [Total] (tipo NUMERIC o DECIMAL),
-- con el objetivo de mejorar el rendimiento al consultar órdenes por rangos de montos.
-- La partición facilita análisis como distribución de ventas por tramos económicos.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

-- 🎯 Paso 1: Crear la función de partición por año
CREATE PARTITION FUNCTION PF_Orders_ByYear (DATETIME2)
    AS RANGE LEFT FOR VALUES (
    '2022-12-31T23:59:59',
    '2023-12-31T23:59:59',
    '2024-12-31T23:59:59',
    '2025-12-31T23:59:59'
    );
GO

-- 🎯 Paso 2: Crear el esquema de partición asociado
CREATE PARTITION SCHEME PS_Orders_ByYear
    AS PARTITION PF_Orders_ByYear
    ALL TO ([PRIMARY]);
GO