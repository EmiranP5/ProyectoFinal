/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

public class Venta {
    private int id_venta;
    private int no_factura;
    private String serie;
    private String fecha_factura;
    private int id_cliente;
    private int id_empleado;

    public Venta(int id_venta, int no_factura, String serie, String fecha_factura, int id_cliente, int id_empleado) {
        this.id_venta = id_venta;
        this.no_factura = no_factura;
        this.serie = serie;
        this.fecha_factura = fecha_factura;
        this.id_cliente = id_cliente;
        this.id_empleado = id_empleado;
    }

    public Venta() {
    }

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
    
        public HashMap<String, String> drop_nombre_cliente() {
        HashMap<String, String> drop = new HashMap<>();
        try {
            Conexion cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT id_cliente, CONCAT(nombres, ' ', apellidos) AS nombre_completo FROM clientes;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                drop.put(consulta.getString("id_cliente"), consulta.getString("nombre_completo"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error..." + ex.getMessage());
        }
        return drop;
    }

    public void insertarVenta() {
        try {
            // Abre la conexión a la base de datos
            Conexion cn = new Conexion();
            cn.abrir_conexion();

            // Define la consulta SQL para insertar la venta
            String query = "INSERT INTO ventas (no_factura, serie, fecha_factura, id_cliente, id_empleado) VALUES (?, ?, ?, ?, ?)";

            // Prepara la sentencia
            PreparedStatement pst = cn.conexionBD.prepareStatement(query);
            pst.setInt(1, this.no_factura);
            pst.setString(2, this.serie);
            pst.setString(3, this.fecha_factura);
            pst.setInt(4, this.id_cliente);
            pst.setInt(5, this.id_empleado);

            // Ejecuta la inserción
            pst.executeUpdate();

            // Cierra la conexión
            pst.close();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error al insertar la venta: " + ex.getMessage());
        }
    }

}
