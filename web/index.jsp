<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Models.Menu"%>
<%@page import="Helpers.MenuHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
    <head>

        <meta charset="utf-8">

        <title>Title</title>
        <meta name="description" content="">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="shortcut icon" href="<%=request.getContextPath()%>/Public/img/favicon/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/Public/img/favicon/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath()%>/Public/img/favicon/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath()%>/Public/img/favicon/apple-touch-icon-114x114.png">

        <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#000">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#000">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#000">

        <style>body { opacity: 0; overflow-x: hidden; } html { background-color: #fff; }</style>

    </head>

    <body>

        <div id="my-page">

            <div id="my-header">
                <!-- Header section -->
                <header class="header">

                    <div class="container">

                        <div class="top_line col-lg-12">
                            <!-- Logo -->
                            <div class="logo col-lg-3 col-md-3 col-sm-3 col-xs-9">

                                <img src="<%=request.getContextPath()%>/Public/img/Icons/pizza.png" alt="">
                                <div class="site_name">GrabPizza</div>

                            </div>
                            <!-- End Logo -->
                            <!-- Menu -->
                            <nav class="menu col-lg-9 col-md-9 col-sm-9 hidden-xs">

                                <ul>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <li><a></a></li>
                                    <% if(session.getAttribute("logged_user_role") == null){%>
                                    <li><a href="<%=request.getContextPath()%>/login.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i>Login</a></li>
                                    <%}else{%>
                                    <li><a href="<%=request.getContextPath()%>/LogoutController"><i class="fa fa-angle-right" aria-hidden="true"></i>Logout</a></li>
                                    <%}%>
                                </ul>

                            </nav>

                            <a href="#my-menu" class="hamburger hamburger--spin hidden-lg hidden-md hidden-sm col-xs-3">
                                <span class="hamburger-box"><span class="hamburger-inner"></span></span>
                            </a>
                            <!-- Menu or small devices -->
                            <nav id="my-menu">

                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/login.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i>Login</a></li>
                                </ul>

                            </nav>
                            <!-- End Menu -->
                        </div>
                        <!-- Header content-->
                        <div class="owl-carousel col-lg-12 col-md-12 col-sm-12 col-xs-12">

                            <%
                                ArrayList<Menu> menus = MenuHelper.displayMenus();
                                for (Menu menu : menus) {
                            %>
                            <!-- Header Item -->
                            <div class="item">

                                <div class="col-lg-6 col-lg-push-6 col-md-6 col-md-push-6 col-sm-6 col-sm-push-6 col-xs-12">

                                    <div class="pizza_img">
                                        <img src="<%=request.getContextPath()%>/Public/img/american-1239091_1920.png" alt="pizza img">
                                    </div>

                                </div>

                                <div class="col-lg-6 col-lg-pull-6 col-md-6 col-md-pull-6 col-sm-6 col-sm-pull-6 col-xs-12">

                                    <div class="pizza_name"><%=menu.getName()%></div>

                                    <div class="pizza_description"><%=menu.getDescription()%></div>

                                    <div class="button col-sm-12 col-xs-12">
                                        <a href="<%=request.getContextPath()%>/index.jsp#my-content"><i class="fa fa-check"></i>BUY NOW</a>
                                    </div>

                                </div>


                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                    <div class="phone">
                                        <i class="fa fa-phone"></i>
                                        (+94) 2 729 729
                                    </div>

                                </div>

                            </div>
                            <!-- End Header Item -->
                            <%}%>
                            <!-- End Header content -->
                        </div>

                    </div>

                </header>
                <!-- End Header section -->
                <!-- Algorithm -->
            </div>
            <%
                if (session.getAttribute("logged_user_role") != null) {
                    if (session.getAttribute("logged_user_role").equals("customer")) {
            %>     
            <!-- Content -->
            <div id="my-content">

                <!-- Choose your pizza -->
                <div class="choose_pizza">

                    <div class="container">

                        <div class="caption">
                            GRAB YOUR PIZZA
                        </div>
                        <!-- Pizza items -->
                        <div class="owl-carousel col-lg-12 col-md-12 col-sm-12 col-xs-12" id='owl'>

                            <%
                                for (Menu menu : menus) {
                            %>

                            <!-- Item -->
                            <div class="item">

                                <div class="col-lg-12 col-sm-12 col-xs-12">

                                    <div class="pizza_item">

                                        <div class="pizza_item_img">

                                            <img src="<%=request.getContextPath()%>/Public/img/<%=menu.getImage()%>" alt="">
                                            <div class="sizes">
                                                <div class="small">2</div>
                                                <div class="medium">4</div>
                                                <div class="large">8</div>
                                            </div>
                                            <div class="price">
                                                <%=menu.getSmallSizePrice()%><sup> Rs</sup>
                                            </div>

                                        </div>

                                        <div class="pizza_item_name"><%=menu.getName()%></div>

                                        <div class="pizza_item_description"><%=menu.getDescription()%></div>

                                        <div class="ingredients">
                                            <strong>Ingredients:</strong> <%=menu.getIngredients()%>.
                                        </div>

                                        <form action="<%=request.getContextPath()%>/CartController" method="POST">
                                            <input type="hidden" name="pid" value="<%=menu.getId()%>">
                                            <input type="hidden" name="name" value="<%=menu.getName()%>">
                                            <input type="hidden" name="smPrice" value="<%=menu.getSmallSizePrice()%>">
                                            <input type="hidden" name="mdPrice" value="<%=menu.getMediumSizePrice()%>">
                                            <input type="hidden" name="lgPrice" value="<%=menu.getLargeSizePrice()%>">

                                            <div class="buy_button">
                                                <div class="row">
                                                    <div class="col-lg-offset-1"></div>
                                                    <div class="col-lg-5 col-sm-6">
                                                        <select class="form-control col-lg-12" name="size">
                                                            <option selected value="Small">Small</option>
                                                            <option value="Medium">Medium</option>
                                                            <option value="Large">Large</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-6">
                                                        <select class="form-control col-lg-8" name="quantity">
                                                            <option selected value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="buy_button p-b-5">
                                                <button type="submit" name="cartAction" value="addToCart"><i class="fa fa-check"></i> BUY NOW</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>

                            </div>
                            <!-- End Item -->
                            <%}%>

                        </div>
                        <!-- End pizza items -->
                    </div>
                </div>

                <!-- Order -->
                <div class="order">


                    <div class="container">
                        <form action="<%=request.getContextPath()%>/BookingController" method="POST">
                            <div class="col-lg-6 col-md-6 col-sm-12">

                                <div class="order_caption">
                                    ADDRESS AND TIME OF DELIVERY
                                </div>

                                <div class="order_explain">
                                    Please, choose comfort date and time for delivery,
                                    write your full address and phone-number, so we can
                                    know, that your order found you.
                                </div>
                                <!-- Form -->


                                <div class="col-lg-6 col-sm-6">
                                    Delivery date:<br>
                                    <%
                                        Date date = new Date();
                                        String currentDate = new SimpleDateFormat("E, dd MMM yyyy ").format(date);
                                        out.print("<input type=text' value='" + currentDate + "' readonly>");
                                    %>

                                </div>

                                <div class="col-lg-6 col-sm-6">
                                    Delivery time:<br>
                                    <input type="time" name="deriveryTime">
                                </div>

                                <div class="col-lg-6 col-sm-6">
                                    Your name:<br>
                                    <input type="text" name="name" required readonly value="<%=session.getAttribute("logged_user_first_name")+" "+session.getAttribute("logged_user_last_name")%>">
                                </div>
                                
                                <div class="col-lg-6 col-sm-6">
                                    Your phone:<br>
                                    <input type="number" maxlength="10" name="number">
                                </div>

                                <div class="col-lg-12">
                                    Delivery address:<br>
                                    <input type="text" name="deliveryAddress" value="<%=session.getAttribute("logged_user_address").toString() %>">
                                </div>

                                <div class="col-lg-12">
                                    Your comment:<br>
                                    <textarea name="#" id="#" cols="30" rows="6" name="additionalInfo"></textarea>
                                </div>


                                <!-- End Form -->

                            </div>
                            <!-- Order info -->
                            <section id="myCart">
                                <div class="col-lg-6 col-md-6 col-sm-12">

                                    <div class="order_info">

                                        <div class="order_border">

                                            <div class="order_info_caption">
                                                YOUR <span>ORDER</span>
                                            </div>

                                            <div class="order_item">

                                                <%
                                                    if (session.getAttribute("menuList") != null) {
                                                        ArrayList<Menu> menuList = (ArrayList) session.getAttribute("menuList");
                                                        for (Menu menu : menuList) {
                                                %>

                                                <div class="order_name">

                                                    <div class="pizza_order_name text-capitalize">
                                                        <form style="margin-top:0px" action="<%=request.getContextPath()%>/CartController" method="POST">

                                                            <input type="hidden" name="pizzaIndex" value="<%=menuList.indexOf(menu)%>">
                                                            <input type="hidden" name="quantity" value="<%=menu.getQuantity() %>">
                                                            <input type="hidden" name="price" value="<%=menu.getPrice()%>">
                                                            <button style="background-color:transparent; border: none" type="submit" name="cartAction" value="removeFromCart"><img src="Public/img/Icons/delete_button.png" alt=""></button>
                                                        </form>
                                                        <%=menu.getName()%> (<%=menu.getSize()%>)
                                                    </div>

                                                    <div class="dots"></div>

                                                    <div class="order_price"><%=menu.getQuantity()%> / Rs. <strong><%=menu.getPrice()%></strong></div>

                                                </div>

                                                <%}
                                                    }%>
                                                <%
                                                    if (session.getAttribute("cartTotal") != null) {
                                                %>
                                                <div class="total">
                                                    TOTAL: Rs. <span><%=session.getAttribute("cartTotal").toString()%></span>
                                                </div>
                                                <%}%>

                                                <div class="buttons">

                                                    <div class="cancel_button">
                                                        <form style="margin-top:0px" action="<%=request.getContextPath()%>/CartController" method="POST">
                                                            <button style="background-color:transparent; border: none" type="submit" name="cartAction" value="clearCart"><i class="fa fa-times" aria-hidden="true"></i> CANCEL</button>
                                                        </form>
                                                    </div>

                                                    <div class="order_button">
                                                        <button style="border:none" type="submit" name="cartAction" value="checkout"><i class="fa fa-check"></i> ORDER</button>
                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </section>
                            <!-- End Order info -->
                        </form>
                    </div>


                </div>
                <!-- End order -->
            </div>
            <!-- End Content -->
            <%}}%>
            <!-- Footer -->
            <div class="copyright">
                Copyright © 2019. All rights reserved.
            </div>
            <!-- End Footer -->

        </div>

        <link rel="stylesheet" href="<%=request.getContextPath()%>/Public/css/main.min.css">
        <script src="<%=request.getContextPath()%>/Public/js/scripts.min.js"></script>

    </body>
</html>

