# 🎯 Caso de Negocio

En los sistemas de ventas actuales, es común que las empresas enfrenten **problemas de organización y trazabilidad de la información**, especialmente al registrar clientes, productos y métodos de pago. Estos problemas generan inconsistencias en los datos, pérdida de historial de ventas y dificultad para obtener reportes confiables.

Este proyecto propone **el diseño y modelado de una base de datos profesional** para registrar ventas realizadas a clientes, relacionando productos vendidos, sus cantidades, precios, fechas y métodos de pago. Además, se gestionará la información de clientes, inventario de productos y métodos de pago de manera estructurada y escalable.

---

## 🎯 Impacto esperado

- Mejora en la organización y trazabilidad de las ventas.
- Control eficiente de clientes, productos y órdenes.
- Mejora en la velocidad de consultas mediante particiones.
- Base sólida para análisis y generación de reportes futuros.

---

## 🔑 Reglas de negocio

- Un cliente puede tener muchas órdenes, pero cada orden pertenece a un solo cliente.
- Cada producto tiene un stock y un precio unitario.
- Las órdenes pueden tener múltiples productos (detalle de orden).
- Una orden debe tener un método de pago válido.

---

## 🗂️ Especificaciones funcionales

### 👥 Área: Clientes

**Tabla: `Customer`**

- Nombre completo  
- Documento de identidad (cédula o RNC, según el cliente sea persona física o jurídica)  
- Correo electrónico  
- Teléfono  
- Fecha de registro  

**Tabla: `DocumentType`**

- Nombre del tipo de documento  

---

### 📦 Área: Productos

**Tabla: `Product`**

- Nombre del producto  
- Descripción corta  
- Precio unitario  
- Stock actual  
- Categoría del producto  

**Tabla: `ProductCategory`**

- Nombre de la categoría  
- Descripción  

---

### 🧾 Área: Ventas

**Tabla: `PaymentMethod`**

- Código del método (PK)  
- Nombre del método (Ej.: Efectivo, Tarjeta, Transferencia, Cheque)  

**Tabla: `Orders`**

- ID de la orden  
- Fecha de la orden  
- Cliente asociado  
- Método de pago  
- Total de la orden  

**Tabla: `OrderDetail`**

- ID de la orden (FK)  
- Producto (FK)  
- Cantidad  
- Precio unitario (registrado en el momento de la venta)  
- Subtotal (precio unitario x cantidad)
