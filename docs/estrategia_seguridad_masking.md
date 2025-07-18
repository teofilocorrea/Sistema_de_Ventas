# 🛡️ Estrategia de Seguridad: Dynamic Data Masking (DDM)

El enmascaramiento dinámico de datos (DDM) es una técnica que permite proteger información sensible a nivel de presentación, ocultando parcialmente los datos para usuarios no autorizados sin afectar el contenido almacenado. 

Esta práctica es útil en ambientes donde se necesita limitar el acceso a información crítica (como correos electrónicos, documentos de identidad o números de cuentas) sin comprometer la estructura de la base de datos. 

Además, implementarlo de manera modular a través de sentencias `ALTER TABLE` permite mantener la flexibilidad y trazabilidad de los cambios sin necesidad de modificar la definición inicial de las tablas.

---

## 🧩 Aplicaciones Actuales

| Tabla            | Columna         | Tipo de Enmascaramiento  | Función aplicada           | Archivo asociado                          |
|------------------|-----------------|---------------------------|----------------------------|-------------------------------------------|
| client.Customer  | Email           | Email Masking             | `email()`                  | `AlterMasking_Customer_Email.sql`         |
| client.Customer  | DocumentNumber  | Partial Data Masking      | `partial(3,"XXXX",2)`      | `AlterMasking_Customer_DocumentNumber.sql`|

---

## 🧱 Implementación Modular

Ejemplos aplicados en este proyecto:

```sql
USE SalesSystem;
GO

-- 🛡️ Enmascaramiento dinámico de Email (ej: a***z@dominio.com)
ALTER TABLE client.Customer
ALTER COLUMN Email 
ADD MASKED WITH (FUNCTION = 'email()');
GO

-- 🔎 Enmascaramiento dinámico parcial en número de documento
-- Ejemplo: 001-XXXXXX-5
ALTER TABLE client.Customer
ALTER COLUMN DocumentNumber
ADD MASKED WITH (FUNCTION = 'partial(3,"XXXX",2)');
GO