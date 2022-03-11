/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.blog;

import controller.auth.BaseRequiredAuthController;
import dal.BlogDBContext;
import dal.CommentDBContext;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Blog;
import model.Comment;
import model.User;

/**
 *
 * @author ADMIN
 */
public class BlogDetailController extends BaseRequiredAuthController {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        int id = Integer.parseInt(request.getParameter("id"));
        BlogDBContext dbB = new BlogDBContext();
        Blog blog = dbB.getBlog(id);
        request.setAttribute("blog", blog);
//        Date posted = Date.valueOf(LocalDate.now());
//        request.setAttribute("posted", posted);
        request.getRequestDispatcher("../view/blog/blogDetail.jsp").forward(request, response);
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
        User u = acc.getUser();
        BlogDBContext dbB = new BlogDBContext();
        int id = Integer.parseInt(request.getParameter("blgid"));
        Blog b = dbB.getBlog(id);
        Date from = Date.valueOf(LocalDate.now());
        String cmt = request.getParameter("cmt");
        if (cmt != null && cmt.length() != 0) {
            Comment c = new Comment();
            c.setBlog(b);
            c.setUser(u);
            c.setDescription(cmt);
            c.setFrom(from);

            CommentDBContext dbC = new CommentDBContext();
            dbC.insert(c);
            response.sendRedirect("blogDetail?id=" + id);
        } else {
            response.sendRedirect("blogDetail?id=" + id);
        }

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

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
