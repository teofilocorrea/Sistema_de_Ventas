-- ========================================
-- create_table_documenttype.sql
-- Crea la tabla [sales. ProductCategory] del sistema de ventas
-- Esta tabla sirve como catálogo para los productos que utilizará la tabla [sales.Product]
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem

CREATE TABLE sales.ProductCategory
(
    -- 🔑 Clave primaria (PK) con autoincremento
    ProductCategoryId INT IDENTITY (1,1) NOT NULL,

    -- 📄 Otras columnas
    CategoryName NVARCHAR(30) NOT NULL
        CONSTRAINT CK_ProdCat_Name_Lat
        CHECK ( CategoryName NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    Description NVARCHAR(200) NOT NULL
        CONSTRAINT CK_ProdCat_Desc_Lat
        CHECK ( Description NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%')

    -- 🧷 Restricción de clave primaria
    CONSTRAINT pk_ProductCategoryId PRIMARY KEY (ProductCategoryId)
);
GO