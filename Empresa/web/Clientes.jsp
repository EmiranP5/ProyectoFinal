<%-- 
    Document   : Clientes
    Created on : 29/09/2024, 1:28:53 p. m.
    Author     : Esteban Miranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


        
        <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Empleados</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="d-flex justify-content-center">
        <h1>Formulario Empleados</h1>
    </div>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo Empleado</button>

    <div class="container">
        <!-- Modal para CRUD de Empleados -->
        <div class="modal fade" id="modal_empleado" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <form method="post" class="form-group">
                            <label for="txt_idEmpleados"><b>Id Empleados:</b></label>
                            <input type="text" name="txt_idEmpleados" id="txt_idEmpleados" class="form-control" placeholder="Ejemplo: E001" required>
                            
                            <label for="txt_nombres"><b>Nombres:</b></label>
                            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                            
                            <label for="txt_apellidos"><b>Apellidos:</b></label>
                            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Apellido 1 Apellido 2" required>
                            
                            <label for="txt_direccion"><b>Dirección:</b></label>
                            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #casa calle zona ciudad" required>
                            
                            <label for="txt_telefono"><b>Teléfono:</b></label>
                       

        
        
        
        
        
    </body>
</html>
