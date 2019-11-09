<div class="header">
    <div class="pull-left">
        <div class="logo"><a href="<%=request.getContextPath()%>/Admin/index.jsp"><span>GrabPizza</span></a></div>
    </div>

    <div class="pull-right p-r-15">
        <ul>
            <li class="header-icon dib"><img class="avatar-img" src="<%=request.getContextPath() %>/Public/img/avatar/1.jpg" alt="" /> <span class="user-avatar"><%= session.getAttribute("logged_user_first_name")+" "+session.getAttribute("logged_user_last_name") %> <i class="ti-angle-down f-s-10"></i></span>
                <div class="drop-down dropdown-profile">
                    <div class="dropdown-content-body">
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/LogoutController"><i class="ti-power-off"></i> <span>Logout</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>