/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Thaynara Silva
 */
public class SendEmail extends HttpServlet {

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
        String name = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String to = request.getParameter("email");
        String from = "example@gmail.com";
        String subject = request.getParameter("subject");
        String msg = request.getParameter("message");
        String host = "localhost";
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "80");
        properties.setProperty("mail.smtp.socketFactory.port", "80");
        Session session = Session.getDefaultInstance(properties);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent("<img src=\"assets/images/logo.gif\" alt=\"\"> <br><br>"
                    + "Dear " + name + " " + lastName
                    + "<br><br>"
                    + "<p>We successfully received your email as per following:<br><br>"
                    + "To: " + from + "<br>"
                    + "From: " + to + "<br>"
                    + "Subject: " + subject + "<br>"
                    + "Message: <br>"
                    + "<p>" + msg + "<br><br><br>" 
                    + " And we'll contact you shortly.</p><br>" 
                    + "Regards,<br>"
                    + "Staff of LIT Realty.", "text/html");
            Transport.send(message);
            
            address = "contactUs";
            request.setAttribute("message", true);
        } catch (MessagingException mex) {
            System.out.println(mex);
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
