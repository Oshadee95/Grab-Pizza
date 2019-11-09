<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Grab Pizza</title>

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
    <link href="<%=request.getContextPath()%>/Public/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Public/css/lib/themify-icons.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Public/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Public/css/lib/unix.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Public/css/style.css" rel="stylesheet">
</head>

<body class="bg-primary">

    <div class="unix-login">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3">
                    <div class="login-content">
                        <div class="login-logo">
                            <img src="<%=request.getContextPath()%>/Public/img/Icons/pizza.png" alt="">
                            <a href="<%=request.getContextPath()%>/index.jsp"><span>Grab Pizza</span></a>
                        </div>
                        <div class="login-form">
                            <h4></h4>
                            <form action="<%=request.getContextPath()%>/UserController" method="POST">
                                <input type="hidden" name="operation" value="add">
                                <input type="hidden" name="registrationType" value="customer">
                                <input type="hidden" name="role" value="customer">
                                <input type="hidden" name="avatar" value="user-profile.jpg">
                                <div class="form-group">
                                    <label>Email address</label>
                                    <input type="email" class="form-control" placeholder="Email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input type="text" class="form-control" placeholder="First Name" name="fname" required>
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input type="text" class="form-control" placeholder="Last Name" name="lname" required>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                    <select name="gender" class="form-control">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Contact Number</label>
                                    <input type="number" class="form-control" placeholder="0112729729" name="contact" required>
                                </div>
                                <div class="form-group">
                                    <label>Delivery Address</label>
                                    <input type="text" class="form-control" placeholder="SLIIT Malabe Campus, New Kandy Rd, Malabe. 10115" name="address" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" placeholder="Password" name="password">
                                </div>
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">Register</button>
                                <div class="register-link m-t-15 text-center">
                                    <p>Already have account ? <a href="<%=request.getContextPath()%>/login.jsp"> Sign In Here</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
