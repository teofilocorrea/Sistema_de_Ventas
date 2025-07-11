-- ========================================
-- AddFK_ProductCategory.sql
-- Agrega la clave foránea a la tabla [product.Product]
-- Que referencia a la tabla [sales.ProductCategory]
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

-- FKNA - No permite eliminar ni actualizar si existen registros hijos.
ALTER TABLE product.Product
    ADD CONSTRAINT FK_Product_ProductCategoryId
        FOREIGN KEY (FK_ProductCategoryId)
            REFERENCES product.ProductCategory (ProductCategoryId)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;
GO