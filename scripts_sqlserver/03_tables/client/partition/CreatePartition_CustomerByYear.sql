-- ========================================
-- CreateTable_Customer_Partitioned.sql
-- Crea la tabla [client.Customer] del sistema de ventas con partición por año.
-- La partición se realiza sobre la columna [Registration] (tipo DATETIME2),
-- para facilitar el análisis de registros por periodo anual.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

-- 🎯 Paso 1: Crear la función de partición por año
CREATE PARTITION FUNCTION PF_Customer_ByYear (DATETIME2)
    AS RANGE LEFT FOR VALUES (
    '2022-12-31T23:59:59',
    '2023-12-31T23:59:59',
    '2024-12-31T23:59:59',
    '2025-12-31T23:59:59');
GO

-- 🎯 Paso 2: Crear el esquema de partición asociado
CREATE PARTITION SCHEME PS_Customer_ByYear
    AS PARTITION PF_Customer_ByYear
    ALL TO ([PRIMARY]);
GO