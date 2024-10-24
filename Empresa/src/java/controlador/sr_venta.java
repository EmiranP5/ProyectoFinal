package controlador;

import modelo.Venta;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sr_venta")
public class sr_venta extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("buscarCliente")) {
            String nit = request.getParameter("nit");
            Venta venta = new Venta();
            String datosCliente = venta.obtenerDatosClientePorNIT(nit); // Ahora devuelve los datos como una cadena

            response.setContentType("text/plain");
            response.getWriter().write(datosCliente != null ? datosCliente : "Cliente no encontrado");
        }
    }


}
    