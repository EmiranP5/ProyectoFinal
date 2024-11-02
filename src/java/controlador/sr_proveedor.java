/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Proveedor;

/**
 *
 * @author felix
 */
public class sr_proveedor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Proveedor proveedor;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_proveedor</title>");
            out.println("</head>");
            out.println("<body>");
            // out.println("<h1>Servlet sr_empleado at " + request.getContextPath() + "</h1>");
           // Botón agregar
           if("agregar".equals(request.getParameter("btn_agregar"))){
               // Creamos el objeto proveedores con los datos del formulario
               proveedor = new Proveedor();
               proveedor.setProveedor(request.getParameter("txt_proveedor"));
               proveedor.setNit(request.getParameter("txt_nit"));
               proveedor.setDireccion(request.getParameter("txt_direccion"));
               proveedor.setTelefono(request.getParameter("txt_telefono"));
               
               
               // Llamamos al método agregar
               if(proveedor.agregar() > 0){
                   response.sendRedirect("index.jsp");
               } else {
                   out.println("<h1>Error al agregar proveedor</h1>");
                   out.println("<a href='index.jsp'>Regresar</a>");
               }
           } 
           
           // Botón modificar
           if("modificar".equals(request.getParameter("btn_modificar"))){
               // Creamos el objeto proveedor con los datos para modificar
               proveedor = new Proveedor();
               proveedor.setIdProveedor(Integer.valueOf(request.getParameter("txt_id"))); // ID de la proveedor a modificar
               proveedor.setProveedor(request.getParameter("txt_proveedor")); // Nuevo nombre de la proveedor
               proveedor.setNit(request.getParameter("txt_nit"));
               proveedor.setDireccion(request.getParameter("txt_direccion"));
               proveedor.setTelefono(request.getParameter("txt_telefono"));
               
               // Llamamos al método modificar
               if(proveedor.modificar() > 0){
                   response.sendRedirect("index.jsp");
               } else {
                   out.println("<h1>Error al modificar proveedor</h1>");
                   out.println("<a href='index.jsp'>Regresar</a>");
               }
           }
           
           // Botón eliminar
           if("eliminar".equals(request.getParameter("btn_eliminar"))){
               // Creamos el objeto proveedor con el ID para eliminar
               proveedor = new Proveedor();
               proveedor.setIdProveedor(Integer.valueOf(request.getParameter("txt_id"))); // ID de la proveedor a eliminar
               
               // Llamamos al método eliminar
               if(proveedor.eliminar() > 0){
                   response.sendRedirect("index.jsp");
               } else {
                   out.println("<h1>Error al eliminar proveedor</h1>");
                   out.println("<a href='index.jsp'>Regresar</a>");
               }
           }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
