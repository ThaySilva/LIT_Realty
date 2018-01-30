/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.db.AdministratorsDB;
import src.db.AgentsDB;
import src.db.UserrolesDB;
import src.entities.Administrators;
import src.entities.Agents;
import src.entities.Userroles;

/**
 *
 * @author Thaynara Silva
 */
public class EditProfile extends HttpServlet {

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

        String address;
        HttpSession session = request.getSession();
        Userroles role = null;
        Administrators admin = null;
        Agents agent = null;
        
        try{
            int id = (int) session.getAttribute("userId");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String fax = request.getParameter("fax");
            
            role = UserrolesDB.getUserRoleByID(id);
            switch(role.getRole()){
                case "admin":
                    admin = AdministratorsDB.getAdminByID(id);
                    admin.setName(name);
                    admin.setPhone(phone);
                    admin.setEmail(email);
                    admin.setFax(fax);
                    AdministratorsDB.updateAdminDetails(admin);
                    break;
                case "agent":
                    agent = AgentsDB.getAgentByID(id);
                    agent.setName(name);
                    agent.setPhone(phone);
                    agent.setEmail(email);
                    agent.setFax(fax);
                    AgentsDB.updateAgentDetails(agent);
                    break;
                default:
                    break;
            }
            
            
            address = "LoadProfile?edit=false";
        } catch (Exception ex) {
            address = "error.jsp";
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
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
