-- ========================================
-- CreateTable_DocumentType.sql
-- Crea la tabla [client.DocumentType] del sistema de ventas.
-- Esta tabla funciona como catálogo de tipos de documentos personales o corporativos.
-- Es referenciada por la tabla [client.Customer] para establecer el tipo de documento
-- asociado a cada cliente como parte del control de identidad.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

-- FKNA - No permite eliminar ni actualizar si existen registros hijos.
ALTER TABLE client.Customer
    ADD CONSTRAINT FK_Customer_DocumentTypeId
        FOREIGN KEY (DocumentTypeId)
            REFERENCES client.DocumentType (DocumentTypeId)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;
GO