/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroleri;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usluge;

/**
 *
 * @author Srki
 */
@WebServlet(name = "SettingsServlet", urlPatterns = {"/SettingsServlet"})
public class SettingsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            RequestDispatcher rd;
            HttpSession session = request.getSession(false);
            String mail = (String) session.getAttribute("mail");
            int movement =  (int) Usluge.vratiPokret(mail);
            
            if(request.getParameter("selection")==null){
            session.setAttribute("movement",movement);
            }else if(movement==Integer.valueOf(request.getParameter("selection"))){
            session.setAttribute("msg", "Odabrali ste pokret u kome se već nalazite!");
            rd = request.getRequestDispatcher("settings.jsp");      
            }else{          
            int selection = Integer.valueOf(request.getParameter("selection"));
            Usluge.promeniPokret(selection, mail);
            session.setAttribute("msg", "Uspešno ste promenili pokret!");
            session.setAttribute("movement", selection);
            }
            rd = request.getRequestDispatcher("settings.jsp");
            rd.forward(request, response);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SettingsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingsServlet at " + request.getContextPath() + "</h1>");
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
