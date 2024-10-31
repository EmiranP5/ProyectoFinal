<%-- 
    Document   : index
    Created on : 20/09/2024, 10:39:28 p. m.
    Author     : esteban
--%>


<%@page import="modelo.Puesto"%>
<%@page import="modelo.Empleado"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Empleados</h1>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  
        <div class="container">
         <div class="modal fade" id="modal_empleado" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content"> 
            <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Formulario Empleados</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="sr_empleado" method="post" class="form-group" >
                <label for="lbl_id"><b>ID:</b> </label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_codigo"><b>Codigo:</b> </label>
                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: 001" required>
                <label for="lbl_nombres"><b>Nombre: </b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo Nombre 1, Nombre 2" required>
                <label for="lbl_apellidos"><b>Apellidos: </b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo Apellido 1, Apellido 2" required>
                <label for="lbl_direccion"><b>Direccion: </b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo No. Casa - calle - zona - ciudad" required>
                <label for="lbl_telefono"><b>Telefono: </b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo 12345678" required>
                <label for="lbl_fn"><b>Fecha Nacimiento: </b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                <label for="lbl_fn"><b>Puesto: </b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <%
                        Puesto puesto = new Puesto();
                        HashMap<String,String> drop = puesto.drop_puestos();
                        for (String i:drop.keySet()){
                        out.println("<option value='" + i + "' >"+ drop.get(i) + "</option>");
                        }
                     %>
                </select>
                <br>
                <button value="agregar" class="btn btn-primary" name="btn_agregar" id="btn_agregar">Agregar</button>
                <button value="modificar" class="btn btn-success" name="btn_modificar" id="btn_modificar">Modificar</button>
                <button value="eliminar" class="btn btn-danger" name="btn_eliminar" id="btn_eliminar" onclick="javascript:if(!confirm('Eliminar 100%')) return false">Elimnar</button>
            </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
      </div>
        </div>
    </div>
         </div>
    
               <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Nacimiento</th>
                            <th>Puesto</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_empleados">
                        <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t=0;t<tabla.getRowCount();t++){
                            out.println("<tr data-id='"+ tabla.getValueAt(t, 0) +"' data-id_p='"+ tabla.getValueAt(t, 8) +"'>");
                            out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 7) +"</td>");
                            out.println("</tr>");
                            }
                        %>
                    </tbody>
                </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
               $("#txt_id").val(0);
                $("#txt_codigo").val('');
                $("#txt_nombres").val('');
                $("#txt_apellidos").val('');
                $("#txt_direccion").val('');
                $("#txt_telefono").val('');
                $("#txt_fn").val('');
                $("#drop_puesto").val(1); 
            }
            
            $('#tbl_empleados').on('click','tr td',function(evt){
                var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
                target = $(event.target);
                id = target.parent().data('id');
                id_p = target.parent().data('id_p');
                codigo = target.parent("tr").find("td").eq(0).html();
                nombres = target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                nacimiento = target.parent("tr").find("td").eq(5).html();
                $("#txt_id").val(id);
                $("#txt_codigo").val(codigo);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_fn").val(nacimiento);
                $("#drop_puesto").val(id_p);
                $("#modal_empleado").modal('show');
            });
        </script>
    </body>
</html>