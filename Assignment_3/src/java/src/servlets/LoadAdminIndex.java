/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import src.db.AdministratorsDB;
import src.db.AgentsDB;
import src.db.PropertiesDB;
import src.db.UsersDB;
import src.db.VendorsDB;
import src.entities.Administrators;
import src.entities.Agents;
import src.entities.Properties;
import src.entities.Users;
import src.entities.Vendors;

/**
 *
 * @author Thaynara Silva
 */
public class LoadAdminIndex extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        String address;
        Users thisUser = null;
        Agents agent = null;
        Administrators admin = null;
        List<Properties> properties = null;
        List<Vendors> vendors = null;

        try{
            Subject currentUser = SecurityUtils.getSubject();
            String username = currentUser.getPrincipal().toString();
            thisUser = UsersDB.getUserByUsername(username);
            if(currentUser.hasRole("agent")) {
                agent = AgentsDB.getAgentByID(thisUser.getUserID());
                properties = PropertiesDB.getFiveProperties(agent.getAgentId());
                vendors = VendorsDB.getFiveVendors(agent.getAgentId());
                session.setAttribute("userId", agent.getAgentId());
                request.setAttribute("user", agent);
            } else {
                admin = AdministratorsDB.getAdminByID(thisUser.getUserID());
                properties = PropertiesDB.getRandomFive();
                vendors = VendorsDB.getRandomFive();
                session.setAttribute("userId", admin.getAdminID());
                request.setAttribute("user", admin);
            }
            
            address = "/admin/adminIndex.jsp";
            request.setAttribute("properties", properties);
            request.setAttribute("vendors", vendors);
        } catch (Exception ex) {
            address = "/500.jsp";
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
