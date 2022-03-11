/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import dal.BlogDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Blog;
import model.User;

/**
 *
 * @author ADMIN
 */
public class InsertBlogController extends BaseRequiredAuthController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//    }
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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
//        Account acc = (Account) request.getSession().getAttribute("account");
//        int id = acc.getUser().getId();
//        
        request.getRequestDispatcher("../view/auth/insertBlog.jsp").forward(request, response);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        Account acc = (Account) request.getSession().getAttribute("account");
        int id = acc.getUser().getId();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Date from = Date.valueOf(LocalDate.now());       
        if (title.length() == 0) {
            title = "Untitled";
        }
        if (description == null) {
            description = "";
        }
        
        UserDBContext dbU = new UserDBContext();
        User u = dbU.getUser(id);
        Blog b = new Blog();
        b.setTitle(title);
        b.setUser(u);
        b.setFrom(from);
        b.setDescription(description);
        BlogDBContext dbBlog = new BlogDBContext();
        dbBlog.insert(b);
        response.sendRedirect("../blog/listBlog");
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
