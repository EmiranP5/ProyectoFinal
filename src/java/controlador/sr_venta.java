package controlador;

import modelo.Venta;
import modelo.Conexion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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
            String datosCliente = venta.obtenerDatosClientePorNIT(nit);

            response.setContentType("text/plain");
            response.getWriter().write(datosCliente != null ? datosCliente : "Cliente no encontrado");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recoger los datos del formulario
        String serie = request.getParameter("drop_serie");
        String noFactura = request.getParameter("txt_no_factura");
        String idCliente = request.getParameter("txt_id_cliente");
        String idEmpleado = request.getParameter("txt_id_empleado");
        String[] productos = request.getParameterValues("producto[]");
        String[] cantidades = request.getParameterValues("cantidad[]");
        String[] preciosUnitarios = request.getParameterValues("precio_unitario[]");

        // Crear una instancia de la clase Venta
        Venta venta = new Venta();
        Connection conn = null;

        try {
            // Abre la conexión
            Conexion conexion = new Conexion();
            conexion.abrir_conexion();
            conn = conexion.conexionBD;

            // Calcular el total de la venta
            double totalVenta = 0;
            for (int i = 0; i < productos.length; i++) {
                totalVenta += Integer.parseInt(cantidades[i]) * Double.parseDouble(preciosUnitarios[i]);
            }

            // Inserción de la venta
            int idVenta = venta.insertarVenta(serie, Integer.parseInt(idCliente), Integer.parseInt(idEmpleado), totalVenta);

            // Inserción de los detalles de la venta
            for (int i = 0; i < productos.length; i++) {
                venta.insertarDetalleVenta(conn, idVenta, Integer.parseInt(productos[i]), Integer.parseInt(cantidades[i]), Double.parseDouble(preciosUnitarios[i]));
            }

            // Redirigir a una página de éxito
            response.sendRedirect("Ventas.jsp");
        } catch (Exception e) {
            e.printStackTrace(); // Manejo de errores básico
            response.sendRedirect("error.jsp");
        } finally {
            // Cierra la conexión aquí
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.out.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }
    }

}
