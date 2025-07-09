-- ========================================
-- 01_db_description.sql
-- Documenta la base de datos principal (SalesSystem)
-- mediante MS_Description para uso técnico y portafolio
-- Autor: Teófilo Correa Rojas
-- ========================================

USE SalesSystem;
GO

EXEC sys.sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'Base de datos diseñada para simular un sistema de ventas en portafolio técnico personal';
GO