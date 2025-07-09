-- ========================================
-- 02_document_schemas.sql
-- Documenta los esquemas del sistema de ventas
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem

-- Descripción del esquema client
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Almacena información de los clientes y sus documentos de identidad',
     @level0type = 'SCHEMA', @level0name = 'client';
GO

-- Descripción del esquema product
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Contiene el catálogo de productos, categorías y marcas',
     @level0type = 'SCHEMA', @level0name = 'product';
GO

-- Descripción del esquema sales
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Contiene las tablas relacionadas a procesos de venta y facturación',
     @level0type = 'SCHEMA', @level0name = 'sales';
GO