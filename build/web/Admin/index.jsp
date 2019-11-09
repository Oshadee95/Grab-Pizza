<%@page import="Helpers.BookingHelper"%>
<%@page import="Models.Booking"%>
<%@page import="Helpers.UserHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from zebratheme.com/html/fooadmin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 01 Oct 2019 17:11:34 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>GrazPizza</title>

        <!-- ================= Favicon ================== -->
        <!-- Standard -->
        <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
        <!-- Retina iPad Touch Icon-->
        <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
        <!-- Retina iPhone Touch Icon-->
        <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
        <!-- Standard iPad Touch Icon--> 
        <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
        <!-- Standard iPhone Touch Icon--> 
        <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

        <!-- Styles -->
        <link href="../Public/css/lib/font-awesome.min.css" rel="stylesheet">
        <link href="../Public/css/lib/themify-icons.css" rel="stylesheet">
        <link href="../Public/css/lib/owl.carousel.min.css" rel="stylesheet" />
        <link href="../Public/css/lib/owl.theme.default.min.css" rel="stylesheet" />
        <link href="../Public/css/lib/weather-icons.css" rel="stylesheet" />
        <link href="../Public/css/lib/mmc-chat.css" rel="stylesheet" />
        <link href="../Public/css/lib/sidebar.css" rel="stylesheet">
        <link href="../Public/css/lib/bootstrap.min.css" rel="stylesheet">
        <link href="../Public/css/lib/unix.css" rel="stylesheet">
        <link href="../Public/css/style.css" rel="stylesheet">
    </head>

    <body>


        <%@include file="includes/navigation.jsp" %>

        <%@include file="includes/header.jsp" %>

        <div class="content-wrap">
            <div class="main">
                <div class="container-fluid">
                    <div class="main-content">
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="card alert">
                                    <div class="card-header">
                                        <h4>Online Order List </h4>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-responsive table-hover ">
                                            <thead>
                                                <tr>
                                                    <th>Invoice No</th>
                                                    <th>Order</th>
                                                    <th>Payment(Rs)</th>
                                                    <th>Ordered At</th>
                                                    <th class="text-center">Delivery Date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    ArrayList<Booking> bookingList = BookingHelper.displayBookings();
                                                    for (Booking booking : bookingList) {
                                                %>


                                                <tr>
                                                <input type="hidden" name="invoiceNo" value="<%=booking.getId()%>">
                                                <td style="vertical-align: middle;" class="text-capitalize">#<%=booking.getId()%></td>
                                                <td style="vertical-align: middle;" class="text-capitalize"><%=booking.getOrder_details().replaceAll(",", "<br>")%></td>
                                                <td style="vertical-align: middle;"><%=booking.getOrderCost()%></td>
                                                <td style="vertical-align: middle;"><%=booking.getTime()%></td>
                                                <td style="vertical-align: middle;" class="text-center"><%=booking.getBookedOn()%></td>
                                                <td style="vertical-align: middle;" class="text-capitalize text-center"><%=booking.getOrderStatus()%></td>
                                            </tr>

                                            <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div><!-- /# column -->
                        </div><!-- /# row -->
                    </div><!-- /# main content -->
                </div><!-- /# container-fluid -->
            </div><!-- /# main -->
        </div><!-- /# content wrap -->



        <script src="../Public/js/lib/jquery.min.js"></script><!-- jquery vendor -->
        <script src="../Public/js/lib/jquery.nanoscroller.min.js"></script><!-- nano scroller -->    
        <script src="../Public/js/lib/sidebar.js"></script><!-- sidebar -->
        <script src="../Public/js/lib/bootstrap.min.js"></script><!-- bootstrap -->
        <script src="../Public/js/lib/mmc-common.js"></script>
        <script src="../Public/js/lib/mmc-chat.js"></script>
        <!--  Chart js -->
        <script src="../Public/js/lib/chart-js/Chart.bundle.js"></script>
        <script src="../Public/js/lib/chart-js/chartjs-init.js"></script>
        <!-- // Chart js -->

        <!--  Datamap -->
        <script src="../Public/js/lib/datamap/d3.min.js"></script>
        <script src="../Public/js/lib/datamap/topojson.js"></script>
        <script src="../Public/js/lib/datamap/datamaps.world.min.js"></script>
        <script src="../Public/js/lib/datamap/datamap-init.js"></script>
        <!-- // Datamap -->-->
        <script src="../Public/js/lib/weather/jquery.simpleWeather.min.js"></script>	
        <script src="../Public/js/lib/weather/weather-init.js"></script>
        <script src="../Public/js/lib/owl-carousel/owl.carousel.min.js"></script>
        <script src="../Public/js/lib/owl-carousel/owl.carousel-init.js"></script>
        <script src="../Public/js/scripts.js"></script><!-- scripit init-->
    </body>

</html>









