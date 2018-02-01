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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.db.AgentsDB;
import src.db.PropertiesDB;
import src.db.PropertytypesDB;
import src.db.StylesDB;
import src.entities.Agents;
import src.entities.Properties;
import src.entities.Propertytypes;
import src.entities.Styles;

/**
 *
 * @author Thaynara Silva
 */
public class LoadIndexPage extends HttpServlet {

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
        
        try{
            Cookie[] cookies = request.getCookies();
            List<String> cityList = PropertiesDB.getAllCities();
            List<Styles> styleList = StylesDB.getAllStyles();
            List<Properties> recentList = PropertiesDB.getNewestAdded();
            List<Properties> propertyList = PropertiesDB.getRandomSeven();
            List<Agents> agentsList = AgentsDB.getAll();
            
            address = "/index.jsp";
            request.setAttribute("cookies", cookies);
            request.setAttribute("cityList", cityList);
            request.setAttribute("styleList", styleList);
            request.setAttribute("recentProperties", recentList);
            request.setAttribute("propertyList", propertyList);
            request.setAttribute("agents", agentsList);
        } catch (Exception ex) {
            address = "/500.jsp";
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
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
