package Controllers;

import Helpers.BookingHelper;
import Models.Booking;
import Models.Menu;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
public class BookingController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();

            ArrayList<Menu> customerCart = (ArrayList) session.getAttribute("menuList");
            Double cartTotal = Double.parseDouble(session.getAttribute("cartTotal").toString());

            Booking booking = new Booking();

            boolean executionResult = false;

            try {

                String deliverOrderDetails = "";
                for (Menu menu : customerCart) {
                    deliverOrderDetails = deliverOrderDetails + menu.getName() + " - " + menu.getQuantity() + " (" + menu.getSize() + "), ";
                }
                booking.setOrder_details(deliverOrderDetails);

                booking.setOrderStatus("unpaid");
                booking.setOrderCost(cartTotal);

                SimpleDateFormat format = new SimpleDateFormat("HH:mm"); // 12 hour format
                java.util.Date date = (java.util.Date) format.parse(request.getParameter("deriveryTime"));
                java.sql.Time deliveryTime = new java.sql.Time(date.getTime());

                booking.setTime(deliveryTime);

                booking.setAddtionalInfo(request.getParameter("additionalInfo"));
                booking.setBookedBy(request.getParameter("name"));
                booking.setDeliveryAddress(request.getParameter("deliveryAddress"));

                executionResult = BookingHelper.addBooking(booking);

                if (executionResult == true) {

                    customerCart.clear();
                    session.setAttribute("menuList", customerCart);
                    session.setAttribute("cartTotal", 0.0);
                    response.sendRedirect(request.getContextPath() + "/index.jsp?OrderPlacement=200");

                } else if (executionResult = false) {
                    response.sendRedirect(request.getContextPath() + "/index.jsp?OrderPlacement=400");
                }
            } catch (Exception e) {
                System.out.println("Location : BookingController.java | Error : " + e);
                response.sendRedirect(request.getContextPath() + "/index.jsp?"+e);
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
