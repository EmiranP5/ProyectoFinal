
# Proyecto Final - Ingeniería en Sistemas

Este repositorio contiene el proyecto final de la materia **Programación II** de la Universidad Mariano Gálvez, desarrollado en **Java Web** utilizando **JSP**, **MySQL** y el framework de **Bootstrap** para la interfaz de usuario. El objetivo principal es demostrar habilidades prácticas de programación en Java, manejo de bases de datos y la creación de sitios web.

## Objetivos del Proyecto
- Desarrollar una aplicación web que implemente un sistema completo de gestión de empleados, clientes, proveedores, productos, ventas y compras.
- Crear una base de datos en MySQL y conectar la aplicación mediante operaciones **CRUD**.
- Desarrollar un menú dinámico con una estructura jerárquica utilizando HTML y Bootstrap.
- Implementar una aplicación móvil nativa en Android para visualizar los productos consumiendo un API REST.

## Funcionalidades Implementadas
- **Gestión de Empleados**: Crear, leer, actualizar y eliminar empleados.
- **Gestión de Clientes**: CRUD de clientes con validación de datos.
- **Gestión de Proveedores**: CRUD de proveedores con interacciones cruzadas.
- **Gestión de Productos**: CRUD de productos con carga de imágenes.
- **Gestión de Ventas y Compras**: Formularios maestra-detalle que actualizan automáticamente el inventario y los precios.
- **Reportes**: Generación de 5 reportes básicos con JasperReports.
- **Autenticación**: Sistema de login para el acceso a la aplicación.
- **Aplicación Móvil**: Visualización de productos desde una app móvil Android.

## Tecnologías Utilizadas
- **Lenguajes de Programación**: Java (JSP, Servlet), SQL, HTML, CSS, JavaScript.
- **Base de Datos**: MySQL.
- **Framework de Interfaz de Usuario**: Bootstrap 4.6.
- **Patrón de Diseño**: MVC (Modelo-Vista-Controlador).
- **Herramientas de Colaboración**: Git y GitHub.
- **API REST**: Desarrollado en .NET para consumo en la app móvil.
- **Reportes**: JasperReports.

## Estructura del Proyecto

```bash
├── src/                      # Código fuente del proyecto
├── web/                      # Archivos JSP y recursos web
│   ├── empleados.jsp          # CRUD de Empleados
│   ├── marcas.jsp             # CRUD de Marcas
│   ├── proveedores.jsp        # CRUD de Proveedores
│   ├── productos.jsp          # CRUD de Productos
│   ├── ventas.jsp             # Mantenimiento de Ventas
│   ├── compras.jsp            # Mantenimiento de Compras
│   ├── login.jsp              # Pantalla de Login
├── database/                 # Archivos de base de datos (scripts SQL)
├── mobile_app/               # Código fuente de la aplicación móvil
└── README.md                 # Documentación del proyecto
