/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.DrawInterface;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.db.AdministratorsDB;
import src.db.AgentsDB;
import src.db.PropertiesDB;
import src.db.VendorsDB;
import src.entities.Administrators;
import src.entities.Agents;
import src.entities.Properties;
import src.entities.Vendors;

/**
 *
 * @author Thaynara Silva
 */
public class GenerateReport extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Font font1 = new Font(Font.FontFamily.TIMES_ROMAN,24,Font.BOLD);
    Font font2 = new Font(Font.FontFamily.TIMES_ROMAN,14,Font.NORMAL);
    Font font3 = new Font(Font.FontFamily.TIMES_ROMAN,18,Font.BOLD);
    String fileName = null;
    String today = null;
    Administrators admin = null;
    List<Properties> propertiesList = null;
    double totalPrice = 0.0;
    List<Agents> agentsList = null;
    List<Vendors> vendorsList = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date now = new Date();
        today = formatter.format(now);
        
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("userId");
        admin = AdministratorsDB.getAdminByID(id);
        
        propertiesList = PropertiesDB.getAllProperties();
        agentsList = AgentsDB.getAll();
        vendorsList = VendorsDB.getAllVendors();
        
        propertiesList.forEach((p) -> {
            totalPrice = totalPrice + p.getPrice();
        });
        
        ServletContext context = request.getSession().getServletContext();
        File temp = (File) context.getAttribute("javax.servlet.context.tempdir");
        String tempPath = temp.getAbsolutePath();
        
        String pdfName = "LIT_RealtyReport_" + String.valueOf(today) + ".pdf";
        
        fileName = tempPath+"/"+pdfName;
        
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control", "max-age=0");
        response.setHeader("Content-disposition","attachment;"+"filename="+pdfName);
        
        try {
            createPDF();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            InputStream inputStream = null;
            try{
                inputStream = new FileInputStream(fileName);
                byte[] buffer = new byte[1024];
                int read;
                while((read = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, read);
                }
            } catch (FileNotFoundException notFoundEx){
                System.out.println(notFoundEx);
            } catch (IOException ioEx) {
                System.out.println(ioEx);
            } finally {
                if(inputStream != null){
                    try {
                        inputStream.close();
                    } catch (IOException ioEx){
                        System.out.println(ioEx);
                    }
                }
            }
            OutputStream outStream = response.getOutputStream();
            outputStream.writeTo(outStream);
            outStream.flush();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        response.sendRedirect("LoadReportsPage");
    }
    
    protected void createPDF(){
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(fileName));
            document.open();
            addMetaData(document);
            addTitlePage(document);
            //addContent(document);
            document.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    protected void addMetaData(Document document){
        document.addTitle("LIT Realty Report " + String.valueOf(today));
        document.addSubject("PDF Report");
        document.addAuthor("LIT Realty");
        document.addCreator(admin.getName());
    }
    
    protected void addTitlePage(Document document) throws DocumentException {
        Paragraph preface = new Paragraph();
        String dirPath = this.getServletContext().getRealPath("assets/images");
        String imagePath = dirPath.replace("\\build", "");
        try {
            Image logo = Image.getInstance(imagePath+"/logo.gif");
            logo.setAbsolutePosition(150f, 700f);
            document.add(logo);
            preface.setSpacingBefore(150);
            preface.add(new Paragraph("Report generated by: " + admin.getName() + " on the date: " + today,font2));
            document.add(preface);
            document.add(Chunk.NEWLINE );
            document.add(Chunk.NEWLINE );
            document.add(new Paragraph("This report is a summary of the current status of the LIT Realty Database.",font2));
            
            document.add(Chunk.NEWLINE);
            PdfPTable price = new PdfPTable(4);
            Image euro = Image.getInstance(imagePath+"/icons/euro.png");
            PdfPCell cell1 = new PdfPCell(euro,false);
            cell1.setBorder(0);
            PdfPCell cell2 = new PdfPCell(new Paragraph("Total Properties Price",font3));
            cell2.setBorder(0);
            cell2.setVerticalAlignment(Element.ALIGN_CENTER);
            cell2.setColspan(2);
            PdfPCell cell3 = new PdfPCell(new Paragraph("€ "+String.valueOf(totalPrice),font3));
            cell3.setBorder(0);
            cell3.setVerticalAlignment(Element.ALIGN_CENTER);
            price.addCell(cell1);
            price.addCell(cell2);
            price.addCell(cell3);
            document.add(price);
            
            document.add(Chunk.NEWLINE);
            PdfPTable properties = new PdfPTable(4);
            Image house = Image.getInstance(imagePath+"/icons/house.png");
            PdfPCell cell4 = new PdfPCell(house,false);
            cell4.setBorder(0);
            PdfPCell cell5 = new PdfPCell(new Paragraph("Total Number Properties",font3));
            cell5.setBorder(0);
            cell5.setVerticalAlignment(Element.ALIGN_CENTER);
            cell5.setColspan(2);
            PdfPCell cell6 = new PdfPCell(new Paragraph(String.valueOf(propertiesList.size()),font3));
            cell6.setBorder(0);
            cell6.setVerticalAlignment(Element.ALIGN_CENTER);
            properties.addCell(cell4);
            properties.addCell(cell5);
            properties.addCell(cell6);
            document.add(properties);
            
            document.add(Chunk.NEWLINE);
            PdfPTable agents = new PdfPTable(4);
            Image users = Image.getInstance(imagePath+"/icons/users.png");
            PdfPCell cell7 = new PdfPCell(users,false);
            cell7.setBorder(0);
            PdfPCell cell8 = new PdfPCell(new Paragraph("Total Number Agents",font3));
            cell8.setBorder(0);
            cell8.setVerticalAlignment(Element.ALIGN_CENTER);
            cell8.setColspan(2);
            PdfPCell cell9 = new PdfPCell(new Paragraph(String.valueOf(agentsList.size()),font3));
            cell9.setBorder(0);
            cell9.setVerticalAlignment(Element.ALIGN_CENTER);
            agents.addCell(cell7);
            agents.addCell(cell8);
            agents.addCell(cell9);
            document.add(agents);
            
            document.add(Chunk.NEWLINE);
            PdfPTable vendors = new PdfPTable(4);
            PdfPCell cell10 = new PdfPCell(users,false);
            cell10.setBorder(0);
            PdfPCell cell11 = new PdfPCell(new Paragraph("Total Number Vendors",font3));
            cell11.setBorder(0);
            cell11.setVerticalAlignment(Element.ALIGN_CENTER);
            cell11.setColspan(2);
            PdfPCell cell12 = new PdfPCell(new Paragraph(String.valueOf(vendorsList.size()),font3));
            cell12.setBorder(0);
            cell12.setVerticalAlignment(Element.ALIGN_CENTER);
            vendors.addCell(cell10);
            vendors.addCell(cell11);
            vendors.addCell(cell12);
            document.add(vendors);
            
            document.newPage();
            
        } catch (Exception ex){
            System.out.println(ex);
        }
        
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
