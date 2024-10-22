<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <select name="producto[]" class="form-control">
                                <option value="1">Producto 1</option>
                                <option value="2">Producto 2</option>
                                <option value="3">Producto 3</option>
                            </select>
                        </div>
                        <div class="col">
                            <label>Cantidad:</label>
                            <input type="number" name="cantidad[]" class="form-control" placeholder="Cantidad" min="1" required>
                        </div>
                    </div>`;

                // Insertar el nuevo campo de producto al contenedor
                $('#productosContainer').append(nuevoProducto);
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
                                        <label for="lbl_cliente">Cliente</label>
                                        <select name="drop_cliente" id="drop_cliente" class="form-control" required>
                                            <!-- Este select se llenará dinámicamente por AJAX -->
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="lbl_empleado">Empleado</label>
                                        <select name="drop_empleado" id="drop_empleado" class="form-control" required>
                                            <option value="1">Empleado 1</option>
                                            <option value="2">Empleado 2</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Contenedor donde se agregarán dinámicamente los productos -->
                                <h4 class="mt-4">Productos</h4>
                                <div id="productosContainer">
                                    <!-- Primer producto por defecto -->
                                    <div class="row">
                                        <div class="col">
                                            <label>Producto:</label>
                                            <select name="producto[]" class="form-control">
                                                <option value="1">Producto 1</option>
                                                <option value="2">Producto 2</option>
                                                <option value="3">Producto 3</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label>Cantidad:</label>
                                            <input type="number" name="cantidad[]" class="form-control" placeholder="Cantidad" min="1" required>
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
