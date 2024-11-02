<%-- 
    Document   : empleados
    Created on : 11/10/2020, 07:46:48 PM
    Author     : USUARIO
--%>
<%@page import="modelo.Marca"%>
<%@page import="java.util.HashMap"%>
<%@page import="modelo.Producto"%>
<%@page import="controlador.controlador"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
         <div class="container">                        
        <br><h3 style="text-align: center;">Lista de empleados</h3><br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="text-align: center;">
            Ingrese un nuevo empleado
        </button><br><br>

        <!-- Inicio de formulario: Modificar empleado -->
        <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="controlador" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nuevo empleado</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">

                                 <label for="lbl_id">ID del Producto</label>
                                 <input type="text" name="txt_id_producto" id="txt_id_producto" class="form-control" value="0" readonly="">
                              
                              <label for="lbl_producto"><b>Producto</b></label>
                              <input type="text" class="form-control" name="txt_producto" id="txt_producto" placeholder="Producto" aria-label="Producto">
                              
                              <label for="lbl_existencia"><b>Existencia</b></label>
                              <input type="number" class="form-control" name="txt_existencia" id="txt_existencia">
                               
                               <label for="lbl_descripcion"><b>Descripción</b></label>
                                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Descripcion del producto">
                                
                                    <label for="lbl_costo"><b>Precio Costo</b></label>
                                    <span class="input-group-text" id="basic-addon1">Q</span>
                                    <input type="number" step="0.01" name="txt_costo" id="txt_costo" class="form-control" placeholder="Q##. ##">
                                
                                    
                                    <label for="lbl_venta"><b>Precio de Venta</b></label>
                                    <span class="input-group-text" id="basic-addon1">Q</span>    
                                    <input type="number" step="0.01" name="txt_venta" id="txt_venta" class="form-control" placeholder="Q##. ##">
                                    
                                    <label for="lbl_imagenes"><b>Imagen</b></label>
                                     <input type="file" name="txt_imagen" id="txt_imagen" class="form-control" placeholder="Link de la imagen del producto">
                                     
                                     
                                    
                                <label><b>Marca: </b></label>
                                <select name="drop_marcas" id="drop_marcas" class="form-control" >
                               <%
                                    Marca marcas= new Marca();
                                    HashMap<String,String> desplegars= marcas.drop_marca();
                                    for(String i:desplegars.keySet())
                                    {
                                        out.println("<option value="+i+">"+desplegars.get(i)+ "</option>");
                                    }
                                %>
                                </select>
           
          
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="datetime-local" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>
                            </div>
                            <br>
                            <div class="modal-footer">
                                <button name="btn_modificar_productos" id="btn_modificar_productos" value="modificar_producto" class="btn btn-dark btn-lg">Modificar</button>
                                <button name="btn_eliminar_productos" id="btn_eliminar" value="eliminar_producto" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>
        
        <!-- Fin de formulario: Modificar empleado -->
        
        <!-- Inicio de formulario: Ingresar nuevo empleado -->
        
    <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="controlador" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nuevo empleado</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">

                                 <label for="lbl_id">ID del Producto</label>
                                 <input type="text" name="txt_id_producto" id="txt_id_producto" class="form-control" value="0" readonly="">
                              
                              <label for="lbl_producto"><b>Producto</b></label>
                              <input type="text" class="form-control" name="txt_producto" id="txt_producto" placeholder="Producto" aria-label="Producto">
                              
                              <label for="lbl_existencia"><b>Existencia</b></label>
                              <input type="number" class="form-control" name="txt_existencia" id="txt_existencia">
                               
                               <label for="lbl_descripcion"><b>Descripción</b></label>
                                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Descripcion del producto">
                                
                                    <label for="lbl_costo"><b>Precio Costo</b></label>
                                    <span class="input-group-text" id="basic-addon1">Q</span>
                                    <input type="number" step="0.01" name="txt_costo" id="txt_costo" class="form-control" placeholder="Q##. ##">
                                
                                    
                                    <label for="lbl_venta"><b>Precio de Venta</b></label>
                                    <span class="input-group-text" id="basic-addon1">Q</span>    
                                    <input type="number" step="0.01" name="txt_venta" id="txt_venta" class="form-control" placeholder="Q##. ##">
                                    
                                    <label for="lbl_imagenes"><b>Imagen</b></label>
                                     <input type="file" name="txt_imagen" id="txt_imagen" class="form-control" placeholder="Link de la imagen del producto">
                                     
                                     
                                    
                                <label><b>Marca: </b></label>
                                <select name="drop_marcas" id="drop_marcas" class="form-control" >
                               <%
                                    Marca marcasM= new Marca();
                                    HashMap<String,String> desplegarss= marcasM.drop_marca();
                                    for(String i:desplegars.keySet())
                                    {
                                        out.println("<option value="+i+">"+desplegarss.get(i)+ "</option>");
                                    }
                                %>
                                </select>
           
          
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="datetime-local" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button class="btn btn-info btn-block"  name="btn_agregar_productos" id="btn_agregar_productos" value="agregar_producto"><b>Agregar</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>        
        <!-- Fin de formulario: Ingresar nuevo empleado -->                    
                      
        <!-- Inicio tabla empleados -->        
           <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Producto </th>
                        <th>Descripcion </th>
                        <th>Imagen</th>
                        <th>Precio Costo </th>
                        <th>Precio Venta </th>
                        <th>Existencia</th>
                        <th>Fecha ingreso</th>
                        <th>Marca </th>
                    </tr>
                </thead>
                <tbody id="tbl_productos">
                    <%
                    Producto producto = new Producto();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = producto.leer();
                    for (int t=0;t <tabla.getRowCount();t++){
                        out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-id_producto="+tabla.getValueAt(t, 9)+">");
                        out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
                        out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
                        out.println("<td> <img src="+ tabla.getValueAt(t, 3)+" alt='imagen' width='100' height='100'></td>");
                        out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
                        out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
                        out.println("<td>"+ tabla.getValueAt(t, 6)+"</td>");
                        out.println("<td>"+tabla.getValueAt(t,7)+"</td>");
                        out.println("<td>"+tabla.getValueAt(t,8)+"</td>");
                        //out.println("<td>"+tabla.getValueAt(t,9)+"</td>");
                        out.println("</tr>");
                    }
                    %>
                </tbody>
            </table>
        </div>                             
        <!-- Fin tabla empleados -->
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>   
        <script type="text/javascript">
 
            $(document).ready(function() {
    $("#tbl_productos").on("click", "tr", function(evt) {
        var target = $(evt.target).closest("tr"); // Obtiene el <tr> específico

        // Extrae los datos de la fila
        var id = target.data("id");
        var id_producto = target.data("id_producto");
        var producto = target.find("td").eq(0).html();
        var descripcion = target.find("td").eq(1).html();
        var imagen = target.find("td").eq(2).html();
        var precio_costo = target.find("td").eq(3).html();
        var precio_venta = target.find("td").eq(4).html();
        var existencia = target.find("td").eq(5).html();
        var fecha_ingreso = target.find("td").eq(6).html();
        var marca = target.find("td").eq(7).html();

        // Asigna los valores a los campos correspondientes
        $("#txt_id_producto").val(id);
        $("#txt_producto").val(producto);
        $("#txt_descripcion").val(descripcion);
        $("#txt_imagen").val(imagen);
        $("#txt_costo").val(precio_costo);
        $("#txt_venta").val(precio_venta);
        $("#txt_existencia").val(existencia);
        $("#txt_fecha_ingreso").val(fecha_ingreso);
        $("#drop_marcas").val(marca);

        // Muestra el modal después de actualizar los campos
        $("#myModal").modal('show');
    });
});

            
        </script>
     
    </body>
</html>