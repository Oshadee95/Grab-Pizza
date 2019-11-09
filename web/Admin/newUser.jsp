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
                            <div class="page-header">
                                <div class="page-title">
                                    <h1> </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 p-0">
                            <div class="page-header">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">Dashboard</a></li>
                                        <li class="active">New Employee</li>
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
                                        <h4>Horizontal Form Elements</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="horizontal-form-elements">
                                            <form class="form-horizontal" action="<%=request.getContextPath()%>/UserController" method="POST">
                                                <input type="hidden" name="operation" value="add">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Email</label>
                                                            <div class="col-sm-10">
                                                                <input type="email" class="form-control" name="email" placeholder="john@grabpizza.com" required>
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
                                                                <input class="form-control" type="password" name="password" placeholder="5fCqM@!#" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">First Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" name="fname" placeholder="John" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Last Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" name="lname" placeholder="Doe" required>
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
                                                                <textarea class="form-control" rows="3" name="address" placeholder="SLIIT Malabe Campus, New Kandy Rd, Malabe. 10115" required></textarea>
                                                                <span class="help-block">
                                                                    <small>Separate address lines with a comma.</small>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Contact</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" type="number" name="contact" placeholder="0117 544 801" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-4 col-lg-offset-8 m-t-150">
                                                                <button type="submit" class="btn btn-primary btn-lg btn-flat btn-addon m-b-10 m-l-5 btn-block m-t-25 text-truncate"><i class="ti-plus"></i>Add Employee</button>
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
                </div><!-- /# container-fluid -->
            </div><!-- /# main -->
        </div><!-- /# content wrap -->


        <%@include file="includes/scripts.jsp" %>
    </body>
</html>
