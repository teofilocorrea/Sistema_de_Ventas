-- ========================================
-- CreateTable_DocumentType.sql
-- Crea la tabla [client.DocumentType] del sistema de ventas.
-- Esta tabla funciona como catálogo para los distintos tipos de documentos personales o corporativos.
-- Será referenciada posteriormente por la tabla [client.Customer] para validar la información de identidad de los clientes.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem

CREATE TABLE client.Customer
(
    -- 🔑 Clave primaria (PK) con autoincremento
    CustomerId INT IDENTITY (1,1) NOT NULL,

    -- 🔑 Clave foránea (FK) que referencia al tipo de documento
    DocumentTypeId INT NOT NULL,

     -- 📄 Otras columnas
    FirstName NVARCHAR(50) NOT NULL
        CONSTRAINT CK_Customer_FirstName_LatinOnly
        CHECK ( FirstName NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    LastName NVARCHAR(50) NOT NULL
        CONSTRAINT CK_LastName_Lat
        CHECK ( LastName NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    Email NVARCHAR(100) NOT NULL,
        CONSTRAINT CK_Customer_Email_Valid CHECK (Email LIKE '%@%.%'),
        CONSTRAINT UQ_Customer_Email UNIQUE(Email),

    Registration DATETIME2 NOT NULL,

    -- 🧷 Restricción de clave primaria
    CONSTRAINT PK_CustomerId PRIMARY KEY (CustomerId)
);
GO