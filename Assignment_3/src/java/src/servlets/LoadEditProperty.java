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
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.db.AdministratorsDB;
import src.db.AgentsDB;
import src.db.GaragetypesDB;
import src.db.PropertiesDB;
import src.db.PropertytypesDB;
import src.db.StylesDB;
import src.db.UserrolesDB;
import src.db.VendorsDB;
import src.entities.Administrators;
import src.entities.Agents;
import src.entities.Garagetypes;
import src.entities.Properties;
import src.entities.Propertytypes;
import src.entities.Styles;
import src.entities.Userroles;
import src.entities.Vendors;

/**
 *
 * @author Thaynara Silva
 */
public class LoadEditProperty extends HttpServlet {

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
        Properties property = null;
        List<Styles> stylesList = null;
        List<Propertytypes> typesList = null;
        List<Garagetypes> garageList = null;
        List<Vendors> vendorsList = null;
        List<Agents> agentsList = null;
        List<String> berRatings = Arrays.asList("A1","A2","A3","B1","B2","B3","C1","C2","C3","D1","D2","E1","E2","F","G","Exempt");
        List<String> imgNames = new ArrayList<String>();
        
        try {
            int propertyId = Integer.parseInt(request.getParameter("propertyId"));
            property = PropertiesDB.getPropertyByID(propertyId);
            stylesList = StylesDB.getAllStyles();
            typesList = PropertytypesDB.getAllTypes();
            garageList = GaragetypesDB.getAllGarageTypes();
            vendorsList = VendorsDB.getAllVendors();
            agentsList = AgentsDB.getAll();
            int id = (int) session.getAttribute("userId");
            role = UserrolesDB.getUserRoleByID(id);
            
            String path = "assets/images/properties/large/%s/";
            String filePath = String.format(path, property.getListingNum());
            String realPath = this.getServletContext().getRealPath(filePath);
            File[] files = new File(realPath).listFiles();
            
            for(File f : files){
                if(f.isFile()){
                    imgNames.add(f.getName());
                }
            }
            
            switch(role.getRole()){
                case "admin":
                    Administrators admin = AdministratorsDB.getAdminByID(id);
                    request.setAttribute("user", admin);
                    break;
                case "agent":
                    Agents agent = AgentsDB.getAgentByID(id);
                    request.setAttribute("user", agent);
                    break;
                default:
                    break;
            }
            
            address = "admin/editProperty.jsp";
            request.setAttribute("p", property);
            request.setAttribute("stylesList", stylesList);
            request.setAttribute("typesList", typesList);
            request.setAttribute("garageList", garageList);
            request.setAttribute("vendorsList", vendorsList);
            request.setAttribute("berRatings", berRatings);
            request.setAttribute("agentsList", agentsList);
            request.setAttribute("imageList", imgNames);
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
