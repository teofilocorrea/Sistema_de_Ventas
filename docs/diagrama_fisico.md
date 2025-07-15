# **⚙️ Diagrama Físico**

En esta sección se presenta la **estructura física detallada** de la base de datos del sistema de ventas.

Cada tabla incluye sus **claves primarias**, **claves foráneas**, **tipos de datos exactos**, **restricciones** y las **acciones definidas** para mantener la integridad de la información.

El diagrama físico es el **puente entre el diseño lógico y la implementación real.**

Esta estructura será la base para la construcción del **script SQL** que creará la base de datos en el motor de **SQL Server**.

---

### **📌 ¿Qué encontrarás en esta sección?**

- 🔑 Clave primaria de cada tabla.  
- 🔗 Claves foráneas con sus respectivas acciones (`ON DELETE`, `ON UPDATE`).  
- ⚠️ Restricciones como `NOT NULL`, `UNIQUE`, `IDENTITY`.  
- 📝 Descripciones claras de cada campo para facilitar la comprensión y posterior desarrollo.  

---

Cada tabla está organizada por **área funcional**, permitiendo visualizar fácilmente la estructura y la conexión entre módulos del sistema.

## Área: Cliente

### Tabla: Customer

| Clave | Campo          | Tipo de datos      | Restricciones        | Acción FK             | Descripción / Comentario  |
|-------|----------------|--------------------|-----------------------|------------------------|---------------------------|
| PK    | CustomerId     | INT IDENTITY (1,1) | PRIMARY KEY           | -                      | Identificador del cliente |
| FK    | DocumentTypeId | INT                | NOT NULL              | ON DELETE NO ACTION    | Tipo de documento         |
| -     | DocumentNumber | NVARCHAR(25)       | NOT NULL              | -                      | Numero de documento       |
| -     | FirsName       | NVARCHAR(50)       | NOT NULL              | -                      | Nombre del cliente        |
| -     | LastName       | NVARCHAR(50)       | NOT NULL              | -                      | Apellido del cliente      |
| -     | Email          | VARCHAR(100)       | UNIQUE, NOT NULL      | -                      | Correo del cliente        |
| -     | Registration   | DATETIME2          | NOT NULL              | -                      | Fecha de registro         |

---

### Tabla: DocumentType

| Clave | Campo         | Tipo de datos      | Restricciones | Acción FK | Descripción / Comentario                                                  |
|-------|---------------|--------------------|---------------|------------|---------------------------------------------------------------------------|
| PK    | DocumentTypeId| INT IDENTITY (1,1) | PRIMARY KEY   | -          | Identificador único y secuencial del tipo de documento                   |
| -     | DocumentName  | NVARCHAR(30)       | NOT NULL      | -          | Nombre descriptivo del tipo de documento (por ejemplo: Cédula, Pasaporte, Licencia) |

## Área: Ventas

### Tabla: Orders

| Clave | Campo      | Tipo de datos      | Restricciones | Acción FK            | Descripción / Comentario                        |
|-------|------------|--------------------|----------------|------------------------|-------------------------------------------------|
| PK    | OrdersId   | INT IDENTITY (1,1) | PRIMARY KEY    | -                      | Identificador único de la orden                |
| FK    | CustomerId | INT                | NOT NULL       | ON DELETE NO ACTION    | Identificador del cliente asociado a la orden  |
| FK    | PmId       | INT                | NOT NULL       | ON DELETE NO ACTION    | Identificador del método de pago               |
| -     | DateOrder  | DATETIME2          | NOT NULL       | -                      | Fecha de creación de la orden                  |
| -     | TotalOrder | NUMERIC(10,2)      | NOT NULL       | -                      | Monto total de la orden                        |

---

### Tabla: PaymentMethod

| Clave | Campo       | Tipo de datos      | Restricciones | Acción FK | Descripción / Comentario                                      |
|-------|-------------|--------------------|---------------|------------|---------------------------------------------------------------|
| PK    | PmId        | INT IDENTITY (1,1) | PRIMARY KEY   | -          | Identificador único del método de pago                        |
| -     | TypeMethod  | NVARCHAR(30)       | NOT NULL      | -          | Nombre del método de pago (Ej.: Crédito, Débito, Efectivo)   |

---

### Tabla: OrdersDetail

| Clave | Campo        | Tipo de datos      | Restricciones | Acción FK             | Descripción / Comentario                        |
|-------|--------------|--------------------|----------------|------------------------|-------------------------------------------------|
| PK    | OrderDetailId| INT IDENTITY (1,1) | PRIMARY KEY    | -                      | Identificador único del detalle de la orden     |
| FK    | OrdersId     | INT                | NOT NULL       | ON DELETE CASCADE      | Identificador de la orden asociada              |
| FK    | ProductId    | INT                | NOT NULL       | ON DELETE NO ACTION    | Identificador del producto asociado             |
| -     | Quantity     | INT                | NOT NULL       | -                      | Cantidad de unidades del producto               |
| -     | UnitPrice    | NUMERIC(10,2)      | NOT NULL       | -                      | Precio por unidad del producto                  |
| -     | SubTotal     | NUMERIC(10,2)      | NOT NULL       | -                      | Monto total calculado para este detalle         |

## Área: Productos

### Tabla: Product

| Clave | Campo         | Tipo de datos      | Restricciones     | Acción FK             | Descripción / Comentario                         |
|-------|---------------|--------------------|-------------------|------------------------|--------------------------------------------------|
| PK    | ProductId     | INT IDENTITY (1,1) | PRIMARY KEY       | -                      | Identificador único de producto                  |
| FK    | CategoryProduct | INT              | NOT NULL          | ON DELETE NO ACTION    | Identificador de la OrderDetail asociada         |
| -     | NameProduct   | NVARCHAR(30)       | NOT NULL          | CHECK LATIN NAME       | Nombre de producto                               |
| -     | Description   | NVARCHAR(200)      | NOT NULL          | CHECK LATIN NAME       | Descripción del producto                         |
| -     | UnitePrice    | NUMERIC(6,2)       | NOT NULL          | -                      | Precio unitario del producto                     |

---

### Tabla: ProductCategory

| Clave | Campo            | Tipo de datos      | Restricciones     | Acción FK                    | Descripción / Comentario                                         |
|-------|------------------|--------------------|-------------------|------------------------------|------------------------------------------------------------------|
| PK    | ProductCategoryId| INT IDENTITY (1,1) | PRIMARY KEY       | -                            | Identificador único de la categoría de producto                 |
| -     | CategoryName     | NVARCHAR(30)       | NOT NULL          | CHECK (solo caracteres latinos)| Nombre de la categoría del producto (Ej.: Electrónica, Ropa)  |
| -     | Description      | NVARCHAR(200)      | NOT NULL          | CHECK (solo caracteres latinos)| Descripción detallada de la categoría del producto            |