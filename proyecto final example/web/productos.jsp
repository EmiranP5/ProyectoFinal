
<%@page import="modelo.marcas"%>
<%@page  import="modelo.productos"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="d-flex justify-content-center">
        <h1>Formulario Productos!</h1>
        </div>
        <button type="button" class="btn btn-info btn-lg " data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo Producto</button>
      

        <div class="container">
            <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
         
            <form action="sr_productos" method="post" class="form-group">
                
                <label for="lbl_idEmpleado"><b>Id Productos</b></label>
                 <input type="text" name="txt_idEmpleados" id="txt_idEmpleados"class="form-control" placeholder="Ejemplo: E001" required>
                 <label for="lbl_nombres"><b>Producto:</b></label>
                 <input type="text" name="txt_nombres" id="txt_nombres"class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                 <label for="lbl_sangre"><b>Marcas:</b></label>
                 <select name="drop_marca" id="drop_marca"class="form-control">
                     <%
                         marcas Marcas = new marcas();
                         HashMap<String,String>drop = Marcas.drop_sangre();
                         for (String i: drop.keySet()){
                         out.println("<option value='" + i +"'>" + drop.get(i) +"</option>");
                         }
                      %>
                 </select>
                 <label for="lbl_direccion"><b>Descripcion:</b></label>
                 <input type="text" name="txt_direccion" id="txt_direccion"class="form-control" placeholder="Ejemplo: #casa calle zona ciudad" required>
                  <label for="lbl_telefono"><b>Imagen:</b></label>
                 <input type="text" name="txt_telefono" id="txt_telefono"class="form-control" placeholder="Ejemplo:00000000 " required>
                 <label for="lbl_DPI"><b>Precio Costo:</b></label>
                 <input type="number" name="txt_DPI" id="txt_DPI"class="form-control" placeholder="Ejemplo:00000000 " required>
                 <label for="lbl_genero"><b>Precio Venta:</b></label>
                 <input type="text" name="txt_genero" id="txt_genero"class="form-control" placeholder="Ejemplo:00000000 " required>
                 <label for="lbl_fn"><b>Existencia:</b></label>
                 <input type="text" name="txt_fn" id="txt_fn"class="form-control"  required>
                 <label for="lbl_fechaingreso"><b>Fecha Ingreso</b></label>
                 <input type="date" name="txt_fechaingreso" id="txt_fechaingreso"class="form-control" placeholder=" " required>
                  
                 
                 <!-- agregamos el formulario de la nueva base de datos -->
                  <br>
                  <button name="btn_agregar" id="btn_agregar" value= "agregar"class="btn btn-primary btn-lg">Agregar</button>
                   <button name="btn_modificar" id="btn_modificar" value= "modificar"class="btn btn-secondary btn-lg">modificar</button>
                    <button name="btn_eliminar" id="btn_eliminar" value= "eliminar"class="btn btn-success btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">eliminar</button>
                    <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-warning" data-toggle="modal" ><a href="puesto.jsp" target="target" class="btn btn-warning">Puestos</a></button>
        
            </form>
        </div>
       
      </div>
      
    </div>
  </div>
                 
                <!-- tabla que genera los datos al servlet -->         
                 
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Producto</th>
        <th>Marca</th>
        <th>Descripcion</th>
        <th>Imagen</th>
        <th>Precio Costo</th>
        <th>Precio Venta</th>
        <th>Existencia</th>
        <th>Fecha Ingreso</th>
      </tr>
    </thead>
    
    <tbody id="tbl_empleados">
            <!-- tabla que muestra los datos del select leer() -->
           <%
         productos Productos = new productos();
         DefaultTableModel tabla = new DefaultTableModel();
         tabla = Productos.leer(); 
         for (int t=0;t<tabla.getRowCount();t++){
         out.println("<tr data-id=" + tabla.getValueAt(t,0) +  " data-id_p=" + tabla.getValueAt(t,8) +  ">");
         out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
         out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
         out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
         out.println("<td><a href='https://aprende.guatemala.com/wp-content/uploads/2017/02/S%C3%ADmbolo-Patrio-de-Guatemala-la-Monja-Blanca.jpg'>" + tabla.getValueAt(t,4) + "</a></td>");
         
         out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
         out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
         out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
         out.println("<td>" + tabla.getValueAt(t,8) + "</td>");
         out.println("</tr>");
         
            }
                        %>
        
    </tbody>
  </table>
</div>
            
        </div>
        

    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
       
       <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
       <script type="text/javascript">
          function limpiar(){
             $("#txt_id").val(0);
            $("#txt_idEmpleados").val('');
            $("#txt_nombres").val('');
            $("#txt_direccion").val('');
            $("#txt_telefono").val('');
            $("#txt_DPI").val('');
            $("#txt_genero").val('');
            $("#txt_fn").val('');
            $("#drop_marca").val(1);
            $("#txt_fecha_inicio_labores").val(1);
            $("#txt_fechaingreso").val(1);

          }
    
    $('#tbl_empleados').on('click','tr td',function(evt){
            var target,id,id_p,nombres,apellidos,direccion,telefono, DPI, genero ,fecha_nacimiento, fechaingreso ;
            target = $(event.target);
            id = target.parent().data('id');
            id_p = target.parent().data('id_p');
            nombres = target.parent("tr").find("td").eq(0).html();
            apellidos = target.parent("tr").find("td").eq(1).html();
            direccion = target.parent("tr").find("td").eq(2).html();
            telefono = target.parent("tr").find("td").eq(3).html();
            DPI = target.parent("tr").find("td").eq(4).html();
            genero = target.parent("tr").find("td").eq(5).html();
            fecha_nacimiento = target.parent("tr").find("td").eq(6).html();
            fechaingreso = target.parent("tr").find("td").eq(7).html();
  

            
            $("#id_p").val(id_p);
            $("#txt_idEmpleados").val(id);
            $("#txt_nombres").val(nombres);
            $("#drop_marca").val(apellidos);
            $("#txt_direccion").val(direccion);
            $("#txt_telefono").val(telefono);
            $("#txt_DPI").val(DPI);
            $("#txt_genero").val(genero);
            $("#txt_fn").val(fecha_nacimiento);

            $("#txt_fechaingreso").val(fechaingreso);
            

           
            $("#modal_empleado").modal('show');
               
           
    
    //
               
           });
       </script>
       </body>
    
</html>
