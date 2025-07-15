-- ========================================
-- AlterMasking_Customer.sql
-- Aplica enmascaramiento dinámico al campo [Email] en la tabla [client.Customer].
-- Esta medida refuerza la protección de datos sensibles, asegurando que la información personal
-- no sea completamente visible para usuarios sin permisos especiales.
-- Forma parte de las buenas prácticas de seguridad y privacidad en la gestión de datos.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

ALTER TABLE client.Customer
-- 🛡️ Enmascaramiento dinámico del campo Email (formato tipo: xxx@xxxx.com)
-- Requiere SQL Server 2016+ y nivel de compatibilidad >= 130
ALTER COLUMN Email ADD MASKED WITH (FUNCTION = 'email()')