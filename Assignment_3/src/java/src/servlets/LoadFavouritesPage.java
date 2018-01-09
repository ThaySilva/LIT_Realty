/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.db.AgentsDB;
import src.db.PropertiesDB;
import src.entities.Agents;
import src.entities.Properties;

/**
 *
 * @author Thaynara Silva
 */
public class LoadFavouritesPage extends HttpServlet {

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
        List<Properties> properties = new ArrayList<>();
        Properties p = null;
        
        try {
            List<Properties> mostPopular = PropertiesDB.getMostPopular();
            List<Agents> agents = AgentsDB.getAll();
            Cookie[] cookies = request.getCookies();
            String cookieName = "JSESSIONID";
            for(int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if(!cookieName.equals(c.getName())){
                    p = PropertiesDB.getPropertyByID(Integer.parseInt(c.getValue()));
                    properties.add(p);
                }
            }
            
            address = "/favourites.jsp";
            request.setAttribute("mostPopular", mostPopular);
            request.setAttribute("properties", properties);
            if(properties.isEmpty()){
                request.setAttribute("message", true);
            }
            request.setAttribute("agents", agents);
        } catch (Exception ex) {
            address = "/error.jsp";
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
