/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import src.db.PropertiesDB;
import src.entities.Properties;

/**
 *
 * @author Thaynara Silva
 */
public class DeleteProperty extends HttpServlet {

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
        int propertyId;
        Properties property = null;
        
        try {
            propertyId = Integer.parseInt(request.getParameter("propertyId"));
            property = PropertiesDB.getPropertyByID(propertyId);
            
            String dirPath = this.getServletContext().getRealPath("assets/images/properties/large/"+property.getListingNum());
            String filePath = dirPath.replace("\\build", "");
            File[] files = new File(filePath).listFiles();
            
            for(File f : files){
                if(f.isFile()){
                    f.delete();
                }
            }
            
            FileUtils.deleteDirectory(new File(filePath));
            
            String thumbDirPath = this.getServletContext().getRealPath("assets/images/properties/thumbs");
            String thumbFilePath = thumbDirPath.replace("\\build", "");
            File file = new File(thumbFilePath,String.valueOf(property.getListingNum())+".jpg");
            file.delete();
            
            PropertiesDB.deleteProperty(property);
            
            address = "LoadAdminProperties";
        } catch (Exception ex) {
            address = "/500.jsp";
        } 
        
        response.sendRedirect(address);
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
