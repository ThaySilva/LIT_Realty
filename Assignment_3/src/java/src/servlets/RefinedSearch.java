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
import src.db.PropertiesDB;
import src.db.StylesDB;
import src.entities.Properties;
import src.entities.Styles;

/**
 *
 * @author Thaynara Silva
 */
public class RefinedSearch extends HttpServlet {

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
        List<Properties> propertyList = null;
        
        try{
            address = "/gallery.jsp";
            List<String> cityList = PropertiesDB.getAllCities();
            List<Styles> propertyStyles = StylesDB.getAllStyles();
            List<Properties> mostPopular = PropertiesDB.getMostPopular();
            String city = request.getParameter("city");
            if(city.equals("")){city="All";}
            String style = request.getParameter("style");
            if(style.equals("")){style="All";}
            String priceRange = request.getParameter("priceRange");
            if(priceRange.equals("")){priceRange="All";}
            String footageRange = request.getParameter("footage");
            if(footageRange.equals("")){footageRange="All";}
            String bedrooms = request.getParameter("bedrooms");
            if(bedrooms.equals("")){bedrooms="All";}
            
            if(city.equals("All") && style.equals("All") && priceRange.equals("All") && footageRange.equals("All") && bedrooms.equals("All")){
                propertyList = PropertiesDB.getAllProperties();
            } else {
                propertyList = PropertiesDB.getPropertiesRefinedSearch(city, style, priceRange, footageRange, bedrooms);
            }
            
            request.setAttribute("cityList", cityList);
            request.setAttribute("propertyStyles", propertyStyles);
            request.setAttribute("mostPopular", mostPopular);
            request.setAttribute("propertyList", propertyList);
        } catch (Exception ex){
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
