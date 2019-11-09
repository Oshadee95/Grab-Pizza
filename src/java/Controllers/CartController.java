package Controllers;

import Models.Menu;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

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

            ArrayList<Menu> customerCart = (ArrayList) session.getAttribute("menuList");
            Double cartTotal = Double.parseDouble(session.getAttribute("cartTotal").toString());

            String cartAction = request.getParameter("cartAction");

            try {
                if (cartAction.equalsIgnoreCase("addToCart")) {
                    Menu menu = new Menu();
                    menu.setId(Integer.parseInt(request.getParameter("pid")));
                    menu.setName(request.getParameter("name"));

                    String pizzaSize = request.getParameter("size");
                    menu.setSize(pizzaSize);
                    
                    Double pizzaPice = 0.0;
                    
                    if (pizzaSize.equalsIgnoreCase("Small")) {
                        pizzaPice = Double.parseDouble(request.getParameter("smPrice"));
                    } else if (pizzaSize.equalsIgnoreCase("Medium")) {
                        pizzaPice = Double.parseDouble(request.getParameter("mdPrice"));
                    } else if (pizzaSize.equalsIgnoreCase("Large")) {
                        pizzaPice = Double.parseDouble(request.getParameter("lgPrice"));
                    }

                    menu.setPrice(pizzaPice);

                    int pizzaQuantity = Integer.parseInt(request.getParameter("quantity"));
                    menu.setQuantity(pizzaQuantity);

                    cartTotal = cartTotal + (menu.getPrice() * menu.getQuantity());

                    customerCart.add(menu);
                    session.setAttribute("menuList", customerCart);
                    session.setAttribute("cartTotal", cartTotal);
                    response.sendRedirect("index.jsp#myCart");

                } else if (cartAction.equalsIgnoreCase("removeFromCart")) {

                    int arrayIndex = Integer.parseInt(request.getParameter("pizzaIndex"));
                    customerCart.remove(arrayIndex);

                    Double pizzaPice = Double.parseDouble(request.getParameter("price").toString());
                    int pizzaQuantity = Integer.parseInt(request.getParameter("quantity"));
                    
                    cartTotal = cartTotal - (pizzaPice*pizzaQuantity);

                    session.setAttribute("menuList", customerCart);
                    session.setAttribute("cartTotal", cartTotal);
                    response.sendRedirect("index.jsp#myCart");

                } else if (cartAction.equalsIgnoreCase("clearCart")) {

                    customerCart.clear();

                    session.setAttribute("menuList", customerCart);
                    session.setAttribute("cartTotal", 0.0);
                    response.sendRedirect("index.jsp#myCart");
                }

            } catch (Exception e) {
                System.out.println("Location : CartController.java | Error : " + e);
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
