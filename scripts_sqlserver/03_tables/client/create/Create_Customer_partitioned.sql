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
    DocumentNumber NVARCHAR(25) NOT NULL
        CONSTRAINT CK_DocumentNum_Validate_Ced_Pass_Rnc
        CHECK (
        -- Cédula dominicana: 000-0000000-0
        DocumentNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9]'
        -- RNC dominicano: 0-00000000-0
        OR DocumentNumber LIKE '[0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9]'
        -- Pasaporte: letras y números (ej. PA1234567)
        OR DocumentNumber LIKE '[A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        ),

    FirstName NVARCHAR(50) NOT NULL
        CONSTRAINT CK_Customer_FirstName_LatinOnly
        CHECK ( FirstName NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    LastName NVARCHAR(50) NOT NULL
        CONSTRAINT CK_LastName_Lat
        CHECK ( LastName NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    Email NVARCHAR(100) NOT NULL,
        CONSTRAINT CK_Customer_Email_Valid CHECK (Email LIKE '%@%.%'),
        CONSTRAINT UQ_Customer_Email UNIQUE(Email, Registration),

    Registration DATETIME2 NOT NULL,

    -- 🧷 Restricción de clave primaria
    CONSTRAINT PK_CustomerId PRIMARY KEY (CustomerId, Registration)
)
ON PS_Customer_ByYear(Registration);
GO