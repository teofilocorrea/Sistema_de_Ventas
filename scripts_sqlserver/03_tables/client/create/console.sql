-- ========================================
-- CreateTable_DocumentType.sql
-- Crea la tabla [client.DocumentType] del sistema de ventas.
-- Esta tabla sirve como catálogo de tipos de documentos que serán utilizados por la tabla [client.Customer].
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

CREATE TABLE client.DocumentType
(
    -- 🔑 Clave primaria (PK) con autoincremento
    DocumentTypeId INT IDENTITY (1,1) NOT NULL,

    -- 📄 Nombre del tipo de documento (solo letras y espacios)
   DocumentName NVARCHAR(30) NOT NULL
       CONSTRAINT CK_DocumentType_Name_Letters
       CHECK ( DocumentName NOT LIKE N'%[^A-Za-zÁÉÍÓÚáéíóúÑñ ]%'),

    -- 🧷 Restricción de clave primaria
    CONSTRAINT PK_DocumentType PRIMARY KEY (DocumentTypeId)
);
GO