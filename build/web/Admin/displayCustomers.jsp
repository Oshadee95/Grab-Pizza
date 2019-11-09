<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
<%@page import="Helpers.UserHelper"%>
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
                                        <li class="active">Customers</li>
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
                                                    <th></th>
                                                    <th>Name</th>
                                                    <th>Gender</th>
                                                    <th>Contact</th>
                                                    <th>Email</th>
                                                    <th>Joined On</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    User adminUser = new User();
                                                    adminUser.setRole("customer");
                                                    ArrayList<User> users = UserHelper.displayUsers(adminUser);
                                                    for (User user : users) {
                                                %>
                                                <tr>
                                                    <td style="width: 80px" class="col-4"><img src="<%=request.getContextPath() + "/Public/img/" + user.getAvatar()%>" class="img-circle img-responsive col-lg-12"></td>
                                                    <td class="text-capitalize"><%=user.getFirstName() + " " + user.getLastName()%></td>
                                                    <td class="text-capitalize"><%=user.getGender()%></td>
                                                    <td><%=user.getContact()%></td>
                                                    <td><%=user.getEmail()%></td>
                                                    <td>
                                                        <%
                                                            String registeredDate = new SimpleDateFormat("E, dd MMM yyyy ").format(user.getRegisteredOn());
                                                            out.print(registeredDate);
                                                        %>
                                                    </td>
                                                    <td style="width: 320px">
                                                        <form class="form-horizontal" action="<%=request.getContextPath()%>/UserController" method="POST">
                                                            <a class="btn btn-info btn-flat btn-sm btn-addon m-b-10 m-l-5" href="<%=request.getContextPath() + "/Admin/displayUser.jsp?uid=" + user.getEmail()%>"><i class="ti-menu-alt"></i> View</a>
                                                            <a class="btn btn-warning btn-flat btn-sm btn-addon m-b-10 m-l-5" href="<%=request.getContextPath() + "/Admin/updateUser.jsp?uid=" + user.getEmail()%>"><i class="ti-pencil-alt"></i> Update</a>

                                                            <input type="hidden" name="operation" value="remove">
                                                            <input type="hidden" name="uid" value="<%=user.getId()%>">
                                                            <button class="btn btn-danger btn-flat btn-sm btn-addon m-b-10 m-l-5" href=""><i class="ti-trash"></i> Remove</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
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
