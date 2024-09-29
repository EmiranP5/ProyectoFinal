/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author augus
 */
public class empleado extends persona{
    private int idEmpleados;
    private int id_puesto;
    private int DPI;
    private String genero;
    private String fecha_inicio_labores;
    private String fechainicio;
    
    
    
    public Conexion cn;
    
    public empleado(){}


    public empleado(int idEmpleados, int id_puesto, int DPI, String genero, String fecha_inicio_labores, String fechainicio, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.idEmpleados = idEmpleados;
        this.id_puesto = id_puesto;
        this.DPI = DPI;
        this.genero = genero;
        this.fecha_inicio_labores = fecha_inicio_labores;
        this.fechainicio = fechainicio;

    }

    
    

    public int getDPI() {
        return DPI;
    }

    public void setDPI(int DPI) {
        this.DPI = DPI;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    
    public String getFecha_inicio_labores() {
        return fecha_inicio_labores;
    }

    public void setFecha_inicio_labores(String fecha_inicio_labores) {
        this.fecha_inicio_labores = fecha_inicio_labores;
    }

    public String getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(String fechainicio) {
        this.fechainicio = fechainicio;
    }

    public int getIdEmpleados() {
        return idEmpleados;
    }

    public void setIdEmpleados(int idEmpleados) {
        this.idEmpleados = idEmpleados;
    }

  
    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }
    
    public DefaultTableModel leer(){
    DefaultTableModel  tabla = new DefaultTableModel();
    try{
      cn = new Conexion();
      cn.abrir_conexion();
        String query;
        query = "SELECT empleados.idEmpleados,empleados.nombres,empleados.apellidos,empleados.direccion,empleados.telefono,empleados.DPI,empleados.genero,empleados.fecha_nacimiento,empleados.idPuesto,empleados.fecha_inicio_labores,empleados.fechaingreso FROM proyecto_db.empleados inner join puestos on empleados.idPuesto = puestos.idPuesto;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"idEmpleados","nombres","apellidos","direccion","telefono","DPI", "genero","fecha_nacimiento","idPuesto","fecha_inicio_labores", "fechaingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[11];
      while (consulta.next()){
          datos[0] = consulta.getString("idEmpleados");
          datos[1] = consulta.getString("nombres");
          datos[2] = consulta.getString("apellidos");
          datos[3] = consulta.getString("direccion");
          datos[4] = consulta.getString("telefono");
          datos[5] = consulta.getString("DPI");
          datos[6] = consulta.getString("genero");
          datos[7] = consulta.getString("fecha_nacimiento");
          datos[8] = consulta.getString("idPuesto");
          datos[9] = consulta.getString("fecha_inicio_labores");
          datos[10] = consulta.getString("fechaingreso");
          tabla.addRow(datos);
          
      }
              
      cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        
    }
    
    
    return tabla;
}
   //se creo la funcion agregar
    @Override
    public int agregar(){
        int retorno  =0;
     try {
         PreparedStatement parametro;
         cn = new Conexion();
         //INSERT INTO `proyecto_db`.`empleados` (`idEmpleados`, `nombres`, `apellidos`, `direccion`, `telefono`, `DPI`, `genero`, `fecha_nacimiento`, `idPuesto`, `fecha_inicio_labores`, `fechaingreso`) 
         String query="INSERT INTO proyecto_db.empleados(idEmpleados,nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso)VALUES(?,?,?,?,?,?,?,?,?,?,?);";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1, getIdEmpleados());
          parametro.setString(2, getNombres());
          parametro.setString(3, getApellidos());
          parametro.setString(4, getDireccion());
          parametro.setString(5,getTelefono());
          parametro.setInt(6,getDPI());
          parametro.setString(7, getGenero());
          parametro.setString(8, getFecha_nacimiento());
          parametro.setInt(9,getId_puesto());
          parametro.setString(10, getFecha_inicio_labores());
          parametro.setString(11, getFechainicio());
          
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}
    //se creo la funcion modificar 
    @Override
    public int modificar(){
         int retorno  =0;
     try {
         PreparedStatement parametro;
         cn = new Conexion();
         String query="UPDATE proyecto_db.empleados SET idEmpleados = ?,nombres = ?,apellidos = ?,direccion = ?,telefono = ?,DPI = ?,genero = ?,fecha_nacimiento = ?,idPuesto = ?,fecha_inicio_labores = ?,fechaingreso = ? WHERE idEmpleados = ?;" ;   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          //parametro.setString(1, getIdEmpleados());
          //parametro.setInt(1, getIdEmpleados());
          parametro.setInt(1, getIdEmpleados());
          parametro.setString(2, getNombres());
          parametro.setString(3, getApellidos());
          parametro.setString(4, getDireccion());
          parametro.setString(5,getTelefono());
          parametro.setInt(6,getDPI());
          parametro.setString(7, getGenero());
          parametro.setString(8, getFecha_nacimiento());
          parametro.setInt(9,getId_puesto());
          parametro.setString(10, getFecha_inicio_labores());
          parametro.setString(11, getFechainicio());
          parametro.setInt(12, getIdEmpleados());
          
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}
    //se creo la funcion eliminar
    @Override
 public int eliminar (){
     int retorno  =0;
     try {
         PreparedStatement parametro;
         cn = new Conexion();
         String query="delete from empleados where idEmpleados = ?;";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1,getId());
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}
          
 
        
    
    
}
