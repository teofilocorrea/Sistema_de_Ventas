# 🧩 Estrategia de Particionado

El particionado de tablas en el sistema de ventas tiene como objetivo **mejorar el rendimiento de las consultas**, facilitar el mantenimiento de grandes volúmenes de datos y optimizar los recursos del motor de base de datos.

---

## 🎯 Objetivos del Particionado

- **Optimización de rendimiento**: Mejora la velocidad de ejecución de consultas que trabajan sobre grandes conjuntos de datos.
- **Mantenimiento simplificado**: Permite operaciones más eficientes como archivar o eliminar particiones antiguas.
- **Escalabilidad**: Facilita la gestión de crecimiento de datos en escenarios OLTP y OLAP.
- **Organización lógica**: Distribuye los datos según rangos de valores clave (por ejemplo, fechas o montos), permitiendo una segmentación útil para análisis.

## 📌 Tipos de Particionado Usado

| Nombre de Función       | Tipo de dato    | Criterio de partición     | Ejemplo de uso              |
|-------------------------|-----------------|----------------------------|-----------------------------|
| `PF_Customer_ByYear`    | `DATETIME2`     | Año de registro            | Tabla `Customer`            |
| `PF_Orders_ByYear`      | `DATETIME2`     | Año de emisión de orden    | Tabla `Orders`              |

---

## 🗂️ Ubicación de los scripts

Los scripts de partición están organizados de forma modular y se ubican **dentro de la carpeta correspondiente a la tabla que los utiliza**, para mantener la trazabilidad.

---

## 🛠️ Esquema de Partición

Cada función de partición (`PARTITION FUNCTION`) está enlazada a un esquema de partición (`PARTITION SCHEME`) que define el **grupo de archivos** en donde se almacenarán los datos.

Ejemplo:

```sql
CREATE PARTITION FUNCTION PF_Customer_ByYear (DATETIME2)
    AS RANGE LEFT FOR VALUES (
        '2022-12-31T23:59:59',
        '2023-12-31T23:59:59',
        '2024-12-31T23:59:59',
        '2025-12-31T23:59:59'
    );

CREATE PARTITION SCHEME PS_Customer_ByYear
    AS PARTITION PF_Customer_ByYear
    ALL TO ([PRIMARY]);