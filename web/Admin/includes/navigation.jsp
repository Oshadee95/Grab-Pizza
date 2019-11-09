<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <ul>
                <li class="label">Main</li>
                <li class="active"><a href="<%=request.getContextPath()%>/Admin/index.jsp"><i class="ti-home"></i> Dashboard </a></li>					

                <li class="label">Users</li>
                <li><a href="<%=request.getContextPath()%>/Admin/newUser.jsp"><i class="ti-plus"></i> New Employee</a></li>
                <li><a href="<%=request.getContextPath()%>/Admin/displayAdministrators.jsp"><i class="ti-server"></i> Administrators</a></li>
                <li><a href="<%=request.getContextPath()%>/Admin/displayDeliveryEmployees.jsp"><i class="ti-truck"></i> Delivery Employees</a></li>
                <li><a href="<%=request.getContextPath()%>/Admin/displayCustomers.jsp"><i class="ti-user"></i> Customers</a></li>

                <li class="label">Orders</li>
                <li><a href="<%=request.getContextPath()%>/Admin/onlineOrders.jsp"><i class="ti-shopping-cart"></i> Online Orders </a></li>
                
                <li class="label">Settings</li>
                <li><a href="<%=request.getContextPath()%>/LogoutController"><i class="ti-power-off"></i> Logout </a></li>

            </ul>
        </div>
    </div>
</div>