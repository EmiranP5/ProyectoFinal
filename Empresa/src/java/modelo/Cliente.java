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
    private int id_genero, estado;
    private Conexion cn;

    
    // Constructor por defecto
    public Cliente() {
        // Inicializar la conexión aquí
        cn = new Conexion();  // Ahora cn no será null
    }

    // Constructor sobrecargado
    public Cliente(String correo, String fecha_registro, int id_genero, String nombres, String apellidos, String nit, String direccion, String telefono) {
        super(nombres, apellidos, nit, direccion, telefono);
        this.correo = correo;
        this.fecha_registro = fecha_registro;
        this.id_genero = id_genero;
        this.cn = new Conexion(); // Inicializa la conexión aquí también
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

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}
