package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidar la sesión actual
        HttpSession session = request.getSession(false); // Evita crear una nueva sesión si no existe
        if (session != null) {
            session.invalidate(); // Cierra la sesión
        }
        // Redirige a la página de inicio de sesión
        response.sendRedirect("index.jsp");
    }
}
