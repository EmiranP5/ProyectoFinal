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

public class Cliente extends Persona{
    private String correo, fecha_registro;
    private int id_genero, id_cliente;
    private Conexion cn;

    
    // Constructor por defecto
    public Cliente() {
        // Inicializar la conexión aquí
        cn = new Conexion();  // Ahora cn no será null
    }

    
    // Constructor sobrecargado
    public Cliente(String correo, String fecha_registro, int id_genero, String nombres, String apellidos, String nit, String telefono) {
        super(nombres, apellidos, nit, telefono);
        this.correo = correo;
        this.fecha_registro = fecha_registro;
        this.id_genero = id_genero;
        this.cn = new Conexion(); // Inicializa la conexión aquí también
    }

    public Cliente(String correo, String fecha_registro, int id_genero, int id_cliente, String nombres, String apellidos, String nit, String telefono) {
        super(nombres, apellidos, nit, telefono);
        this.correo = correo;
        this.fecha_registro = fecha_registro;
        this.id_genero = id_genero;
        this.id_cliente = id_cliente;
    }

    public Cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
    
    
    
    

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public int getId_genero() {
        return id_genero;
    }

    public void setId_genero(int id_genero) {
        this.id_genero = id_genero;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT c.id_cliente AS id, c.nombres, c.apellidos, c.nit, g.nombre_genero, c.telefono, c.correo_electronico, c.fecha_registro, g.id_genero FROM clientes AS c INNER JOIN generos AS g ON c.id_genero = g.id_genero WHERE c.estado = 'activo';";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id", "nombres", "apellidos", "nit", "genero", "telefono", "correo", "fecha registro", "id_genero"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[9];
            while(consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombres");
                datos[2] = consulta.getString("apellidos");
                datos[3] = consulta.getString("nit");
                datos[4] = consulta.getString("nombre_genero");
                datos[5] = consulta.getString("telefono");
                datos[6] = consulta.getString("correo_electronico");
                datos[7] = consulta.getString("fecha_registro");
                datos[8] = consulta.getString("id_genero");

                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(Exception ex){
            System.out.println("Error...." + ex.getMessage());
        } 
        return tabla;
    }
    
  
    @Override
    public int agregar(){
        int retorno = 0;
        try{           
            cn = new Conexion();
            PreparedStatement parametro;
            
            String query = "INSERT INTO clientes (nombres, apellidos, nit, id_genero, telefono, correo_electronico, fecha_registro) VALUES (?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNombres());
            parametro.setString(2, getApellidos());
            parametro.setString(3, getNit());
            parametro.setInt(4, getId_genero());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreo());
            parametro.setString(7, getFecha_registro());
            
            retorno = parametro.executeUpdate();
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("Error..." + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
    @Override
    public int modificar(){
        int retorno = 0;
        try{           
            cn = new Conexion();
            PreparedStatement parametro;
            
            String query = "UPDATE clientes SET nombres = ?, apellidos = ?, nit = ?, id_genero = ?, telefono = ?, correo_electronico = ?, fecha_registro = ? WHERE id_cliente = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNombres());
            parametro.setString(2, getApellidos());
            parametro.setString(3, getNit());
            parametro.setInt(4, getId_genero());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreo());
            parametro.setString(7, getFecha_registro());
            parametro.setInt(8, getId_cliente());

            retorno = parametro.executeUpdate();
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("Error..." + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    
    @Override
    public int eliminar(){
        int retorno = 0;
        try{           
            cn = new Conexion();
            PreparedStatement parametro;
            
            String query = "UPDATE clientes SET estado = ? WHERE id_cliente = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, ("inactivo"));
            parametro.setInt(2, getId_cliente());

            retorno = parametro.executeUpdate();
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("Error..." + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

}
