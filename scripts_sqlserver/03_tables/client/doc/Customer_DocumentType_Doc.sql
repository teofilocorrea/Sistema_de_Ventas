-- ========================================
-- CreateTable_DocumentType.sql
-- Crea la tabla [client.DocumentType] del sistema de ventas.
-- Esta tabla actúa como catálogo de los diferentes tipos de documentos de identidad,
-- tanto personales como corporativos.
-- Es referenciada por la tabla [client.Customer] para asociar correctamente
-- el tipo de documento de cada cliente.
-- Autor: Teófilo Correa Rojas
-- ========================================

-- 📦 Documentación de tabla: DocumentType
-- Autor: Teófilo Correa
-- Fecha: 2025-07-14

-- 🧾 Descripción: Tabla de tipos de documentos
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Tabla que almacena los tipos de documentos personales o corporativos.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'DocumentType';
GO

-- 📄 Comentarios a columnas: DocumentType
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Identificador único del tipo de documento.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'DocumentType',
     @level2type = 'COLUMN', @level2name = 'DocumentTypeId';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Nombre de los tipo de documentos.',
     @level0type = N'SCHEMA', @level0name = 'client',
     @level1type = N'TABLE', @level1name = 'DocumentType',
     @level2type = N'COLUMN', @level2name = 'DocumentName';
GO

-- 📦 Documentación de tabla: Customer
-- Autor: Teófilo Correa
-- Fecha: 2025-07-14

-- 🧾 Descripción: Tabla de clientes
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Tabla que almacena los datos de los clientes.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'Customer';

-- 📄 Comentarios a columnas: Customer
EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Identificador único del cliente.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'Customer',
     @level2type = 'COLUMN', @level2name = 'CustomerId';
GO

EXEC sys.sp_addextendedproperty
     @name = N'MS_Description',
     @value = N'Identificador foráneo del tipo de documento.',
     @level0type = N'SCHEMA', @level0name = 'client',
     @level1type = N'TABLE', @level1name = 'Customer',
     @level2type = N'COLUMN', @level2name = 'DocumentTypeId';
GO

EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Primer nombre del cliente.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'Customer',
     @level2type = 'COLUMN', @level2name = 'FirstName';
GO

EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Apellido del cliente.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'Customer',
     @level2type = 'COLUMN', @level2name = 'LastName';
GO

EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Correo electronico de los clientes.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'Customer',
     @level2type = 'COLUMN', @level2name = 'Email';
GO

EXEC sys.sp_addextendedproperty
     @name = 'MS_Description',
     @value = N'Fecha de registro del cliente en el sistema.',
     @level0type = 'SCHEMA', @level0name = 'client',
     @level1type = 'TABLE', @level1name = 'Customer',
     @level2type = 'COLUMN', @level2name = 'Registration';
GO