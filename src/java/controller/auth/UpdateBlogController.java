/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import controller.auth.BaseRequiredAuthController;
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
public class UpdateBlogController extends BaseRequiredAuthController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
        int id = Integer.parseInt(request.getParameter("id"));
        BlogDBContext dbB = new BlogDBContext();
        Blog blog = dbB.getBlog(id);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("../view/auth/updateBlog.jsp").forward(request, response);
        
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
        Account acc = (Account) request.getSession().getAttribute("account");
        int id = acc.getUser().getId();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Date from = Date.valueOf(LocalDate.now());
        
        UserDBContext dbU = new UserDBContext();
        User u = dbU.getUser(id);
        int bid = Integer.parseInt(request.getParameter("id"));
        BlogDBContext dbB = new BlogDBContext();
        Blog blog = dbB.getBlog(bid);
        blog.setUser(u);
        blog.setTitle(title);
        blog.setFrom(from);
        blog.setDescription(description);
        
        BlogDBContext db = new BlogDBContext();
        db.update(blog);
        response.sendRedirect("../blog/blogDetail?id=" + bid);
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
