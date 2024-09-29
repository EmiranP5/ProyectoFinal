<%@page import="modelo.marcas"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="d-flex justify-content-center">
        <h1>Formulario Marcas!</h1>
        </div>
        <button type="button" class="btn btn-info btn-lg " data-toggle="modal" data-target="#modal_proveedor" onclick="limpiar()">Nuevo Marca</button>


        <div class="container">
            <div class="modal fade" id="modal_proveedor" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
         
            <form action="sr_marcas" method="post" class="form-group">
                
                <label for="lbl_idEmpleado"><b>Id Marcas</b></label>
                 <input type="text" name="txt_idProveedores" id="txt_idProveedores"class="form-control" placeholder="Ejemplo: E001" required>
                 <label for="lbl_nombres"><b>Marca:</b></label>
                 <input type="text" name="txt_proveedor" id="txt_proveedor"class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                 </select>

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
        <th>Marcas</th>
      </tr>
    </thead>
    <tbody id="tbl_proveedores">
            <!-- tabla que muestra los datos del select leer() -->
          

                        
                        <%
         marcas Marcas = new marcas();
         DefaultTableModel tabla = new DefaultTableModel();
         tabla = Marcas.leer(); 
         for (int t=0;t<tabla.getRowCount();t++){
         out.println("<tr data-id=" + tabla.getValueAt(t,0) +  " data-id_p=" + tabla.getValueAt(t,1) +  ">");
         out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
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
             $("#txt_idProveedores").val(0);
            $("#txt_proveedor").val('');
            $("#txt_nit").val('');
            $("#txt_apellidos").val('');
            $("#txt_direccion").val('');
            $("#txt_telefono").val('');
            

          }
    
    $('#tbl_proveedores').on('click','tr td',function(evt){
            var target,id,proveedores,nit,direccion,telefono ;
            target = $(event.target);
            id = target.parent().data('id');
            proveedores = target.parent("tr").find("td").eq(0).html();
            nit = target.parent("tr").find("td").eq(1).html();
            direccion = target.parent("tr").find("td").eq(2).html();
            telefono = target.parent("tr").find("td").eq(3).html();

            

            $("#txt_idProveedores").val(id);
            $("#txt_proveedor").val(proveedores);
            $("#txt_nit").val(nit);
            $("#txt_direccion").val(direccion);
            $("#txt_telefono").val(telefono);
            //se agregaron dpi y genero, fecha inicial, fecha ingreso
            $("#modal_proveedor").modal('show');
               
           
    
    //
               
           });
       </script>
       </body>
    
</html>
