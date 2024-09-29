/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;


/**
 *
 * @author augus
 */
public class puestos {
    private int id_puesto;
    private String puesto;
    private Conexion cn;
    
    public puestos(){}

    public puestos(int id_puesto, String puesto) {
        this.id_puesto = id_puesto;
        this.puesto = puesto;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }
    
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query;
            query = "Select idPuesto as id, puestos from puestos;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"idPuesto","puesto"};
            tabla.setColumnIdentifiers(encabezado);
            String datos [] = new String[3];
            while (consulta.next()){
                datos[0] = consulta.getString("idPuesto");
                datos[1] = consulta.getString("Puestos");
                tabla.addRow(datos);
            }
                
            cn.cerrar_conexion();
            
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
            
        }
        
        return tabla;
    }
   
    /**
     *
     * @return 
     */
    public int agregar(){
        int retorno  =0;
     try {
         PreparedStatement parametro;
         cn = new Conexion();
         String query="INSERT INTO proyecempre.puestos(idPuesto,puestos)VALUES(?,?);";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1, getId_puesto());
          parametro.setString(2, getPuesto());
        
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
         String query="UPDATE proyecempre.puestos SET idPuesto = ?, puestos = ? WHERE idPuesto = ?;" ;   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
         parametro.setInt(1, getId_puesto());          
         parametro.setString(2, getPuesto());
         parametro.setInt(3, getId_puesto());
          
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
         String query="delete from puestos where idPuesto = ?;";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1,getId_puesto());
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}   
}