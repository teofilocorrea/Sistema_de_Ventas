-- ========================================
-- AlterMasking_Customer_DocumentNumber.sql
-- Aplica enmascaramiento dinámico (DDM) al campo [DocumentNumber] en la tabla [client.Customer].
-- Esta medida protege la confidencialidad de los números de documentos de identidad, ocultando
-- parcialmente su contenido para usuarios sin privilegios especiales.
-- Forma parte de la estrategia modular de seguridad aplicada al sistema de ventas,
-- alineada con las mejores prácticas de privacidad de datos.
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

-- 🔎 Dynamic Data Masking - Ocultamiento Parcial Controlado. Ejemplo: Teléfonos, cédulas, cuentas
ALTER TABLE client.Customer
ALTER COLUMN DocumentNumber
ADD MASKED WITH (FUNCTION = 'partial(3,"XXXX",2)');