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
import model.Usluge;

/**
 *
 * @author Srki
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        
        ArrayList pokreti = Usluge.getGeneric("pokret", 2, false);
        //sve nazive pokreta stavlja u ArrayList
        
        String fName,lName, mail, pw ,phone, pref, gender, date, jmbg, okrug,opstina,adresa,obrazovanje,profesija,pokret;
        
        fName = request.getParameter("fName");
        lName = request.getParameter("lName");
        mail = request.getParameter("mail");
        pw = request.getParameter("pw");
        phone = request.getParameter("phone");
        pref = request.getParameter("pref");
        gender = request.getParameter("gender");
        date = request.getParameter("date");
        jmbg = request.getParameter("jmbg");
        okrug = request.getParameter("okrug");
        opstina = request.getParameter("opstina");
        adresa = request.getParameter("adresa");
        obrazovanje= request.getParameter("obrazovanje");
        profesija = request.getParameter("profesija");
        pokret = request.getParameter("pokret");
       
        if(date.equals("null"))date="1111-11-11";
        
        int intPokret = Integer.valueOf(pokret);
        //broj pokreta postaje jednaka vrednosi pokret atributa
        intPokret++;//povecava se
        String pok = (pokreti.get(intPokret)).toString();
        // promenljiva pok postaje   ---- pokreti.(get(pokretAtribut++)).toString();
                                                        //arrayLista krece od nule, a  pokretId od 1;
        String gen = "";
        String reg= "registrovan(a)!";
        if(gender.equals("M")){
            reg="registrovan";
            gen="Poštovani ";
        }
        if(gender.equals("Ž")){
            reg="registrovana";
            gen="Poštovana ";
        } 
        
        RequestDispatcher rd;
        if(Usluge.slobodanMail(mail))
        {
            Usluge.unesiProbno("null,'"+fName+"','"+lName+"','"+date+"','"+mail+"','"+phone+"','"+pref+"','"+gender+"','"
                                +adresa+"','"+jmbg+"','"+opstina+"',"+okrug+","+obrazovanje+","+profesija+","+pokret+",'"+pw+"'");
            request.setAttribute("pozdrav1", gen+"<strong>"+fName+" "+lName+ "</strong>"+"<em>- uspešno je "+reg+"!</em>");
            request.setAttribute("pozdrav2", "<em>Hvala na podršci - Vaš "+ "<strong>"+pok+"</strong></em>");
            rd = request.getRequestDispatcher("prijava.jsp");
        }
            else{
          
            request.setAttribute("komentar", " Navedena e-mail adresa je već upotrebljena. ");
            request.setAttribute("komentar2", "Da biste povratili svoj nalog pratite <a href=\"ideja.html\">link.</a> ");
            request.setAttribute("mail",mail);
            request.setAttribute("fName", fName);
            request.setAttribute("lname", lName);
            request.setAttribute("phone", phone);
            request.setAttribute("pokret", pokret);
            request.setAttribute("profesija",profesija);
            request.setAttribute("obrazovanje", obrazovanje);
            request.setAttribute("okrug", okrug);
            request.setAttribute("opstina", opstina);
            request.setAttribute("adresa", adresa);
            request.setAttribute("gender", gender);
            request.setAttribute("pref", pref);  
            rd = request.getRequestDispatcher("registracija.jsp");
        }
        
        rd.forward(request, response);
        try (PrintWriter out = response.getWriter()) {
  
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
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
