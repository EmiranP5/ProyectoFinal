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
import java.util.HashMap;

/**
 *
 * @author augus
 */
public class marcas {
    private int idMarca;
    private String marca;

    
    
    
    public Conexion cn;
    
    public marcas(){}

    public marcas(int idMarca, String marca) {
        this.idMarca = idMarca;
        this.marca = marca;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public DefaultTableModel leer(){
    DefaultTableModel  tabla = new DefaultTableModel();
    try{
      cn = new Conexion();
      cn.abrir_conexion();
        String query;
        query = "SELECT idMarca as id, marca FROM marcas;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","marca"};
      tabla.setColumnIdentifiers(encabezado);
        String datos[] = new String[3];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("marca");
        
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
         String query="INSERT INTO proyecto_db.marcas(idMarca,marca)VALUES(?,?);";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1, getIdMarca());
          parametro.setString(2, getMarca());
        
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
         String query="UPDATE proyecto_db.marcas SET idMarca = ?,marca = ? WHERE idMarca = ?;" ;   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
         parametro.setInt(1, getIdMarca());         
         parametro.setString(2, getMarca());
         parametro.setInt(3, getIdMarca());
          
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
         String query="delete from marcas where idMarca = ?;";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1,getIdMarca());
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}   
 
 public HashMap drop_sangre(){
         HashMap<String,String> drop = new HashMap();
         try{
             cn = new Conexion();
             //SELECT idPuestos,puestos FROM puestos;
             String query= "SELECT idMarca as id, marca FROM marcas;";
             cn.abrir_conexion();
             ResultSet consulta =  cn.conexionBD.createStatement().executeQuery(query);
             while (consulta.next()){
                 drop.put(consulta.getString("id"), consulta.getString("marca"));
             }
             
             cn.cerrar_conexion();
             
         
         }catch (SQLException ex){
                 System.out.println(ex.getMessage());
         }
         return drop;
    }
 
 
}