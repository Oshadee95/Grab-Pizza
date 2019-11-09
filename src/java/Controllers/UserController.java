package Controllers;

import Helpers.UserHelper;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            User user = new User();
            Boolean executionResult = false;

            String operation = request.getParameter("operation");

            try {

                if (operation.equalsIgnoreCase("add")) {

                    user.setEmail(request.getParameter("email"));
                    user.setRole(request.getParameter("role"));
                    user.setPassword(request.getParameter("password"));
                    user.setFirstName(request.getParameter("fname"));
                    user.setLastName(request.getParameter("lname"));
                    user.setAvatar(request.getParameter("avatar"));
                    user.setGender(request.getParameter("gender"));
                    user.setAddress(request.getParameter("address"));
                    user.setContact(request.getParameter("contact"));

                    executionResult = UserHelper.addUser(user);

                    if (executionResult == true) {
                        if (request.getParameter("registrationType") != null) {
                            response.sendRedirect(request.getContextPath() + "/login.jsp?CustomerEnrollment=200");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/Admin/index.jsp?UserEnrollment=200");
                        }
                    } else if (executionResult = false) {
                        response.sendRedirect(request.getContextPath() + "/Admin/index.jsp?UserEnrollment=400");
                    }

                } else if (operation.equalsIgnoreCase("update")) {

                    user.setId(Integer.parseInt(request.getParameter("uid")));
                    user.setRole(request.getParameter("role"));
                    user.setPassword(request.getParameter("password"));
                    user.setFirstName(request.getParameter("fname"));
                    user.setLastName(request.getParameter("lname"));
                    user.setAvatar(request.getParameter("avatar"));
                    user.setGender(request.getParameter("gender"));
                    user.setAddress(request.getParameter("address"));
                    user.setContact(request.getParameter("contact"));

                    executionResult = UserHelper.updateUser(user);

                    if (executionResult == true) {
                        response.sendRedirect(request.getContextPath() + "/Admin/index.jsp?UserUpdate=200");
                    } else if (executionResult = false) {
                        response.sendRedirect(request.getContextPath() + "/Admin/index.jsp?UserUpdate=400");
                    }

                } else if (operation.equalsIgnoreCase("remove")) {

                    user.setId(Integer.parseInt(request.getParameter("uid")));

                    executionResult = UserHelper.deleteUser(user);

                    if (executionResult == true) {
                        response.sendRedirect(request.getContextPath() + "/Admin/index.jsp?UserRemoval=200");
                    } else if (executionResult = false) {
                        response.sendRedirect(request.getContextPath() + "/Admin/index.jsp?UserRemoval=400");
                    }
                }

            } catch (Exception e) {
                System.out.println("Location : UserController.java | Error : " + e);
            }

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
