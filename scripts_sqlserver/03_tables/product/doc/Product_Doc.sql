-- ========================================
-- AddFK_ProductCategory.sql
-- Agrega y documenta la clave foránea en [product.Product]
-- que referencia a la tabla ya existente [product.ProductCategory]
-- para garantizar la integridad referencial.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

-- 📦 Documentación de las tablas: Product
-- Autor: Teófilo Correa
-- Fecha: 2025-07-11

-- 🧾 Descripción: Comentario profesional a una tabla
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Tabla que almacena los productos',
     @level0type = 'SCHEMA', @level0name = 'product',
     @level1type = 'TABLE', @level1name = 'Product';
GO

-- Comentarios a columnas - Product
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Identificador único del producto',
     @level0type = 'SCHEMA', @level0name = 'product',
     @level1type = 'TABLE', @level1name = 'Product',
     @level2type = 'COLUMN', @level2name = 'ProductId';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Tabla que almacena las categorías de los productos',
     @level0type = N'SCHEMA', @level0name = 'product',
     @level1type = N'TABLE', @level1name = 'Product',
     @level2type = N'COLUMN', @level2name = 'FK_ProductCategoryId';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Nombre de los productos',
     @level0type = N'SCHEMA', @level0name = 'product',
     @level1type = N'TABLE', @level1name = 'Product',
     @level2type = N'COLUMN', @level2name = 'NameProduct';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Descripcion de los productos',
     @level0type = N'SCHEMA', @level0name = 'product',
     @level1type = N'TABLE', @level1name = 'Product',
     @level2type = N'COLUMN', @level2name = 'Description';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Precio del producto',
     @level0type = N'SCHEMA', @level0name = 'product',
     @level1type = N'TABLE', @level1name = 'Product',
     @level2type = N'COLUMN', @level2name = 'UnitPrice';
GO