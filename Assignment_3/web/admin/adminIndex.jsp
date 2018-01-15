<%-- 
    Document   : adminIndex
    Created on : 15-Jan-2018, 12:04:19
    Author     : Thaynara Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <shiro:hasRole name="admin">
            <title>LIT Realty Administration</title>
        </shiro:hasRole>
        <shiro:hasRole name="agent">
            <title>LIT Realty Agent</title>
        </shiro:hasRole>
        <meta name="author" content="Thaynara Silva">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Stylesheet Links -->
        <link href="assets/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/nprogress/nprogress.css" rel="stylesheet" type="text/css"/>
        <link href="assets/iCheck/skins/flat/green.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/jqvmap/dist/jqvmap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.min.css" rel="stylesheet" type="text/css"/>
        <!-- Font Links -->
        <link href="assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title">
                            <a href="index.jsp" class="site_title">
                                <img src="assets/images/logo.gif" style="width: 200px; height:75px;" alt=""/>
                            </a> 
                        </div>
                        <div class="clearfix"></div>
                        <div class="profile clearfix">
                            <div class="profile_pic">
                                <img src="assets/images/agents/${agent.agentId}.jpg" alt="" class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Welcome,</span>
                                <h2>${agent.name}</h2>
                            </div>
                        </div>
                        <br>
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <ul class="nav side-menu">
                                    <li><a href="LoadAdminIndex"><i class="fa fa-home"></i> Home</a></li>
                                    <li><a><i class="fa fa-user"></i> Profile</a></li>
                                    <li><a><i class="fa fa-building"></i> Properties</a></li>
                                    <li><a><i class="fa fa-users"></i> Vendors</a></li>
                                    <li><a><i class="fa fa-bar-chart-o"></i> Statistics</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav>
                            <div class="nav toggle"></div>
                            <div class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a class="user-profile dropdown-toggle" href="javascript:;" data-toggle="dropdown" aria-expanded="">
                                        <img src="assets/images/agents/${agent.agentId}" alt="">
                                        ${agent.name}
                                        <span class="fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                                        <a href="javascript:;">Profile</a>
                                    </ul>
                                </li>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scripts -->
        <script src="assets/js/custom.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
