<%@page import="Helpers.UserHelper"%>
<%@page import="Models.User"%>
<%@page import="Models.Booking"%>
<%@page import="Helpers.BookingHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <%@include file="includes/head.jsp" %>
        <%@include file="includes/styles.jsp" %>
    </head>
    <body>
        <%@include file="includes/navigation.jsp" %>
        <%@include file="includes/header.jsp" %>

        <div class="content-wrap">
            <div class="main">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8 p-0">
                        </div>
                        <div class="col-lg-4 p-0">
                            <div class="page-header">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="<%=request.getContextPath()%>/Admin/index.jsp">Dashboard</a></li>
                                        <li class="active">Online Orders</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main-content">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card alert">
                                    <div class="card-header">
                                    </div>
                                    <div class="bootstrap-data-table-panel">
                                        <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Invoice No</th>
                                                    <th>Order</th>
                                                    <th>Payment(Rs)</th>
                                                    <th>Ordered At</th>
                                                    <th>Delivery Person</th>
                                                    <th>Delivery Date</th>
                                                    <th>Status</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    ArrayList<Booking> bookingList = BookingHelper.displayBookings();
                                                    for (Booking booking : bookingList) {
                                                %>


                                                <tr>
                                            <form action="<%=request.getContextPath()%>/DeliveryController" method="POST">
                                                <input type="hidden" name="invoiceNo" value="<%=booking.getId()%>">
                                                <td style="vertical-align: middle;" class="text-capitalize">#<%=booking.getId()%></td>
                                                <td style="vertical-align: middle;" class="text-capitalize"><%=booking.getOrder_details().replaceAll(",", "<br>")%></td>
                                                <td style="vertical-align: middle;"><%=booking.getOrderCost()%></td>
                                                <td style="vertical-align: middle;"><%=booking.getTime()%></td>
                                                <td style="vertical-align: middle;" class="text-center text-capitalize">

                                                    <%
                                                        if (booking.getConfirmedBy() == null) {

                                                            User adminUser = new User();
                                                            adminUser.setRole("delivery");
                                                            ArrayList<User> users = UserHelper.displayUsers(adminUser);
                                                    %>
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <select class="form-control" name="deliveryPerson">
                                                                <%
                                                                    for (User user : users) {
                                                                %>

                                                                <option value="<%=user.getId() + " - " + user.getFirstName() + " " + user.getLastName()%>"><%=user.getId() + " - " + user.getFirstName() + " " + user.getLastName()%></option>

                                                                <%}%>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <%} else {%>
                                                    <%=booking.getDeliveredBy()%>
                                                    <% }%>
                                                </td>
                                                <td style="vertical-align: middle;" class="text-center"><%=booking.getBookedOn()%></td>
                                                <td style="vertical-align: middle;" class="text-capitalize text-center"><%=booking.getOrderStatus()%></td>
                                                <td style="width: 250px; vertical-align: middle">

                                                    <!--<a class="btn btn-default btn-flat btn-sm btn-addon m-b-10 m-l-5" href="<%=request.getContextPath() + "/Admin/orderInvoice.jsp?iid=" + booking.getId()%>"><i class="ti-menu-alt"></i> View</a>-->
                                                    <% if (booking.getConfirmedBy() == null) {%>

                                                    <button class="btn btn-info btn-flat btn-sm btn-addon m-b-10 m-l-5" type="submit" name="confirmDelivery"><i class="ti-truck"></i> Deliver </button>
                                                    <button class="btn btn-danger btn-flat btn-sm btn-addon m-b-10 m-l-5" type="submit" name="cancelOrder"><i class="ti-trash"></i> Cancel Order</button>
                                                    <% } else { %>

                                                    <a class="btn btn-success btn-flat btn-sm btn-addon m-b-10 m-l-5"><i class="ti-truck"></i> On Route</a>
                                                    <button class="btn btn-warning btn-flat btn-sm btn-addon m-b-10 m-l-5" type="button"><i class="ti-trash"></i> Completed</button>
                                                    <% } %>


                                                </td>
                                            </form>
                                            </tr>

                                            <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div><!-- /# card -->
                            </div><!-- /# column -->
                        </div><!-- /# row -->
                    </div><!-- /# main content -->
                </div><!-- /# container-fluid -->
            </div><!-- /# main -->
        </div><!-- /# content wrap -->

        <%@include file="includes/scripts.jsp" %>
    </body>
</html>
