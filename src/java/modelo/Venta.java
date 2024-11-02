package modelo;
import modelo.Conexion;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.swing.table.DefaultTableModel;


public class Venta {
    private int id_venta;
    private int no_factura;
    private String serie;
    private String fecha_factura;
    private int id_cliente;
    private int id_empleado;
    private Conexion conexion;

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

    public Venta(Conexion conexion) {
        this.conexion = conexion;
    }
    

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
    
    public DefaultTableModel leer() {
    DefaultTableModel tabla = new DefaultTableModel();
    try {
        conexion = new Conexion();
        conexion.abrir_conexion();
        String query = "SELECT id_venta, no_factura, serie, id_cliente, id_empleado, estado, total_venta, fecha FROM ventas WHERE estado = 'activo';";
        ResultSet consulta = conexion.conexionBD.createStatement().executeQuery(query);
        String encabezado[] = {"id_venta", "no_factura", "serie", "id_cliente", "id_empleado", "estado", "total_venta", "fecha"};
        tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String[8];
        while (consulta.next()) {
            datos[0] = consulta.getString("id_venta");
            datos[1] = consulta.getString("no_factura");
            datos[2] = consulta.getString("serie");
            datos[3] = consulta.getString("id_cliente");
            datos[4] = consulta.getString("id_empleado");
            datos[5] = consulta.getString("estado");
            datos[6] = consulta.getString("total_venta");
            datos[7] = consulta.getString("fecha");
            tabla.addRow(datos);
        }
        conexion.cerrar_conexion();
    } catch(SQLException ex) {
        System.out.println(ex.getMessage());
    }
    return tabla;
}

    public String obtenerDatosClientePorNIT(String nit) {
        String clienteData = "";
        try {
            Conexion cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT id_cliente, CONCAT(nombres, ' ', apellidos) AS nombre_completo, telefono, correo_electronico FROM clientes WHERE nit = ? AND estado = 'activo';";
            PreparedStatement pst = cn.conexionBD.prepareStatement(query);
            pst.setString(1, nit);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                clienteData = rs.getString("id_cliente") + "," + rs.getString("nombre_completo") + "," + rs.getString("telefono") + "," + rs.getString("correo_electronico");
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
    
     public String crear_no_factura() {
        LocalDateTime ahora = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmm");
        return ahora.format(formatter);
    }

    public int insertarVenta(String serie, int idCliente, int idEmpleado, double totalVenta) {
        Connection conn = null;
        PreparedStatement ps = null;
        int idVenta = 0;
        // Crear una nueva instancia de Conexion
        this.conexion = new Conexion();

        try {
            // Abre la conexión
            conexion.abrir_conexion();
            conn = conexion.conexionBD;

            String sqlVenta = "INSERT INTO ventas (serie, no_factura, id_cliente, id_empleado, total_venta, fecha) VALUES (?, ?, ?, ?, ?, NOW())";
            ps = conn.prepareStatement(sqlVenta, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, serie);
            ps.setString(2, crear_no_factura()); // Si se está generando automáticamente
            ps.setInt(3, idCliente);
            ps.setInt(4, idEmpleado);
            ps.setDouble(5, totalVenta); // Se incluye el total de la venta
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idVenta = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error al insertar la venta: " + e.getMessage());
            e.printStackTrace(); // Esto te ayudará a ver la traza del error en la consola
        } finally {
            // Asegúrate de cerrar los recursos en el bloque finally
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("Error al cerrar PreparedStatement: " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close(); // Cierra la conexión
                } catch (SQLException e) {
                    System.out.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }

        return idVenta;
    }

    public void insertarDetalleVenta(Connection conn, int idVenta, int idProducto, int cantidad, double precioUnitario) throws SQLException {
        PreparedStatement ps = null;
        try {
            String sqlDetail = "INSERT INTO ventas_detalle (id_venta, id_producto, cantidad, precio_unitario) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sqlDetail);
            ps.setInt(1, idVenta);
            ps.setInt(2, idProducto);
            ps.setInt(3, cantidad);
            ps.setDouble(4, precioUnitario);
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
        }
    }
}

    