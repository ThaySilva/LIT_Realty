<%-- 
    Document   : allProperties
    Created on : 23-Jan-2018, 11:53:33
    Author     : Thaynara Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                <div class="col-md-3 left_col menu_fixed mCustomScrollbar _mCS_1 mCS-autoHide">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title">
                            <a href="index.jsp" class="site_title">
                                <img src="assets/images/logo.gif" style="width: 200px; height: 75px;" alt=""/>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="profile clearfix">
                            <div class="profile_pic">
                                <shiro:hasRole name="admin">
                                    <a href="LoadProfile?userId=${user.adminID}&edit=false"><img src="assets/images/admins/${user.adminID}.jpg" alt="" class="img-circle profile_img"></a>
                                </shiro:hasRole>
                                <shiro:hasRole name="agent">
                                    <a href="LoadProfile?userId=${user.agentId}&edit=false"><img src="assets/images/agents/${user.agentId}.jpg" alt="" class="img-circle profile_img"></a>
                                </shiro:hasRole>
                            </div>
                            <div class="profile_info">
                                <span>Welcome,</span>
                                <shiro:hasRole name="admin">
                                    <a href="LoadProfile?userId=${user.adminID}&edit=false"><h2>${user.name}</h2></a>
                                </shiro:hasRole>
                                <shiro:hasRole name="agent">
                                    <a href="LoadProfile?userId=${user.agentId}&edit=false"><h2>${user.name}</h2></a>
                                </shiro:hasRole>
                            </div>
                        </div>
                        <br>
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <ul class="nav side-menu">
                                    <li><a href="LoadAdminIndex"><i class="fa fa-home"></i> Home</a></li>
                                    <shiro:hasRole name="admin">
                                        <li><a href="LoadProfile?userId=${user.adminID}&edit=false"><i class="fa fa-user"></i> Profile</a></li>
                                    </shiro:hasRole>
                                    <shiro:hasRole name="agent">
                                        <li><a href="LoadProfile?userId=${user.agentId}&edit=false"><i class="fa fa-user"></i> Profile</a></li>
                                    </shiro:hasRole>
                                    <shiro:hasRole name="admin">
                                        <li><a href="LoadAdminProperties?userId=${user.adminID}"><i class="fa fa-building"></i> Properties</a></li>
                                    </shiro:hasRole>
                                    <shiro:hasRole name="agent">
                                        <li><a href="LoadAdminProperties?userId=${user.agentId}"><i class="fa fa-building"></i> Properties</a></li>
                                    </shiro:hasRole>
                                    <li><a href="admin/vendors.jsp"><i class="fa fa-users"></i> Vendors</a></li>
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
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <br>
                                    <a href="/Assignment_3/logout"><i class="fa fa-sign-out pull-right"></i>
                                        Log Out
                                    </a>
                                </li>
                                <li>
                                    <shiro:hasRole name="admin">
                                        <a href="LoadProfile?userId=${user.adminID}&edit=false">
                                            <img src="assets/images/admins/${user.adminID}.jpg" alt="" style="width: 40px; height: 40px;">
                                            ${user.name}
                                        </a>
                                    </shiro:hasRole>
                                    <shiro:hasRole name="agent">
                                        <a href="LoadProfile?userId=${user.agentId}&edit=false">
                                            <img src="assets/images/agents/${user.agentId}.jpg" alt="" style="width: 40px; height: 40px;">
                                            ${user.name}
                                        </a>
                                    </shiro:hasRole>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="right_col" role="main">
                    <div class="">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Properties</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="row">
                                            <c:forEach items="${propertyList}" var="property">
                                                <div class="col-md-55">
                                                    <div class="thumbnail">
                                                        <div class="image view view-first">
                                                            <img style="width: 100%; display: block;" src="assets/images/properties/thumbs/${property.photo}" alt="image">
                                                            <div class="mask">
                                                                <p>${property.city}</p>
                                                                <div class="tools tools-bottom">
                                                                    <shiro:hasRole name="admin">
                                                                        <a href="LoadSingleProperty?userId=${user.adminID}&propertyId=${property.id}">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                    </shiro:hasRole>
                                                                    <shiro:hasRole name="agent">
                                                                        <a href="LoadSingleProperty?userId=${user.agentId}&propertyId=${property.id}">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                    </shiro:hasRole>
                                                                    <a href="#">
                                                                        <i class="fa fa-pencil"></i>
                                                                    </a>
                                                                    <a href="#">
                                                                        <i class="fa fa-times"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="caption">
                                                            <p><i class="fa fa-list"></i> ${property.listingNum}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
