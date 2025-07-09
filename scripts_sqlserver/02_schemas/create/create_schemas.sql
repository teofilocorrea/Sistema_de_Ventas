-- ========================================
-- 01_create_schemas.sql
-- Crea los esquemas principales del sistema de ventas:
-- client, product y sales
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

-- Esquema para gestión de clientes y documentos
CREATE SCHEMA client;
GO

-- Esquema para catálogo de productos
CREATE SCHEMA product;
GO

-- Esquema para procesos de venta y facturación
CREATE SCHEMA sales;
GO

