package controlador;

import modelo.LogiaDao;
import modelo.usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class sr_login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Crear un objeto de usuario
        usuario usuario = new usuario(username, password);

        // Validar el login usando el LoginDao
        LogiaDao loginDao = new LogiaDao();
        boolean loginExitoso = loginDao.validar(usuario);

        // Si el login es exitoso
        if (loginExitoso) {
            // Crear una sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", username);
            response.sendRedirect("principal.jsp");
        } else {
            // Si falla, regresar al login con un mensaje de error
            request.setAttribute("errorMessage", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
        
    }
}

