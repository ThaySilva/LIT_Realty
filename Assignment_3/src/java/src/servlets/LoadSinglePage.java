/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.db.AgentsDB;
import src.db.GaragetypesDB;
import src.db.PropertiesDB;
import src.db.PropertytypesDB;
import src.db.StylesDB;
import src.entities.Agents;
import src.entities.Garagetypes;
import src.entities.Properties;
import src.entities.Propertytypes;
import src.entities.Styles;

/**
 *
 * @author Thaynara Silva
 */
public class LoadSinglePage extends HttpServlet {

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
        List<String> imgNames = new ArrayList<String>();
        
        try {
            int id = Integer.parseInt(request.getParameter("propertyId"));
            Properties property = PropertiesDB.getPropertyByID(id);
            Styles propertyStyle = StylesDB.getStyleByID(property.getStyleId());
            Propertytypes propertyType = PropertytypesDB.getTypeByID(property.getTypeId());
            Garagetypes propertyGarage = GaragetypesDB.getGarageByID(property.getGarageId());
            Agents propertyAgent = AgentsDB.getAgentByID(property.getAgentId());
            List<Properties> similarProperties = PropertiesDB.getSimilarProperties(property.getCity(), id);
            PropertiesDB.updatePropertiesViews(id);
            
            String propertyAddress = property.getStreet();
            propertyAddress = propertyAddress.replaceAll(", ", ",");
            propertyAddress = propertyAddress.replaceAll(" ","+");
            String city = property.getCity();
            city = city.replaceAll(" ", "");
            propertyAddress += "," + city;
            
            String path = "assets/images/properties/large/%s/";
            String filePath = String.format(path, property.getListingNum());
            String realPath = this.getServletContext().getRealPath(filePath);
            File[] files = new File(realPath).listFiles();
            
            for(File f : files){
                if(f.isFile()){
                    imgNames.add(f.getName());
                }
            }
            
            request.setAttribute("imageList", imgNames);
            request.setAttribute("property", property);
            request.setAttribute("propertyStyle", propertyStyle);
            request.setAttribute("propertyType", propertyType);
            request.setAttribute("propertyGarage", propertyGarage);
            request.setAttribute("propertyAgent", propertyAgent);
            request.setAttribute("similarProperties", similarProperties);
            request.setAttribute("propertyAddress", propertyAddress);
            address = "/single.jsp";
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
