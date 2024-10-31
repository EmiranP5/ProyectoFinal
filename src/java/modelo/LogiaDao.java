package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LogiaDao {

    // Método para validar el login usando la base de datos
    public boolean validar(usuario usuario) {
        boolean estado = false;
        Conexion conexion = new Conexion();
        String sql = "SELECT * FROM usuarios WHERE nombre_usuario = ? AND contrasena = ?";
        
        try {
            // Abrir la conexión
            conexion.abrir_conexion();
            Connection conn = conexion.conexionBD;

            // Preparar la consulta SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getUsername());
            stmt.setString(2, usuario.getPassword());

            // Ejecutar la consulta
            ResultSet rs = stmt.executeQuery();
            
            // Verificar si hay un resultado
            if (rs.next()) {
                estado = true;  // El usuario y contraseña coinciden
            }

            // Cerrar la conexión
            conexion.cerrar_conexion();

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return estado;
    }
}
