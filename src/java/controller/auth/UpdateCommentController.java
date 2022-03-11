/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import dal.BlogDBContext;
import dal.CommentDBContext;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
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
public class UpdateCommentController extends HttpServlet {

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
        CommentDBContext dbC = new CommentDBContext();
        Comment comment = dbC.getComment(id);
        request.setAttribute("comment", comment);
        int bid = comment.getBlog().getId();
        BlogDBContext dbB = new BlogDBContext();
        Blog blog = dbB.getBlog(bid);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("../view/auth/updateComment.jsp").forward(request, response);
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
//        processRequest(request, response);
        
        int cid = Integer.parseInt(request.getParameter("cmtid"));
        BlogDBContext dbB = new BlogDBContext();
        int bid = Integer.parseInt(request.getParameter("blgid"));
        Blog b = dbB.getBlog(bid);
        Account acc = (Account) request.getSession().getAttribute("account");
        User u = acc.getUser();
        String cmt = request.getParameter("cmt");
        Date from = Date.valueOf(LocalDate.now());
        Comment c = new Comment();
        c.setId(cid);
        c.setBlog(b);
        c.setUser(u);
        c.setDescription(cmt);
        c.setFrom(from);
        
        CommentDBContext dbC = new CommentDBContext();
        dbC.update(c);
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
