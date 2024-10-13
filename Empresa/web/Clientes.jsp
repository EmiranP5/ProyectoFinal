<%-- 
    Document   : Clientes
    Created on : 29/09/2024, 1:28:53 p. m.
    Author     : Esteban Miranda
--%>
<%@page import ="modelo.Genero"%>
<%@page import ="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Formulario Clientes</h1>
            <div class ="container">
                <form action ="" method="post" class="form-group">
                    <label for="lbl_nombres">Nombres</label>
                    <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Luis Manuel" required>
                    
                    <label for="lbl_apellidos">Apellidos</label>
                    <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Culajay Herrera" required>
                    
                    <label for="lbl_nombres">Nit</label>
                    <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 487597-1" required>
                    
                    <label for="lbl_genero">Genero</label>
                    <select name="drop_genero" id="drop_genero" class="form-control" required>
                        
                        <%
                            Genero genero = new Genero();
                            HashMap<String, String> drop = genero.drop_nombre_genero();
                            for(String i: drop.keySet()){
                                out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                            }  
                        %>
                        
                        
                        
                    </select>

                    <label for="lbl_telefono">Telefono</label>
                    <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 47897845" required>
                    
                    <label for="lbl_correo">Correo Electronico</label>
                    <input type="email" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: lherrera@gmail.com" required>
                    
                    <label for="lbl_fecha_registro">Nit</label>
                    <input type="date" name="txt_fecha_registro" id="txt_fecha_registro" class="form-control" placeholder="Ejemplo: 10/10/2024" required>

                    
                    <br><button type="submit" name="btn_agregar" id="btn_agregar" class="btn btn-primary">Agregar</button>

                </form>
            </div>
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
