/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;  // Asegúrate de que este paquete coincida con el tuyo

public class TestConexion {

    public static void main(String[] args) {
        conexion cn = new conexion();
        cn.abrir_conexion();  // Intenta abrir la conexión

        if (cn.conexionBD != null) {
            System.out.println("Conexión exitosa!");  // Si la conexión es exitosa
        } else {
            System.out.println("Conexión fallida!");  // Si la conexión falla
        }

        cn.cerrar_conexion();  // Cierra la conexión
    }
}
