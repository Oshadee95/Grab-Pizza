package Controllers;

import Helpers.LoginHelper;
import Models.Login;
import Models.Menu;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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

            HttpSession session = request.getSession();

            Login login = new Login();

            login.setEmail(request.getParameter("email"));
            login.setPassword(request.getParameter("password"));

            try {

                ArrayList<User> UserDetails;

                UserDetails = LoginHelper.validateUser(login);

                for (User user : UserDetails) {
                    session.setAttribute("logged_user_id", user.getId());
                    session.setAttribute("logged_user_email", user.getEmail());
                    session.setAttribute("logged_user_role", user.getRole());
                    session.setAttribute("logged_user_first_name", user.getFirstName());
                    session.setAttribute("logged_user_last_name", user.getLastName());
                    session.setAttribute("logged_user_avatar", user.getAvatar());
                    session.setAttribute("logged_user_gender", user.getGender());
                    session.setAttribute("logged_user_address", user.getAddress());

                    ArrayList<Menu> cart = new ArrayList();
                    session.setAttribute("menuList", cart);
                    session.setAttribute("cartTotal", 0);

                    switch (user.getRole()) {
                        case "admin":
                            response.sendRedirect(request.getContextPath() + "/Admin");
                            break;
                        case "delivery":
                            response.sendRedirect(request.getContextPath() + "/Delivery");
                            break;
                        case "customer":
                            response.sendRedirect(request.getContextPath() + "/index.jsp");
                            break;
                        default:
                            response.sendRedirect(request.getContextPath() + "/login.jsp");
                    }

                }

            } catch (Exception e) {

                System.out.print("Location : LoginController.java | Error : " + e);
                session.setAttribute("login_error", "Invalid Credentials, Please re-check your credentials");
                response.sendRedirect(request.getContextPath() + "/login.jsp");
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
