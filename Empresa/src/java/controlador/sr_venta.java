package controlador;

import modelo.Venta; // Asegúrate de que la clase Venta esté en este paquete
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class sr_venta extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Venta venta = new Venta();
        HashMap<String, String> clientes = venta.drop_nombre_cliente();

        // Agregar la lista de clientes al request
        request.setAttribute("clientes", clientes);
        
        // Redirigir a la vista de ventas
        request.getRequestDispatcher("Ventas.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        int id_cliente = Integer.parseInt(request.getParameter("drop_cliente"));
        int no_factura = Integer.parseInt(request.getParameter("txt_no_factura"));
        String serie = request.getParameter("drop_serie");
        // Agrega más campos según sea necesario

        // Crear una instancia de la clase Venta y setear los datos
        Venta venta = new Venta();
        venta.setId_cliente(id_cliente);
        venta.setNo_factura(no_factura);
        venta.setSerie(serie);
        // Setea otros campos...

        // Llamar al método para insertar la venta en la base de datos
        venta.insertarVenta(); // Asegúrate de implementar este método

        // Redirigir a la vista de ventas o mostrar un mensaje de éxito
        response.sendRedirect("Ventas.jsp?success=true");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para manejar las ventas";
    }
}
