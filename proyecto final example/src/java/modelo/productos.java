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
public class productos{
    private int idProductos;
    private String producto;
    private int idMarca;
    private String descripcion;
    private String imagen;
    private Double precio_costo;
    private Double precio_venta;
    private int existencia;
    private String fechainicio;
    
    
    
    public Conexion cn;
    
    public productos(){}

    public productos(int idProductos, String producto, int idMarca, String descripcion, String imagen, Double precio_costo, Double precio_venta, int existencia, String fechainicio) {
        this.idProductos = idProductos;
        this.producto = producto;
        this.idMarca = idMarca;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
        this.existencia = existencia;
        this.fechainicio = fechainicio;
    }

    public int getIdProductos() {
        return idProductos;
    }

    public void setIdProductos(int idProductos) {
        this.idProductos = idProductos;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Double getPrecio_costo() {
        return precio_costo;
    }

    public void setPrecio_costo(Double precio_costo) {
        this.precio_costo = precio_costo;
    }

    public Double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(Double precio_venta) {
        this.precio_venta = precio_venta;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(String fechainicio) {
        this.fechainicio = fechainicio;
    }

    
    
    
    
    public DefaultTableModel leer(){
    DefaultTableModel  tabla = new DefaultTableModel();
    try{
      cn = new Conexion();
      cn.abrir_conexion();
        String query;
        query = "SELECT productos.idProductos, productos.producto, productos.idMarca, productos.descripcion, productos.Imagen, productos.precio_costo, productos.precio_venta, productos.existencia, productos.fecha_ingreso FROM proyecto_db.productos inner join marcas on productos.idMarca = marcas.idMarca;";
        
        
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"idProductos","producto","idMarca","descripcion","Imagen","precio_costo", "precio_venta","existencia","fecha_ingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[9];
      while (consulta.next()){
          datos[0] = consulta.getString("idProductos");
          datos[1] = consulta.getString("producto");
          datos[2] = consulta.getString("idMarca");
          datos[3] = consulta.getString("descripcion");
          datos[4] = consulta.getString("Imagen");
          datos[5] = consulta.getString("precio_costo");
          datos[6] = consulta.getString("precio_venta");
          datos[7] = consulta.getString("existencia");
          datos[8] = consulta.getString("fecha_ingreso");
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
         String query="INSERT INTO proyecto_db.productos(idProductos,producto,idMarca,descripcion,Imagen,precio_costo,precio_venta,existencia,fecha_ingreso)VALUES(?,?,?,?,?,?,?,?,?);";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1, getIdProductos());
          parametro.setString(2, getProducto());
          parametro.setInt(3, getIdMarca());
          parametro.setString(4, getDescripcion());
          parametro.setString(5, getImagen());
          parametro.setDouble(6,getPrecio_costo());
          parametro.setDouble(7,getPrecio_venta());
          parametro.setInt(8, getExistencia());
          parametro.setString(9, getFechainicio());
          
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
         String query="UPDATE proyecto_db.productos SET idProductos = ?,producto = ?,idMarca = ?,descripcion = ?,Imagen =?,precio_costo = ?,precio_venta = ?,existencia = ?,fecha_ingreso =? WHERE idProductos = ?;" ;   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
         
          parametro.setInt(1, getIdProductos());
          parametro.setString(2, getProducto());
          parametro.setInt(3, getIdMarca());
          parametro.setString(4, getDescripcion());
          parametro.setString(5, getImagen());
          parametro.setDouble(6,getPrecio_costo());
          parametro.setDouble(7,getPrecio_venta());
          parametro.setInt(8, getExistencia());
          parametro.setString(9, getFechainicio());
          parametro.setInt(10, getIdProductos());
          
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
         String query="delete from productos where idProductos = ?;";   
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
          parametro.setInt(1,getIdProductos());
          retorno = parametro.executeUpdate();
         cn.cerrar_conexion();
     }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }
 return retorno;   
}
          
 
        
    
    
}
