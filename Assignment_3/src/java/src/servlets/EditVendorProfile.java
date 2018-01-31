/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.db.PropertiesHasVendorsAndAgentsDB;
import src.db.VendorsDB;
import src.entities.Vendors;

/**
 *
 * @author Thaynara Silva
 */
public class EditVendorProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String deletePath;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String address;
        Vendors vendor = null;
        
        try {
            String path = "assets/images/vendors";
            String filePath = this.getServletContext().getRealPath(path);
            deletePath = filePath.replace("\\build", "");
            
            int id = Integer.parseInt(request.getParameter("vendorId"));
            String function = request.getParameter("function");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String vendorAddress = request.getParameter("address");
            String county = request.getParameter("county");
            String email = request.getParameter("email");
            vendor = VendorsDB.getVendorByID(id);
            
            switch(function){
                case "edit":
                    vendor.setName(name);
                    vendor.setPhone(phone);
                    vendor.setAddress(vendorAddress);
                    vendor.setCounty(county);
                    vendor.setEmail(email);
                    VendorsDB.updateVendorDetails(vendor);
                    address = "LoadVendorsProfile?edit=false"; 
                    break;
                case "delete":
                    int size = PropertiesHasVendorsAndAgentsDB.getVendorsPropertiesId(id).size();
                    if(size>0){
                        request.setAttribute("message", true);
                    } else {
                        VendorsDB.deleteVendor(vendor);
                        File file = new File(deletePath,String.valueOf(vendor.getVendorID())+".jpg");
                        file.delete();
                        request.setAttribute("deleteMessage", true);
                    }
                    address = "LoadVendors";
                    request.setAttribute("vendorName", vendor.getName());
                    break;
                default:
                    address = "error.jsp";
                    break;
            }

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
