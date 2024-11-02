/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class Genero {

    private String genero;
    private int id_puesto;
    private Conexion cn;  
    
    public Genero(){}

    public Genero(String genero, int id_puesto) {
        this.genero = genero;
        this.id_puesto = id_puesto;
    }
    
    
    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public HashMap<String, String> drop_nombre_genero() {
        HashMap<String, String> drop = new HashMap<>();

        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT id_genero AS id, nombre_genero FROM generos;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("nombre_genero"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("Error..." + ex.getMessage());
        }
        return drop;
    }

    
}
