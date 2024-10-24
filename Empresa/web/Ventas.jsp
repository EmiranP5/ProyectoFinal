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

        <script>
            // Función para añadir un nuevo producto
            function agregarProducto() {
                var nuevoProducto = `
                    <div class="row mt-2">
                        <div class="col">
                            <label>Producto:</label>
                            <select name="producto[]" class="form-control" onchange="actualizarPrecio(this)">
                                <option value="" disabled selected>Seleccione un producto</option>
            <%
                                    // Obtenemos los productos desde la base de datos
                                    Venta venta = new Venta();
                                    HashMap<Integer, String> drop = venta.obtenerProductos();
                                    for (Integer id : drop.keySet()) {
                                        String[] datos = drop.get(id).split(","); // Separa el nombre y el precio
                                        out.println("<option value='" + id + "' data-precio='" + datos[1] + "'>" + datos[0] + "</option>");
                                    }
            %>
                            </select>
                        </div>
                        <div class="col">
                            <label>Cantidad:</label>
                            <input type="number" name="cantidad[]" class="form-control" placeholder="Cantidad" min="1" required>
                        </div>
                        <div class="col">
                            <label>Precio:</label>
                            <input type="number" name="precio[]" class="form-control" placeholder="0.00" readonly>
                        </div>
                    </div>`;
            // Insertar el nuevo campo de producto al contenedor
            $('#productosContainer').append(nuevoProducto);
            }

            function actualizarPrecio(selectElement) {
            var selectedOption = selectElement.options[selectElement.selectedIndex];
            var precio = selectedOption.getAttribute('data-precio');
            // Actualiza el campo de precio
            var cantidadInput = $(selectElement).closest('.row').find('input[name="cantidad[]"]');
            var precioInput = $(selectElement).closest('.row').find('input[name="precio[]"]');
            // Actualiza el precio cuando cambia la cantidad
            cantidadInput.on('input', function() {
            var cantidad = $(this).val();
            var totalPrecio = (cantidad * precio).toFixed(2); // Calcular el precio total
            precioInput.val(totalPrecio); // Mostrar el precio total
            });
            // Si la cantidad ya fue ingresada, calcular el precio inicial
            if (cantidadInput.val()) {
            var cantidad = cantidadInput.val();
            var totalPrecio = (cantidad * precio).toFixed(2);
            precioInput.val(totalPrecio);
            } else {
            precioInput.val(''); // Limpiar si no hay cantidad
            }
            }
        </script>
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
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="lbl_serie">Serie</label>
                                        <select name="drop_serie" id="drop_serie" class="form-control" required>
                                            <option value="A">Serie A</option>
                                            <option value="B">Serie B</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="lbl_no_factura">No. Factura</label>
                                        <input type="text" name="txt_no_factura" id="txt_no_factura" class="form-control" value="0" readonly>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label for="txt_nit_cliente">NIT Cliente</label>
                                        <input type="text" id="txt_nit_cliente" class="form-control" placeholder="Ingrese NIT" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txt_nombre_cliente">Nombre Cliente</label>
                                        <input type="text" id="txt_nombre_cliente" class="form-control" readonly>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label for="txt_telefono_cliente">Teléfono Cliente</label>
                                        <input type="text" id="txt_telefono_cliente" class="form-control" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txt_correo_cliente">Correo Cliente</label>
                                        <input type="text" id="txt_correo_cliente" class="form-control" readonly>
                                    </div>
                                </div>

                                <script type="text/javascript">
                                    $(document).ready(function() {
                                        $('#txt_nit_cliente').blur(function() {
                                            var nit = $(this).val();
                                            if (nit !== '') {
                                                $.ajax({
                                                    type: 'GET',
                                                    url: 'sr_venta',
                                                    data: {action: 'buscarCliente', nit: nit},
                                                    success: function(data) {
                                                    var datos = data.split(',');
                                                        $('#txt_nombre_cliente').val(datos[0]); // Nombre completo
                                                        $('#txt_telefono_cliente').val(datos[1]); // Teléfono
                                                        $('#txt_correo_cliente').val(datos[2]); // Correo
                                                    },
                                                    error: function() {
                                                        alert('Cliente no encontrado o error en la consulta.');
                                                    }
                                                });
                                            } else {
                                                $('#txt_nombre_cliente').val('');
                                                $('#txt_telefono_cliente').val('');
                                                $('#txt_correo_cliente').val('');
                                            }
                                        });
                                    });
                                </script>

                                <br>  
                                <label for="lbl_empleado">Empleado</label>
                                <select name="drop_empleado" id="drop_empleado" class="form-control" required>
                                    <option value="" disabled selected>Seleccione al empleado</option> <!-- Opción por defecto -->
                                    <%
                                        venta = new Venta();
                                        HashMap<String, String> dropE = venta.drop_nombre_empleado();
                                        for (String i : dropE.keySet()) {
                                            out.println("<option value='" + i + "'>" + dropE.get(i) + "</option>");
                                        }
                                    %>
                                </select>

                                <!-- Contenedor donde se agregarán dinámicamente los productos -->
                                <h4 class="mt-4">Productos</h4>
                                <div id="productosContainer">
                                    <!-- Primer producto por defecto -->
                                    <div class="row">
                                        <div class="col">
                                            <label>Producto:</label>
                                            <select name="producto[]" class="form-control" onchange="actualizarPrecio(this)">
                                                <option value="" disabled selected>Seleccione un producto</option>
                                                <%
                                                    // Obtenemos los productos desde la base de datos
                                                    venta = new Venta();
                                                    HashMap<Integer, String> dropP = venta.obtenerProductos();
                                                    for (Integer id : dropP.keySet()) {
                                                        String[] datos = drop.get(id).split(","); // Separa el nombre y el precio
                                                        out.println("<option value='" + id + "' data-precio='" + datos[1] + "'>" + datos[0] + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label>Cantidad:</label>
                                            <input type="number" name="cantidad[]" class="form-control" placeholder="Cantidad" min="1" required>
                                        </div>
                                        <div class="col">
                                            <label>Precio:</label>
                                            <input type="number" name="precio[]" class="form-control" placeholder="0.00" readonly>
                                        </div>
                                    </div>
                                </div>

                                <!-- Botón para agregar otro producto -->
                                <button type="button" class="btn btn-success mt-3" onclick="agregarProducto()">Agregar otro producto</button>
                            </form>
                        </div>

                        <!-- Pie del modal -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-custom" form="ventaForm">Registrar Venta</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
