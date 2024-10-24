
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.HashMap;


public class Venta {
    private int id_venta;
    private int no_factura;
    private String serie;
    private String fecha_factura;
    private int id_cliente;
    private int id_empleado;

    // Constructores
    public Venta(int id_venta, int no_factura, String serie, String fecha_factura, int id_cliente, int id_empleado) {
        this.id_venta = id_venta;
        this.no_factura = no_factura;
        this.serie = serie;
        this.fecha_factura = fecha_factura;
        this.id_cliente = id_cliente;
        this.id_empleado = id_empleado;
    }

    public Venta() {}

    // Getters y Setters
    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getNo_factura() {
        return no_factura;
    }

    public void setNo_factura(int no_factura) {
        this.no_factura = no_factura;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(String fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }
    public String obtenerDatosClientePorNIT(String nit) {
        String clienteData = "";
        try {
            Conexion cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT CONCAT(nombres, ' ', apellidos) AS nombre_completo, telefono, correo_electronico FROM clientes WHERE nit = ? AND estado = 'activo';";
            PreparedStatement pst = cn.conexionBD.prepareStatement(query);
            pst.setString(1, nit);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                clienteData = rs.getString("nombre_completo") + "," + rs.getString("telefono") + "," + rs.getString("correo_electronico");
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return clienteData;
    }

    
    public HashMap<String, String> drop_nombre_empleado() {
        HashMap<String, String> drop = new HashMap<>();

        try {
            Conexion cn = new Conexion();
            cn.abrir_conexion();
            // Concatenar nombres y apellidos
            String query = "SELECT id_empleado AS id, CONCAT(nombres, ' ', apellidos) AS nombre_completo FROM empleados WHERE estado = 'activo';";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("nombre_completo")); // Usar el nombre completo
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error..." + ex.getMessage());
        }
        return drop;
    }

    public HashMap<Integer, String> obtenerProductos() {
        HashMap<Integer, String> productos = new HashMap<>();

        try {
            Conexion cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT id_producto, producto, precio_venta FROM productos WHERE estado = 'activo';";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                int id = consulta.getInt("id_producto");
                String nombre = consulta.getString("producto");
                double precio = consulta.getDouble("precio_venta");
                productos.put(id, nombre + "," + precio); // Almacena el precio junto con el nombre
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return productos;
    }


}

    