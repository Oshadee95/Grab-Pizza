<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Helpers.UserHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
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
                                        <li><a>Users</a></li>
                                        <li class="active">User Profile</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%

                        User tempUser = new User();
                        tempUser.setEmail(request.getParameter("uid"));

                        ArrayList<User> users = UserHelper.displayUser(tempUser);
                        for (User user : users) {
                    %>                   
                    <div class="main-content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card alert">
                                    <div class="card-body">
                                        <div class="user-profile">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="user-photo m-b-30">
                                                        <img class="img-responsive" src="<%=request.getContextPath()%>/Public/img/<%=user.getAvatar()%>" alt="" />
                                                    </div>
                                                    <div class="user-work">
                                                        <h4>WORK PLACE</h4>
                                                        <div class="work-content">
                                                            <h3>Grab Pizza Private Ltd</h3>
                                                            <p></p>
                                                            <p>SLIIT Malabe Campus<br>New Kandy Rd<br>Malabe<br>10115</p>
                                                            <p>www.grabpizza.lk</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="user-profile-name"><%=user.getFirstName()%> <%=user.getLastName()%></div>
                                                    <div class="user-Location"><i class="ti-location-pin"></i> Sri Lanka</div>
                                                    <div class="user-job-title text-capitalize"><%=user.getRole()%></div>
                                                    <div class="ratings">
                                                        <h4>Ratings</h4>
                                                        <div class="rating-star">
                                                            <span>8.9</span>
                                                            <i class="ti-star color-primary"></i>
                                                            <i class="ti-star color-primary"></i>
                                                            <i class="ti-star color-primary"></i>
                                                            <i class="ti-star color-primary"></i>
                                                            <i class="ti-star"></i>
                                                        </div>
                                                    </div>
                                                    <div class="user-send-message"><button class="btn btn-primary btn-addon" type="button"><i class="ti-email"></i>Send Message</button></div>
                                                    <div class="custom-tab user-profile-tab">
                                                        <ul class="nav nav-tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">About</a></li>
                                                        </ul>
                                                        <div class="tab-content">
                                                            <div role="tabpanel" class="tab-pane active" id="1">
                                                                <div class="contact-information">
                                                                    <h4>Contact information</h4>
                                                                    <div class="phone-content">
                                                                        <span class="contact-title">Phone:</span>
                                                                        <span class="phone-number">(+94) <%=user.getContact()%></span>
                                                                    </div>
                                                                    <div class="address-content">
                                                                        <span class="contact-title">Address:</span>
                                                                        <span class="mail-address"><%=user.getAddress()%></span>
                                                                    </div>
                                                                    <div class="email-content">
                                                                        <span class="contact-title">Email:</span>
                                                                        <span class="contact-email"><%=user.getEmail()%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="basic-information">
                                                                    <h4>Worker information</h4>
                                                                    <div class="birthday-content">
                                                                        <span class="contact-title">Joined : </span>
                                                                        <span class="birth-date">
                                                                            <%
                                                                                String registeredDate = new SimpleDateFormat("E, dd MMM yyyy ").format(user.getRegisteredOn());
                                                                                out.print(registeredDate);
                                                                            %>
                                                                        </span>
                                                                    </div>
                                                                    <div class="gender-content">
                                                                        <span class="contact-title">Gender:</span>
                                                                        <span class="gender text-capitalize"><%=user.getGender()%></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /# column -->
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="card">
                                            <div class="stat-widget-one">
                                                <div class="profile-widget">
                                                    <div class="stat-text">Job Done</div>
                                                    <div class="stat-digit">19</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="card">
                                            <div class="stat-widget-one">
                                                <div class="profile-widget">
                                                    <div class="stat-text">Ongoing Job</div>
                                                    <div class="stat-digit">6</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="card">
                                            <div class="stat-widget-one">
                                                <div class="profile-widget">
                                                    <div class="stat-text">Reject</div>
                                                    <div class="stat-digit">6</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="card">
                                            <div class="stat-widget-one">
                                                <div class="profile-widget">
                                                    <div class="stat-text">Upcomming</div>
                                                    <div class="stat-digit">29</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card alert">
                                            <div class="card-header">
                                                <h4>Recent Project </h4>
                                                <div class="card-header-right-icon">
                                                    <ul>
                                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                                        <li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
                                                            <ul class="card-option-dropdown dropdown-menu">
                                                                <li><a href="#"><i class="ti-loop"></i> Update data</a></li>
                                                                <li><a href="#"><i class="ti-menu-alt"></i> Detail log</a></li>
                                                                <li><a href="#"><i class="ti-pulse"></i> Statistics</a></li>
                                                                <li><a href="#"><i class="ti-power-off"></i> Clear ist</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="doc-link"><a href="#"><i class="ti-link"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <table class="table table-responsive table-hover ">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Status</th>
                                                            <th>Date</th>
                                                            <th>Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Kolor Tea Shirt For Man</td>
                                                            <td><span class="badge badge-primary">Ongoing</span></td>
                                                            <td>January 22</td>
                                                            <td class="color-primary">$21.56</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kolor Tea Shirt For Women</td>
                                                            <td><span class="badge badge-success">Complete</span></td>
                                                            <td>January 30</td>
                                                            <td class="color-success">$55.32</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Blue Backpack For Baby</td>
                                                            <td><span class="badge badge-danger">Rejected</span></td>
                                                            <td>January 25</td>
                                                            <td class="color-danger">$14.85</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kolor Tea Shirt For Man</td>
                                                            <td><span class="badge badge-primary">Ongoing</span></td>
                                                            <td>January 22</td>
                                                            <td class="color-primary">$21.56</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kolor Tea Shirt For Women</td>
                                                            <td><span class="badge badge-success">Complete</span></td>
                                                            <td>January 30</td>
                                                            <td class="color-success">$55.32</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Blue Backpack For Baby</td>
                                                            <td><span class="badge badge-danger">Rejected</span></td>
                                                            <td>January 25</td>
                                                            <td class="color-danger">$14.85</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /# column -->
                        </div><!-- /# row -->
                    </div><!-- /# main content -->

                    <%

                        }%>
                </div><!-- /# container-fluid -->
            </div><!-- /# main -->
        </div><!-- /# content wrap -->

        <%@include file="includes/scripts.jsp" %>
    </body>
</html>
