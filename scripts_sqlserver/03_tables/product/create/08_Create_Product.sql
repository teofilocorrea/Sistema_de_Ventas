-- ========================================
-- CreateTable_Product.sql
-- Crea la tabla [sales.Product] del sistema de ventas
-- Esta tabla registra los productos disponibles para la venta, asociados a su categoría mediante [sales.ProductCategory]
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

CREATE TABLE product.Product
(
    -- 🔑 Clave primaria (PK) con autoincremento
    ProductId INT IDENTITY (1,1) NOT NULL,

    -- 🔑 Clave forania (FK)
    FK_ProductCategoryId INT NOT NULL,

    -- 📄 Otras columnas
    NameProduct NVARCHAR(30) NOT NULL
        CONSTRAINT CK_Pro_NamePro_Lat
        CHECK (NameProduct NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    Description NVARCHAR(200) NOT NULL
        CONSTRAINT CK_Pro_Desc_Lat
        CHECK (Description NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    UnitPrice NUMERIC(6,2) NOT NULL
        CONSTRAINT CK_Pro_UnitPrice_Greater_0
        CHECK (UnitPrice > 0),

    -- 🧷 Restricción de clave primaria
    CONSTRAINT pk_ProductId PRIMARY KEY (ProductId)
);
GO
