<%-- 
    Document   : index
    Created on : 29/09/2024, 1:17:34 p. m.
    Author     : Esteban Miranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Proyecto Final</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <!-- Custom Styles -->
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
    </div>
  </div>
</div>
</body>
</html>
