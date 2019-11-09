package Controllers;

import Helpers.BookingHelper;
import Helpers.DeliveryHelper;
import Models.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeliveryController", urlPatterns = {"/DeliveryController"})
public class DeliveryController extends HttpServlet {

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

            boolean executionResult = false;

            try {
                if (request.getParameter("confirmDelivery") != null) {

                    String loggedInUserId = session.getAttribute("logged_user_id").toString();
                    String loggedInUserFname = session.getAttribute("logged_user_first_name").toString();
                    String loggedInUserLname = session.getAttribute("logged_user_last_name").toString();
                    String deliveryPerson = request.getParameter("deliveryPerson");
                    String invoiceNo = request.getParameter("invoiceNo");

                    Booking booking = new Booking();

                    booking.setConfirmedBy(loggedInUserId + " - " + loggedInUserFname + " " + loggedInUserLname);
                    booking.setDeliveredBy(deliveryPerson);
                    booking.setId(Integer.parseInt(invoiceNo));

                    executionResult = BookingHelper.updateBooking(booking);

                    if (executionResult == true) {
                        response.sendRedirect(request.getContextPath() + "/Admin/onlineOrders.jsp?DeliveryConfirmation=200");
                    } else if (executionResult = false) {
                        response.sendRedirect(request.getContextPath() + "/Admin/onlineOrders.jsp?DeliveryConfirmation=400");
                    }
                }

                if (request.getParameter("cancelOrder") != null) {

                    String loggedInUserId = session.getAttribute("logged_user_id").toString();
                    String loggedInUserFname = session.getAttribute("logged_user_first_name").toString();
                    String loggedInUserLname = session.getAttribute("logged_user_last_name").toString();
                    String deliveryPerson = request.getParameter("deliveryPerson");
                    String invoiceNo = request.getParameter("invoiceNo");
                    
                    Booking booking = new Booking();
                    booking.setId(Integer.parseInt(invoiceNo));

                    executionResult = BookingHelper.deleteBooking(booking);

                    if (executionResult == true) {
                        response.sendRedirect(request.getContextPath() + "/Admin/onlineOrders.jsp?OrderCancellation=200");
                    } else if (executionResult = false) {
                        response.sendRedirect(request.getContextPath() + "/Admin/onlineOrders.jsp?OrderCancellation=400");
                    }

                }

                if (request.getParameter("completeDelivery") != null) {

                    Booking booking = new Booking();
                    int invoice = Integer.parseInt(request.getParameter("completeDelivery"));
                    booking.setId(invoice);

                    executionResult = DeliveryHelper.updateDeliveryStatus(booking);

                    if (executionResult == true) {
                        response.sendRedirect(request.getContextPath() + "/Delivery/index.jsp?DeliveryConfirmation=200");
                    } else if (executionResult = false) {
                        response.sendRedirect(request.getContextPath() + "/Delivery/index.jsp?DeliveryConfirmation=400");
                    }

                }
            } catch (Exception e) {
                System.out.println("Location : DeliveryController.java | Error : " + e);
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
