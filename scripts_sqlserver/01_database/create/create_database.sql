-- ========================================
-- 01_create_database.sql
-- Crea la base de datos principal del sistema de ventas
-- Autor: Teófilo Correa Rojas
-- ========================================

CREATE DATABASE SalesSystem
ON PRIMARY (
    NAME = SalesSystem_Data,
    FILENAME = '/var/opt/mssql/data/SalesSystem_Data.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON (
    NAME = SalesSystem_Log,
    FILENAME = '/var/opt/mssql/data/SalesSystem_Log.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);
GO