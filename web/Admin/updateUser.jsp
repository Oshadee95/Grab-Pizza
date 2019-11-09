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
                            <div class="col-lg-2">
                                <div class="card alert">
                                    <div class="card-body">
                                        <div class="user-profile">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <p>User Identification : <%=user.getId()%> </p>
                                                    <p>
                                                        <%
                                                            String registeredDate = new SimpleDateFormat("E, dd MMM yyyy ").format(user.getRegisteredOn());
                                                            out.print("Since : " + registeredDate);
                                                        %>
                                                    </p>
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /# column -->
                            <div class="col-lg-10">
                                <div class="card alert">
                                    <div class="card-body">
                                        <div class="horizontal-form-elements">
                                            <form class="form-horizontal" action="<%=request.getContextPath()%>/UserController" method="POST">
                                                <input type="hidden" name="operation" value="update">
                                                <input type="hidden" name="uid" value="<%=user.getId()%>">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Email</label>
                                                            <div class="col-sm-10">
                                                                <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Title</label>
                                                            <div class="col-sm-10">
                                                                <select class="form-control" name="role">
                                                                    <option value="admin">1 - Administrator</option>
                                                                    <option value="delivery">2 - Delivery Person</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Password</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" type="password" name="password" placeholder="Leave blank for the same password">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">First Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" name="fname" value="<%=user.getFirstName()%>">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Last Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" name="lname" value="<%=user.getLastName()%>">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Avatar</label>
                                                            <div class="col-sm-10">
                                                                <input type="file" class="form-control" name="avatar">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Gender</label>
                                                            <div class="col-sm-10">
                                                                <select class="form-control" name="gender">
                                                                    <option value="male">Male</option>
                                                                    <option value="female">Female</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div><!-- /# column -->
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Address</label>
                                                            <div class="col-sm-10">
                                                                <textarea class="form-control" rows="3" name="address"><%=user.getAddress()%></textarea>
                                                                <span class="help-block">
                                                                    <small>Separate address lines with a comma.</small>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Contact</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" type="number" name="contact" value="<%=user.getContact()%>">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-4 col-lg-offset-8 m-t-150">
                                                                <button type="submit" class="btn btn-warning btn-lg btn-flat btn-addon m-b-10 m-l-5 btn-block m-t-25 text-truncate"><i class="ti-pencil-alt"></i>Update</button>
                                                            </div>
                                                        </div>
                                                    </div><!-- /# column -->
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div><!-- /# card -->
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
