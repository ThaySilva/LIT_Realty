/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.db.VendorsDB;
import src.entities.Vendors;

/**
 *
 * @author Thaynara Silva
 */
public class AddVendors extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String uploadPath;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String address;
        
        try{
            String path = "assets/images/vendors";
            String filePath = this.getServletContext().getRealPath(path);
            uploadPath = filePath.replace("\\build", "");
            
            try {
                MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);
                Part part;
                
                String fileName;
                int newId = VendorsDB.GetVendorID();
                Vendors vendor = new Vendors(newId);
                
                while((part = parser.readNextPart()) != null){
                    if(part.isFile()){
                        FilePart filePart = (FilePart) part;
                        String name = filePart.getFileName();
                        if(name != null){
                            long fileSize = filePart.writeTo(new File(uploadPath,String.valueOf(vendor.getVendorID())+".jpg"));
                        }
                    }else if(part.isParam()){
                        ParamPart paramPart = (ParamPart) part;
                        String name = paramPart.getName();
                        String value = paramPart.getStringValue();
                        
                        setVendorDetails(vendor,name,value);
                    }
                }
                
                VendorsDB.addVendor(vendor);
            } catch (java.io.IOException ioEx) {
                System.out.println(ioEx);
            }
            address = "LoadVendors";
        } catch (Exception ex) {
            address = "/500.jsp";
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
    
    protected Vendors setVendorDetails(Vendors vendor, String name, String value){
        switch(name){
            case "name":
                vendor.setName(value);
                break;
            case "phone":
                vendor.setPhone(value);
                break;
            case "address":
                vendor.setAddress(value);
                break;
            case "county":
                vendor.setCounty(value);
                break;
            case "email":
                vendor.setEmail(value);
                break;
            default:
                break;
        }
        return vendor;
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
