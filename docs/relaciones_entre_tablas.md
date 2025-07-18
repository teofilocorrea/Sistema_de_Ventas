# 🔗 Documento de Relaciones entre Tablas

# 🔗 Relaciones Entre Tablas

Este documento describe de forma detallada las **relaciones foráneas** (FK) entre las tablas del sistema de ventas.  
Se incluye el nombre de la restricción, las acciones de integridad referencial y las columnas involucradas.

Estas relaciones son implementadas de forma modular mediante sentencias `ALTER TABLE`, facilitando mantenimiento, escalabilidad y control de versiones.

---

## 🔁 Relaciones Internas

| Área     | Tabla Base   | Columna FK         | Relacionada con     | Columna PK         | Acción ON DELETE / ON UPDATE | Nombre FK                             |
|----------|--------------|--------------------|----------------------|---------------------|-------------------------------|----------------------------------------|
| Cliente  | Customer     | DocumentTypeId     | DocumentType         | DocumentTypeId      | NO ACTION / NO ACTION         | FK_client_Customer_DocumentTypeId      |
| Producto | Product      | ProductCategoryId  | ProductCategory      | ProductCategoryId   | NO ACTION / NO ACTION         | FK_product_Product_ProductCategoryId   |
| Ventas   | Orders       | PaymentMethodId    | PaymentMethod        | PaymentMethodId     | NO ACTION / NO ACTION         | FK_sales_Orders_PaymentMethodId        |
| Ventas   | OrdersDetail | OrdersId           | Orders               | OrdersId            | CASCADE / NO ACTION           | FK_sales_OrdersDetail_OrdersId         |

---

## 🔗 Relaciones Externas

| Área Origen | Tabla Base     | Columna FK         | Referencia a         | Columna PK       | Área Destino | Acción ON DELETE / ON UPDATE | Nombre FK                             |
|-------------|----------------|--------------------|-----------------------|------------------|--------------|-------------------------------|----------------------------------------|
| Ventas      | Orders         | CustomerId         | Customer              | CustomerId       | Cliente      | CASCADE / CASCADE             | FK_sales_Orders_CustomerId             |
| Ventas      | OrdersDetail   | ProductId          | Product               | ProductId        | Producto     | NO ACTION / NO ACTION         | FK_sales_OrdersDetail_ProductId        |