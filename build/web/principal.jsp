<%-- 
    Document   : principal
    Created on : 24/10/2024, 2:43:43 a. m.
    Author     : David Valenzuela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    // Establecer cabeceras para deshabilitar caché
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Verificar si la sesión está activa
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp"); // Redirigir si no hay sesión activa
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Página Principal</title>
     <style>
    :root {
      --waikawa-gray-50: #f4f7fa;
      --waikawa-gray-100: #e6ecf3;
      --waikawa-gray-200: #d2ddeb;
      --waikawa-gray-300: #b3c7dd;
      --waikawa-gray-400: #8faacb;
      --waikawa-gray-500: #7490bd;
      --waikawa-gray-600: #6179af;
      --waikawa-gray-700: #526498;
      --waikawa-gray-800: #4a5783;
      --waikawa-gray-900: #3f4a69;
      --waikawa-gray-950: #2a2f41;
    }
    
    body {
      background-image: url('img/img1.png'); /* Cambia 'tu-imagen-de-fondo.jpg' por la URL de tu imagen */

      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-color: var(--waikawa-gray-50);
      min-height: 100vh;
      color: var(--waikawa-gray-900);
    }
    
    .container {
      margin-top: 50px;
      background-color: var(--waikawa-gray-50);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    h2 {
      color: var(--waikawa-gray-800);
      margin-bottom: 30px;
    }
    
    .dropdown-menu {
      background-color: var(--waikawa-gray-200);
    }
    
    .dropdown-menu a {
      display: flex;
      align-items: center;
      color: var(--waikawa-gray-900);
    }
    
    .dropdown-menu a i {
      margin-right: 10px;
      color: var(--waikawa-gray-600);
    }
    
    .dropdown-menu a:hover {
      background-color: var(--waikawa-gray-500);
      color: white;
    }
    
    .btn-primary {
      background-color: var(--waikawa-gray-600);
      border: none;
    }
    
    .btn-primary:hover {
      background-color: var(--waikawa-gray-700);
    }
  </style>
</head>
<body>
    <h1>Bienvenido, ${sessionScope.usuario}</h1>
    <div class="container">
  <h2>PROYECTO FINAL</h2>
  
  <div class="dropdown">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      <i class="bi bi-ui-checks"></i> FORMULARIOS
    </button>
    <div class="dropdown-menu">
        <a class="dropdown-item" href="Puestos.jsp">
            <i class="bi bi-people"></i> PUESTOS
        </a>
        <a class="dropdown-item" href="Empleados.jsp">
            <i class="bi bi-tags"></i> EMPLEADOS
        </a>
        <a class="dropdown-item" href="Clientes.jsp">
            <i class="bi bi-person-standing"></i> CLIENTES
        </a>
        <a class="dropdown-item" href="Proveedores.jsp">
            <i class="bi bi-box-seam"></i> PROVEEDORES
        </a>
        <a class="dropdown-item" href="Marcas.jsp">
            <i class="bi bi-briefcase"></i> MARCAS
        </a>
        <a class="dropdown-item" href="Productos.jsp">
            <i class="bi bi-briefcase"></i> PRODUCTOS
        </a>
        <a class="dropdown-item" href="Ventas.jsp">
            <i class="bi bi-briefcase"></i> VENTAS
        </a>
    </div>
  </div>
</div>
    <!-- Enlace para cerrar sesión -->
    <a href="logout">Cerrar Sesión</a>
</body>
</html>

