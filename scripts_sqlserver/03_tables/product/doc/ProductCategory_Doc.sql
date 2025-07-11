USE SalesSystem;
GO

-- ========================================
-- Documenta la tabla [product.ProductCategory]
-- Este script registra descripciones extendidas (MS_Description)
-- para facilitar la comprensión técnica del catálogo de categorías de productos
-- Autor: Teófilo Correa Rojas
-- ========================================

-- 📦 Documentación de tabla: ProductCategory
-- Autor: Teófilo Correa
-- Fecha: 2025-07-10

-- 🧾 Descripción: Comentario profesional a una tabla

EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Tabla catálogo de categorías de productos para la tabla [sales.Product]',
     @level0type = 'SCHEMA', @level0name = 'product',
     @level1type = 'TABLE', @level1name = 'ProductCategory';
GO

-- 📦 Documentación de las columnas
-- Autor: Teófilo Correa
-- Fecha: 2025-07-10

-- Comentarios a columnas
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Identificador único de la categoría de producto',
     @level0type = 'SCHEMA', @level0name = 'product',
     @level1type = 'TABLE', @level1name = 'ProductCategory',
     @level2type = 'COLUMN', @level2name = 'ProductCategoryId';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Nombre de la categoría del producto',
     @level0type = N'SCHEMA', @level0name = 'product',
     @level1type = N'TABLE', @level1name = 'ProductCategory',
     @level2type = N'COLUMN', @level2name = 'CategoryName';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Descripción extendida de la categoría del producto',
     @level0type = N'SCHEMA', @level0name = 'product',
     @level1type = N'TABLE', @level1name = 'ProductCategory',
     @level2type = N'COLUMN', @level2name = 'Description';
GO