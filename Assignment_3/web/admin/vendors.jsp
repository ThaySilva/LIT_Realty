<%-- 
    Document   : vendors
    Created on : 23-Jan-2018, 11:41:20
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
        <link href="assets/dropzone/dist/min/dropzone.min.css" rel="stylesheet" type="text/css"/>
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
                                <img src="assets/images/logo.gif" style="width: 200px; height:75px;" alt=""/>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="profile clearfix">
                            <div class="profile_pic">
                                <shiro:hasRole name="admin">
                                    <a href="LoadProfile?edit=false"><img src="assets/images/admins/${sessionScope.userId}.jpg" alt="" class="img-circle profile_img"></a>
                                </shiro:hasRole>
                                <shiro:hasRole name="agent">
                                    <a href="LoadProfile?edit=false"><img src="assets/images/agents/${sessionScope.userId}.jpg" alt="" class="img-circle profile_img"></a>
                                </shiro:hasRole>
                            </div>
                            <div class="profile_info">
                                <span>Welcome,</span>
                                <a href="LoadProfile?edit=false"><h2>${user.name}</h2></a>
                            </div>
                        </div>
                        <br>
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <ul class="nav side-menu">
                                    <li><a href="LoadAdminIndex"><i class="fa fa-home"></i> Home</a></li>
                                    <li><a href="LoadProfile?edit=false"><i class="fa fa-user"></i> Profile</a></li>
                                    <li><a href="LoadAdminProperties"><i class="fa fa-building"></i> Properties</a></li>
                                    <li><a href="LoadVendors"><i class="fa fa-users"></i> Vendors</a></li>
                                    <shiro:hasRole name="admin">
                                        <li><a href="LoadReportsPage"><i class="fa fa-bar-chart-o"></i> Report</a></li>
                                    </shiro:hasRole>
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
                                        <a href="LoadProfile?edit=false">
                                            <img src="assets/images/admins/${sessionScope.userId}.jpg" alt="" style="width: 40px; height: 40px;">
                                            ${user.name}
                                        </a>
                                    </shiro:hasRole>
                                    <shiro:hasRole name="agent">
                                        <a href="LoadProfile?edit=false">
                                            <img src="assets/images/agents/${sessionScope.userId}.jpg" alt="" style="width: 40px; height: 40px;">
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
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <c:if test="${message.equals(true)}">
                                    <h3>The vendor ${vendorName} can't be deleted as, he/she is currently selling a property!</h3>
                                </c:if>
                                <c:if test="${deleteMessage.equals(true)}">
                                    <h3>The vendor ${vendorName} has been successfully deleted!</h3>
                                </c:if>
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Vendors</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li>
                                                <a href="LoadAddVendors">
                                                    <i class="fa fa-plus"></i>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="row">
                                            <c:forEach items="${vendorsList}" var="vendor">
                                                <div class="col-md-4 col-sm-4 col-xs-12 profile_details">
                                                    <div class="well profile_view">
                                                        <div class="col-sm-12">
                                                            <div class="left col-xs-7">
                                                                <h2>${vendor.name}</h2>
                                                                <ul class="list-unstyled" style="list-style: none;">
                                                                    <li>
                                                                        <i class="fa fa-envelope"></i>
                                                                        ${vendor.email}
                                                                    </li>
                                                                    <li>
                                                                        <i class="fa fa-phone"></i>
                                                                        ${vendor.phone}
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="right col-xs-5 text-center">
                                                                <img class="img-circle img-responsive" style="width: 100px; height: 100px;" src="assets/images/vendors/${vendor.vendorID}.jpg" alt="">
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6 emphasis">
                                                            <form class="side" action="LoadVendorsProfile?edit=false" method="post">
                                                                <input type="hidden" value="${vendor.vendorID}" name="vendorId">
                                                                <button class="btn btn-success btn-xs" type="submit">
                                                                    <i class="fa fa-user"></i>
                                                                    View Profile
                                                                </button>
                                                            </form>
                                                            <form class="side" action="LoadVendorsProfile?edit=true" method="post">
                                                                <input type="hidden" value="${vendor.vendorID}" name="vendorId">
                                                                <button class="btn btn-success btn-xs" type="submit">
                                                                    <i class="fa fa-edit"></i>
                                                                    Edit Profile
                                                                </button>
                                                            </form>
                                                            <form class="middle" action="EditVendorProfile" method="post">
                                                                <input type="hidden" value="${vendor.vendorID}" name="vendorId">
                                                                <input type="hidden" value="delete" name="function">
                                                                <button class="btn btn-success btn-xs" type="submit">
                                                                    <i class="fa fa-trash"></i>
                                                                    Delete
                                                                </button>
                                                            </form>
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
