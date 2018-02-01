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
import src.db.AdministratorsDB;
import src.db.AgentsDB;
import src.db.PropertiesDB;
import src.db.UserrolesDB;
import src.entities.Administrators;
import src.entities.Agents;
import src.entities.Properties;
import src.entities.Userroles;

/**
 *
 * @author Thaynara Silva
 */
public class LoadAdminProperties extends HttpServlet {

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
        Userroles role = null;
        List<Properties> propertiesList = null;
        
        try {
            int id = (int) session.getAttribute("userId");
            role = UserrolesDB.getUserRoleByID(id);
            switch(role.getRole()){
                case "admin":
                    Administrators admin = AdministratorsDB.getAdminByID(id);
                    propertiesList = PropertiesDB.getAllProperties();
                    request.setAttribute("user", admin);
                    break;
                case "agent":
                    Agents agent = AgentsDB.getAgentByID(id);
                    propertiesList = PropertiesDB.getPropertiesByAgent(id);
                    request.setAttribute("user", agent);
                    break;
                default:
                    break;
            }
            
            address = "admin/allProperties.jsp";
            request.setAttribute("propertyList", propertiesList);
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
