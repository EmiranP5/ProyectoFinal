/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author felix
 */
public class Proveedor {
    private int idProveedor;
    private String proveedor;
    private String nit;
    private String direccion;
    private String telefono;
    private Conexion cn;

    public Proveedor() {}
    public Proveedor(int idProveedor, String proveedor, String nit, String direccion, String telefono) {
        this.idProveedor = idProveedor;
        this.proveedor = proveedor;
        this.nit = nit;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getIdProveedor() {return idProveedor;}
    public void setIdProveedor(int idProveedor) {this.idProveedor = idProveedor;}

    public String getProveedor() {return proveedor;}
    public void setProveedor(String proveedor) {this.proveedor = proveedor;}

    public String getNit() {return nit;}
    public void setNit(String nit) {this.nit = nit;}

    public String getDireccion() {return direccion;}
    public void setDireccion(String direccion) {this.direccion = direccion;}

    public String getTelefono() {return telefono;}
    public void setTelefono(String telefono) {this.telefono = telefono;}
    
    
  // Método para leer proveedores activos
    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT id_proveedor as id, proveedor, nit, direccion, telefono FROM proveedores WHERE estado = 1;"; // Solo muestra proveedores activos
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String[] encabezado = {"ID", "Proveedor", "NIT", "Dirección", "Teléfono"};
            tabla.setColumnIdentifiers(encabezado);
            String[] datos = new String[5];
            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("proveedor");
                datos[2] = consulta.getString("nit");
                datos[3] = consulta.getString("direccion");
                datos[4] = consulta.getString("telefono");
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return tabla;
    }

    // Método para agregar un nuevo proveedor
    public int agregar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO proveedores (proveedor, nit, direccion, telefono, estado) VALUES (?, ?, ?, ?, 1);"; // Estado activo por defecto
            cn.abrir_conexion();
            parametro = cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getProveedor());
            parametro.setString(2, this.getNit());
            parametro.setString(3, this.getDireccion());
            parametro.setString(4, this.getTelefono());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    // Método para modificar un proveedor existente
    public int modificar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE proveedores SET proveedor = ?, nit = ?, direccion = ?, telefono = ? WHERE idProveedores = ?;";
            cn.abrir_conexion();
            parametro = cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getProveedor());
            parametro.setString(2, this.getNit());
            parametro.setString(3, this.getDireccion());
            parametro.setString(4, this.getTelefono());
            parametro.setInt(5, this.getIdProveedor());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    // Método para eliminar un proveedor (cambiar el estado a inactivo)
    public int eliminar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE proveedores SET estado = 0 WHERE idProveedores = ?;"; // Cambiar el estado a inactivo
            cn.abrir_conexion();
            parametro = cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, this.getIdProveedor());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    // Método para llenar un HashMap con los proveedores (para uso en JComboBox, por ejemplo)
    public HashMap<String, String> drop_proveedores() {
        HashMap<String, String> drop = new HashMap<>();
        try {
            cn = new Conexion();
            String query = "SELECT id_proveedor as id, proveedor FROM proveedores WHERE estado = 1;"; // Solo muestra proveedores activos
            cn.abrir_conexion();
      
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("proveedor"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return drop;
    }  
}
