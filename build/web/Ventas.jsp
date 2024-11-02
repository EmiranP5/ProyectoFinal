<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Venta"%>
<%@page import ="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario Ventas</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            /* Estilo para ventana modal en colores fríos */
            .modal-header {
                background-color: #5dade2; /* Azul claro */
                color: white;
            }
            .modal-footer {
                background-color: #d4e6f1; /* Azul suave */
            }
            .btn-custom {
                background-color: #2874a6; /* Botón en azul oscuro */
                color: white;
            }
            .form-control, select {
                border: 1px solid #a9cce3;
            }
            body {
                background-color: #f4f6f7; /* Fondo en gris claro */
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <!-- Botón para abrir la ventana modal -->
            <button type="button" class="btn btn-custom" data-bs-toggle="modal" data-bs-target="#modalVenta">
                Nueva Venta
            </button>

            <!-- Modal -->
            <div class="modal fade" id="modalVenta" tabindex="-1" aria-labelledby="modalVentaLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <!-- Encabezado del modal -->
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalVentaLabel">Formulario de Venta</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- Cuerpo del modal -->
                        <div class="modal-body">
                            <!-- Formulario para registrar la venta -->
                            <form action="sr_venta" method="post" id="ventaForm" class="form-group">

                                <!-- Datos generales de la venta -->
                                <h4 class="mt-4">Datos Factura</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="lbl_serie">Serie</label>
                                        <select name="drop_serie" id="drop_serie" class="form-control" required>
                                            <option value="A">Serie A</option>
                                            <option value="B">Serie B</option>
                                            <option value="A">Serie C</option>
                                            <option value="B">Serie D</option>
                                            <option value="A">Serie E</option>
                                            <option value="B">Serie F</option>
                                            <option value="A">Series Especiales</option>
                                        </select>
                                    </div>
                                </div>

                                <h4 class="mt-4">Datos Cliente</h4>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label for="txt_nit_cliente">NIT Cliente</label>
                                        <input type="text" name ="txt_nit_cliente" id="txt_nit_cliente" class="form-control" placeholder="Ingrese NIT" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txt_nombre_cliente">Nombre Cliente</label>
                                        <input type="text" name="txt_nombre_cliente" id="txt_nombre_cliente" class="form-control" readonly>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-1">
                                        <label for="txt_id_cliente">ID</label>
                                        <input type="text" name="txt_id_cliente" id="txt_id_cliente" class="form-control" readonly>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="txt_telefono_cliente">Teléfono Cliente</label>
                                        <input type="text" name="txt_telefono_cliente" id="txt_telefono_cliente" class="form-control" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txt_correo_cliente">Correo Cliente</label>
                                        <input type="text" name="txt_correo_cliente" id="txt_correo_cliente" class="form-control" readonly>
                                    </div>
                                </div>

                                <!-- Script para buscar cliente por NIT -->
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('#txt_nit_cliente').blur(function () {
                                            var nit = $(this).val();
                                            if (nit !== '') {
                                                $.ajax({
                                                    type: 'GET',
                                                    url: 'sr_venta',
                                                    data: {action: 'buscarCliente', nit: nit},
                                                    success: function (data) {
                                                        var datos = data.split(',');
                                                        $('#txt_id_cliente').val(datos[0]);
                                                        $('#txt_nombre_cliente').val(datos[1]);
                                                        $('#txt_telefono_cliente').val(datos[2]);
                                                        $('#txt_correo_cliente').val(datos[3]);
                                                    },
                                                    error: function () {
                                                        alert('Cliente no encontrado o error en la consulta.');
                                                    }
                                                });
                                            } else {
                                                $('#txt_id_cliente').val('');
                                                $('#txt_nombre_cliente').val('');
                                                $('#txt_telefono_cliente').val('');
                                                $('#txt_correo_cliente').val('');
                                            }
                                        });
                                    });
                                </script>  
                                <h4 class="mt-4">Datos Empleado</h4>
                                <div class="row">
                                    <div class="col-1">
                                        <label for="txt_id_empleado">ID</label>
                                        <input type="text" name="txt_id_empleado" id="txt_id_empleado" class="form-control" readonly>
                                    </div>
                                    <div class="col-11">
                                        <label for="lbl_empleado">Empleado</label>
                                        <select name="drop_empleado" id="drop_empleado" class="form-control" required onchange="mostrarIdEmpleado(this)">
                                            <option value="" disabled selected>Seleccione al empleado</option>
                                            <%
                                                Venta venta = new Venta();
                                                HashMap<String, String> dropE = venta.drop_nombre_empleado();
                                                for (String id : dropE.keySet()) {
                                                    out.println("<option value='" + id + "'>" + dropE.get(id) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <!-- Script para mostrar ID del empleado -->
                                <script type="text/javascript">
                                    function mostrarIdEmpleado(selectElement) {
                                        // Obtener el ID del empleado seleccionado
                                        var empleadoId = selectElement.value; 
                                        document.getElementById('txt_id_empleado').value = empleadoId; // Asignar el ID al campo correspondiente
                                    }
                                </script>

                                <!-- Productos -->
                                <h4 class="mt-4">Productos</h4>
                                <div id="productosContainer">
                                    <!-- Primer producto por defecto -->
                                    <div class="row producto">
                                        <div class="col-1">
                                            <label for="txt_id_producto">ID</label>
                                            <input type="text" name="txt_id_producto[]" class="form-control" readonly>
                                        </div>
                                        <div class="col-5">
                                            <label for="drop_producto">Producto</label>
                                            <select name="producto[]" class="form-control" required onchange="mostrarIdProducto(this)">
                                                <option value="" disabled selected>Seleccione un producto</option>
                                                <%
                                                    HashMap<Integer, String> dropP = venta.obtenerProductos();
                                                    for (Integer id : dropP.keySet()) {
                                                        String[] datos = dropP.get(id).split(",");
                                                        out.println("<option value='" + id + "' data-precio='" + datos[1] + "'>" + datos[0] + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-2">
                                            <label>Precio Unitario</label>
                                            <input type="number" name="precio_unitario[]" class="form-control" placeholder="0.00" readonly>
                                        </div>
                                        <div class="col-2">
                                            <label>Cantidad</label>
                                            <input type="number" name="cantidad[]" class="form-control" placeholder="Cantidad" min="1" required oninput="calcularPrecioTotal(this)">
                                        </div>
                                        <div class="col-2">
                                            <label>Precio Total</label>
                                            <input type="number" name="precio_total[]" class="form-control" placeholder="0.00" readonly>
                                        </div>
                                    </div>
                                </div>

                                <!-- Script para productos dinámicos -->
                                <script type="text/javascript">
                                    function mostrarIdProducto(selectElement) {
                                        var productoId = selectElement.value;
                                        var precio = selectElement.options[selectElement.selectedIndex].getAttribute('data-precio');
                                        var row = $(selectElement).closest('.producto');
                                        row.find('input[name="txt_id_producto[]"]').val(productoId);
                                        row.find('input[name="precio_unitario[]"]').val(precio);
                                        calcularPrecioTotal(row.find('input[name="cantidad[]"]'));
                                    }

                                    function calcularPrecioTotal(cantidadInput) {
                                        var row = $(cantidadInput).closest('.producto');
                                        var cantidad = $(cantidadInput).val();
                                        var precioUnitario = row.find('input[name="precio_unitario[]"]').val();
                                        var precioTotal = cantidad * precioUnitario;
                                        row.find('input[name="precio_total[]"]').val(precioTotal.toFixed(2));
                                    }

                                    function agregarProducto() {
                                        var nuevoProducto = $('#productosContainer .producto').first().clone();
                                        nuevoProducto.find('select').val('');
                                        nuevoProducto.find('input[type="number"]').val('');
                                        $('#productosContainer').append(nuevoProducto);
                                    }
                                </script>

                                <button type="button" class="btn btn-primary mt-3" onclick="agregarProducto()">Agregar otro producto</button>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Registrar Venta</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
