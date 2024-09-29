/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
import java.sql.Connection;

/**
 *
 * @author augus
 */
public class proveedores {
    private int idProveedores;
    private String Proveedores;
    private String nit;
    private String direccion;
    private String telefono;

    
    
    
    public Conexion cn;
    
    public proveedores(){}

    public proveedores(int idProveedores, String Proveedores, String nit, String direccion, String telefono) {
        this.idProveedores = idProveedores;
        this.Proveedores = Proveedores;
        this.nit = nit;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    
    

  

    public int getIdProveedores() {
        return idProveedores;
    }

    public void setIdProveedores(int idProveedores) {
        this.idProveedores = idProveedores;
    }

    public String getProveedores() {
        return Proveedores;
    }

    public void setProveedores(String Proveedores) {
        this.Proveedores = Proveedores;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }


    public DefaultTableModel leer(){
    DefaultTableModel  tabla = new DefaultTableModel();
    try{
      cn = new Conexion();
      cn.abrir_conexion();
        String query;
        query = "SELECT idProveedores as id, proveedor, nit, direccion, telefono FROM proveedores;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","idProveedores", "proveedor","nit","direccion","telefono"};
      tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String[5];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("proveedor");
          datos[2] = consulta.getString("nit");
          datos[3] = consulta.getString("direccion");
          datos[4] = consulta.getString("telefono");
          
          tabla.addRow(datos);
          
      }
              
      cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        
    }
    
    
    return tabla;
}
   //se creo la funcion agregar
    public int agregar(){
        int retorno  =0;
     try {
         PreparedStatement parametro;
         cn = new Conexion();
         String query="INSERT INTO proyecto_db.proveedores(idProveedores,proveedor,nit,direccion,telefono)VALUES(?,?,?,?,?);";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1, getIdProveedores());
          parametro.setString(2, getProveedores());
          parametro.setString(3, getNit());
          parametro.setString(4, getDireccion());
          parametro.setString(5,getTelefono());
          
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}

    
    //se creo la funcion modificar 
    public int modificar(){
         int retorno  =0;
     try {
         PreparedStatement parametro;
         cn = new Conexion();
         String query="UPDATE proyecto_db.proveedores SET idProveedores = ?,proveedor = ?,nit = ?,direccion = ?,telefono = ? WHERE idProveedores = ?;" ;   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1, getIdProveedores());
          parametro.setString(2, getProveedores());
          parametro.setString(3, getNit());
          parametro.setString(4, getDireccion());
          parametro.setString(5,getTelefono());
          parametro.setInt(6, getIdProveedores());

          
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}
    
    
    //se creo la funcion eliminar
 public int eliminar (){
     int retorno  =0;
     try {
         PreparedStatement parametro;
         cn = new Conexion();
         String query="delete from proveedores where idProveedores = ?;";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1,getIdProveedores());
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}
          
 
        
    
    
}
