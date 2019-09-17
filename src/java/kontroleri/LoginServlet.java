/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroleri;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        
        ArrayList mailList = Usluge.getGeneric("proba2", 5, false);
        String loz = request.getParameter("password");
        String mail = request.getParameter("email");
        String link = Usluge.getLink(mail);
        String komentar="";
        boolean isMailOk = false; 
        for(int i=0; i<mailList.size();i++)
            if(mailList.get(i).equals(mail))
          { isMailOk=true;
            break;
            }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

       RequestDispatcher rd;
       request.setAttribute("mail", mail);
       request.setAttribute("pw", loz);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");  
            
            if(loz.equals(Usluge.vratiPw(mail))){
            HttpSession session = request.getSession(true);
            session.setAttribute("link", link);
            session.setAttribute("mail", mail);
            rd = request.getRequestDispatcher("movement.jsp");
            }else{
                if(isMailOk) komentar = "Uneli ste pogrešnu lozinku. Pokušajte ponovo. ";
                else  komentar = "Uneli ste pogrešan e-mail. Pokušajte ponovo. ";
                request.setAttribute("komentar", komentar);
                rd = request.getRequestDispatcher("prijava.jsp");
            }
        
            rd.forward(request, response);
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

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
