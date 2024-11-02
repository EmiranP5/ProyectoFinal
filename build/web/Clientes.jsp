<%@page import ="modelo.Genero"%>
<%@page import ="modelo.Cliente"%>
<%@page import ="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #e1f5fe; /* Color de fondo pastel */
                color: #2c3e50; /* Texto oscuro */
            }
            .container {
                margin-top: 30px;
                background-color: #ffffff; /* Fondo blanco para el contenedor */
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #009688; /* Color verde pastel para el título */
                font-size: 2.5rem; /* Tamaño de fuente mayor */
                text-align: center; /* Centrado del título */
                margin-bottom: 20px; /* Espacio inferior */
                font-weight: bold; /* Negrita */
            }
            .modal-header {
                background-color: #009688; /* Verde pastel para el encabezado del modal */
                color: white;
            }
            .btn-info {
                background-color: #66bb6a; /* Color verde pastel para el botón "Nuevo" */
                border: none;
                transition: background-color 0.3s; /* Transición suave */
            }
            .btn-info:hover {
                background-color: #388e3c; /* Color al pasar el mouse */
            }
            .table {
                background-color: #f1f8e9; /* Fondo de la tabla en un tono pastel */
                border-radius: 8px; /* Bordes redondeados */
                overflow: hidden; /* Para que el borde redondeado funcione */
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Sombra ligera */
            }
            .table th {
                background-color: #1976d2; /* Azul profundo para el encabezado */
                color: white; /* Texto blanco en encabezado */
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #e0f7fa; /* Color de filas alternas pastel */
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <h1>Formulario Clientes</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Nit</th>
                        <th>Genero</th>
                        <th>Telefono</th>
                        <th>Correo</th>
                        <th>Fecha Registro</th>
                    </tr>
                </thead>
                <tbody id="tbl_clientes">
                    <%
                        Cliente cliente = new Cliente();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = cliente.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_g=" + tabla.getValueAt(t, 8) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>

            <!-- Botón "Nuevo" al final de la tabla -->
            <button type="button" class="btn btn-info btn-lg" data-bs-toggle="modal" data-bs-target="#modal_cliente" onclick="limpiar()">Nuevo</button>

            <div class="modal fade" id="modal_cliente" tabindex="-1" role="dialog" aria-labelledby="modal_empleadoLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="modal_empleadoLabel">Formulario Cliente</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="sr_cliente" method="post" class="form-group">
                                <label for="lbl_id">Id</label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>

                                <label for="lbl_nombres">Nombres</label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Jorge Daniel" required>

                                <label for="lbl_apellidos">Apellidos</label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Aguilar Garcia" required>

                                <label for="lbl_nit">Nit</label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="7578441" required>

                                <label for="lbl_genero">Genero</label>
                                <select name="drop_genero" id="drop_genero" class="form-control" required>
                                    <%
                                        Genero genero = new Genero();
                                        HashMap<String, String> drop = genero.drop_nombre_genero();
                                        for (String i : drop.keySet()) {
                                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                        }
                                    %>
                                </select>

                                <label for="lbl_telefono">Telefono</label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="36688017" required>

                                <label for="lbl_correo">Correo Electronico</label>
                                <input type="email" name="txt_correo" id="txt_correo" class="form-control" placeholder="Jaguilar@gmail.com" required>

                                <label for="lbl_fecha_registro">Fecha registro</label>
                                <input type="date" name="txt_fecha_registro" id="txt_fecha_registro" class="form-control" required>

                                <br>
                                <button type="submit" name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                                <button type="submit" name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-info">Modificar</button>
                                <button type="submit" name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if (!confirm('¿Desea eliminar este registro?'))
                                        return false">Eliminar</button>
                                <button type="button" name="btn_cerrar" id="btn_cerrar" value="cerrar" class="btn btn-warning" data-bs-dismiss="modal">Cerrar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div
    </div>        

    <script type="text/javascript">
        function limpiar() {
            $("#txt_id").val(0);
            $("#txt_nombres").val('');
            $("#txt_apellidos").val('');
            $("#txt_nit").val('');
            $("#txt_telefono").val('');
            $("#txt_correo").val('');
            $("#txt_fecha_registro").val('');
            $("#drop_genero").val('');
            $("#modal_cliente").modal(1);

            $(document).ready(function () {
                $('#tbl_clientes').on('click', 'tr', function (event) {
                    var target, id, id_g, nombres, apellidos, nit, telefono, correo, fecha_registro;
                    target = $(this);
                    id = target.data('id');
                    id_g = target.data('id_g');
                    nombres = target.find("td").eq(0).html();
                    apellidos = target.find("td").eq(1).html();
                    nit = target.find("td").eq(2).html();
                    telefono = target.find("td").eq(4).html();
                    correo = target.find("td").eq(5).html();
                    fecha_registro = target.find("td").eq(6).html();

                    // Llenando los campos del formulario
                    $("#txt_id").val(id);
                    $("#txt_nombres").val(nombres);
                    $("#txt_apellidos").val(apellidos);
                    $("#txt_nit").val(nit);
                    $("#txt_telefono").val(telefono);
                    $("#txt_correo").val(correo);
                    $("#txt_fecha_registro").val(fecha_registro);
                    $("#drop_genero").val(id_g);
                    $("#modal_cliente").modal('show');
                });
            });
        </script>
    </body>
</html>
