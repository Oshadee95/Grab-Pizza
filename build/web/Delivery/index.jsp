<%@page import="Models.User"%>
<%@page import="Helpers.DeliveryHelper"%>
<%@page import="Models.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <%
            if (session.getAttribute("logged_user_role") == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }else if(!session.getAttribute("logged_user_role").equals("delivery")){
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        %>
        <%@include file="includes/head.jsp" %>
        <%@include file="includes/styles.jsp" %>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <div class="container-fluid p-t-80">

            <div class="panel-group" id="accordion">

                <%
                    String loggedUser = session.getAttribute("logged_user_id") + " - " + session.getAttribute("logged_user_first_name") + " " + session.getAttribute("logged_user_last_name");
                    ArrayList<Booking> deliveryList = DeliveryHelper.displayDeliveries(loggedUser);
                    for (Booking booking : deliveryList) {
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=booking.getId()%>" aria-expanded="false" class="collapsed">Invoice No : #<%=booking.getId()%></a></h4>
                    </div>
                    <div id="collapse<%=booking.getId()%>" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                        <div class="panel-body">
                            <div class="col-xs-12"><div class="row"><div class="col-xs-5">Ordered Pizza</div><div class="col-xs-7"> : <%=booking.getOrder_details().replace(",", "<br>:")%></div></div></div>

                            <div class="col-xs-12 m-t-30"><div class="row"><div class="col-xs-5">Total Payment</div><div class="col-xs-7"> : Rs. <%=booking.getOrderCost()%></div></div></div>

                            <div class="col-xs-12 m-t-30"><div class="row"><div class="col-xs-5">Customer</div><div class="col-xs-7"> : <%=booking.getBookedBy()%></div></div></div>

                            <div class="col-xs-12 m-t-30 m-b-30"><div class="row"><div class="col-xs-5">Address</div><div class="col-xs-7"> : <%=booking.getDeliveryAddress()%></div></div></div>

                            <form action="<%=request.getContextPath()%>/DeliveryController" method="POST">
                                <button class="btn btn-block btn-primary" name="completeDelivery" value="<%=booking.getId()%>">Confirm Payment</button>
                            </form>

                        </div>
                    </div>
                </div>
                <%}%>
            </div>


            <%@include file="includes/scripts.jsp" %>
    </body>
</html>