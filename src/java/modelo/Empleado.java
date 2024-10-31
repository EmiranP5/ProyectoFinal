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

/**
 *
 * @author esteban
 */
    public class Empleado extends people {
    private String codigo;
    private int id_puesto;
    private Conexion cn; 

    public Empleado() {}
    
    
    public Empleado( String codigo, int id_puesto,int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.codigo = codigo;
        this.id_puesto = id_puesto;  
    }
    
    public String getCodigo() {return codigo;}
    public void setCodigo(String codigo) {this.codigo = codigo;}

    public int getId_puesto() {return id_puesto;}
    public void setId_puesto(int id_puesto) {this.id_puesto = id_puesto;}
    
    
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
    try{
        cn = new Conexion();
        cn.abrir_conexion();
        String query = "SELECT e.id_empleado AS id, e.nombres, e.apellidos, e.direccion, e.telefono, e.dpi, e.genero, e.fecha_nacimiento, e.fecha_inicio_labores, e.fecha_ingreso, p.puesto, p.id_puesto FROM empleados AS e INNER JOIN puestos AS p ON e.id_puesto = p.id_puesto;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado[] = {"Id","Codigo","Nombres","Apellidos","Direccion","Telefono","Nacimiento","Puestos","Id_puestos"};
        tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String[9];
        while(consulta.next()){
            datos[0] = consulta.getString("id");
            datos[1] = consulta.getString("codigo");
            datos[2] = consulta.getString("nombres");
            datos[3] = consulta.getString("apellidos");
            datos[4] = consulta.getString("direccion");
            datos[5] = consulta.getString("telefono");
            datos[6] = consulta.getString("fecha_nacimiento");
            datos[7] = consulta.getString("puesto");
            datos[8] = consulta.getString("id_puestos");
            tabla.addRow(datos);
        
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    return tabla;
    }
    @Override
    public int agregar (){
        int retorno = 0;
    try { 
        PreparedStatement parametro;
        cn = new Conexion();
        String query = "INSERT INTO empleados (codigo, nombres, apellidos, direccion, telefono, fecha_nacimiento, id_puestos) VALUES (?, ?, ?, ?, ?, ?, ?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        
        parametro.setString(1, getCodigo());
        parametro.setString(2, getNombres());
        parametro.setString(3, getApellidos());
        parametro.setString(4, getDireccion());
        parametro.setString(5, getTelefono());
        parametro.setString(6, getFecha_nacimiento());
        parametro.setInt(7, getId_puesto());
        // Ejecutar la actualización antes de cerrar la conexión
        retorno = parametro.executeUpdate();
        // Ahora cerrar la conexión
        cn.cerrar_conexion();
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        retorno = 0;
    }
    return retorno;

    }
    
    @Override
     public int modificar (){
        int retorno = 0;
    try { 
        PreparedStatement parametro;
        cn = new Conexion();
        String query = "update empleados set codigo=? , nombres=?, apellidos=?, direccion=?, telefono=?, fecha_nacimiento=? id_puestos=? where id_empleados =? ;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        
        parametro.setString(1, getCodigo());
        parametro.setString(2, getNombres());
        parametro.setString(3, getApellidos());
        parametro.setString(4, getDireccion());
        parametro.setString(5, getTelefono());
        parametro.setString(6, getFecha_nacimiento());
        parametro.setInt(7, getId_puesto());
        parametro.setInt(8, getId());
        retorno = parametro.executeUpdate();
        // Ahora cerrar la conexión
        cn.cerrar_conexion();
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        retorno = 0;
    }
    return retorno;

    }
    @Override
          public int eliminar (){
        int retorno = 0;
    try { 
        PreparedStatement parametro;
        cn = new Conexion();
        String query = "delete from empleados  where id_empleados =? ;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setInt(1, getId());
        retorno = parametro.executeUpdate();
        // Ahora cerrar la conexión
        cn.cerrar_conexion();
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        retorno = 0;
    }
    return retorno;

    }
    
}