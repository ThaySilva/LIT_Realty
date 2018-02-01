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
public class EditProperty extends HttpServlet {

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
    private List<String> images = new ArrayList<>();
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String address;
        int propertyId = 0;
        Properties property = null;
        int fileNameNum = 0;
        
        try {
            propertyId = Integer.parseInt(request.getParameter("propertyId"));
            property = PropertiesDB.getPropertyByID(propertyId);
            
            String path = "assets/images/properties/large/%s/";
            String filePath = String.format(path, property.getListingNum());
            String realPath = this.getServletContext().getRealPath(filePath);
            File[] files = new File(realPath).listFiles();
            fileNameNum = files.length;
            
            String dirPath = this.getServletContext().getRealPath("assets/images/properties/large/"+property.getListingNum());
            uploadPath = dirPath.replace("\\build", "");
            File dir = new File(uploadPath);
            
            try {
                MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);
                Part part;
                
                while((part = parser.readNextPart()) != null){
                    if(part.isFile()){
                        FilePart filePart = (FilePart) part;
                        String name = filePart.getFileName();
                        if(name != null){
                            if(fileNameNum == 0){
                                long fileSize = filePart.writeTo(new File(uploadPath,String.valueOf(property.getListingNum())+".jpg"));
                            } else {
                                long fileSize = filePart.writeTo(new File(uploadPath,String.valueOf(property.getListingNum())+"-"+String.valueOf(fileNameNum)+".jpg"));
                            }
                            fileNameNum++;
                        }
                    } else if (part.isParam()){
                        ParamPart paramPart = (ParamPart) part;
                        String name = paramPart.getName();
                        String value = paramPart.getStringValue();
                        
                        setPropertyDetails(property,name,value);
                    }
                }
                
                if(images.size() > 0){
                    for(String name : images){
                        File file = new File(uploadPath,name);
                        file.delete();
                    }
                }
                
                PropertiesDB.updatePropertyDetails(property);
            } catch (java.io.IOException ioEx) {
                System.out.println(ioEx);
            }
            
            address = "LoadSingleProperty?propertyId="+propertyId;
        } catch (Exception ex) {
            address = "/500.jsp";
        }

        response.sendRedirect(address);
    }
    
    protected Properties setPropertyDetails(Properties property, String name, String value){
        switch(name){
            case "street":
                property.setStreet(value);
                break;
            case "city":
                property.setCity(value);
                break;
            case "price":
                property.setPrice(Double.parseDouble(value));
                break;
            case "description":
                property.setDescription(value);
                break;
            case "style":
                property.setStyleId(Integer.parseInt(value));
                break;
            case "type":
                property.setTypeId(Integer.parseInt(value));
                break;
            case "bedrooms":
                property.setBedrooms(Integer.parseInt(value));
                break;
            case "bathrooms":
                property.setBathrooms(Float.parseFloat(value));
                break;
            case "garageType":
                property.setGarageId(Integer.parseInt(value));
                break;
            case "garageSize":
                property.setGaragesize(Short.parseShort(value));
                break;
            case "squareFeet":
                property.setSquarefeet(Integer.parseInt(value));
                break;
            case "lotSize":
                property.setLotsize(value);
                break;
            case "vendor":
                property.setVendorId(Integer.parseInt(value));
                break;
            case "agent":
                property.setAgentId(Integer.parseInt(value));
                break;
            case "ber":
                property.setBerRating(value);
                break;
            case "images":
                images.add(value);
                break;
            default:
                break;
        }
        return property;
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
