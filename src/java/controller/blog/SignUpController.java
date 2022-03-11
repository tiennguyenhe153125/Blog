/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.blog;

import dal.AccUserDBContext;
import dal.AccountDBContext;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.User;

/**
 *
 * @author ADMIN
 */
public class SignUpController extends HttpServlet {

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
//        String user = request.getParameter("user");
//        String pass = request.getParameter("pass");
//        String pass1 = request.getParameter("pass1");
//        AccountDBContext dbA = new AccountDBContext();
//        UserDBContext dbU = new UserDBContext();
//
//        String displayName = request.getParameter("displayName");
//        String address = request.getParameter("address");
//        Boolean gender = request.getParameter("gender").equals("male");
//        Date dob = Date.valueOf(request.getParameter("dob"));
//        Boolean isAdmin = false;
//
//        if (!pass.equals(pass1)) {
//            request.setAttribute("mess", "Re-pass with different pass");
//            request.getRequestDispatcher("../view/blog/signUp.jsp").forward(request, response);
//        } else {
//            Account a = dbA.checkAccountExist(user);
//            if (a == null) {
//                request.setAttribute("mess", "SIGN UP SUCCESSFULL");
//                dbA.insertAccount(user, pass);
//                dbU.insertUser(displayName, gender, dob, address, isAdmin);
//                request.getRequestDispatcher("../view/blog/signUp.jsp").forward(request, response);
//            } else {
//                request.setAttribute("mess", "Account is exist");
//                request.getRequestDispatcher("../view/blog/signUp.jsp").forward(request, response);
//            }
//        }
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
        request.getRequestDispatcher("view/blog/signUp.jsp").forward(request, response);
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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String pass1 = request.getParameter("pass1");
        String displayName = request.getParameter("displayName");
        String address = request.getParameter("address");
        Boolean gender = request.getParameter("gender").equals("male");
        Date dob = Date.valueOf(request.getParameter("dob"));
        Date now = Date.valueOf(LocalDate.now());

        AccountDBContext dbA = new AccountDBContext();
        AccUserDBContext dbAu = new AccUserDBContext();
        if (!pass.equals(pass1)) {
            request.setAttribute("alert", "Confirm password is not match!");
            request.getRequestDispatcher("view/blog/signUp.jsp").forward(request, response);
        } else if (dob.after(now)) {
            request.setAttribute("alert", "Your date of birth is can't be over " + now + "!");
            request.getRequestDispatcher("view/blog/signUp.jsp").forward(request, response);
        } else {
            Account a = dbA.checkAccountExist(user);
            if (a == null) {
                User u = new User();
                u.setDisplayName(displayName);
                u.setAddress(address);
                u.setDob(dob);
                u.setGender(gender);

                Account acc = new Account();
                acc.setPassword(pass);
                acc.setUsername(user);
                acc.setUser(u);
                dbAu.insert(acc);
                dbAu.insertGA(acc);
                request.setAttribute("success", "Sign up successful!");
                request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
            } else {
//                response.getWriter().println("This account has already exist");
                request.setAttribute("alert", "This account is already exist!");
                request.getRequestDispatcher("view/blog/signUp.jsp").forward(request, response);
            }
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

}
