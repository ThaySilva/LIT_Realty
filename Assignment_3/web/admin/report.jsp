<%-- 
    Document   : report
    Created on : 31-Jan-2018, 21:14:10
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
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Report</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li>
                                                <a href="GenerateReport">
                                                    <i class="fa fa-download"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="LoadAdminIndex">
                                                    <i class="fa fa-times"></i>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <section class="content invoice">
                                            <div class="row">
                                                <div class="col-xs-12 invoice-header">
                                                    <h1>
                                                        Today's Report
                                                        <small class="pull-right">Date: ${date}</small>
                                                    </h1>
                                                </div>
                                            </div>
                                            <div class="row invoice-info">
                                                <div class="col-sm-4 invoice-col">
                                                    <h3>
                                                        <i class="fa fa-euro"></i>
                                                        <tab1>Total Price of Properties</tab1> <br>
                                                        <tab2><fmt:formatNumber value="${totalPropertyPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></tab2>
                                                    </h3>
                                                </div>
                                                <div class="col-sm-4 invoice-col">
                                                    <h3>
                                                        <i class="fa fa-building"></i>
                                                        <tab1>Total Number Properties</tab1> <br>
                                                        <tab3>${totalNumProperties}</tab3>
                                                    </h3>
                                                </div>
                                                <div class="col-sm-4 invoice-col">
                                                    <h3>
                                                        <i class="fa fa-users"></i>
                                                        <tab1>Total Number Agents</tab1> <br>
                                                        <tab3>${totalAgents}</tab3>
                                                    </h3>
                                                </div>
                                                <div class="col-sm-4 invoice-col">
                                                    <h3>
                                                        <i class="fa fa-users"></i>
                                                        <tab1>Total Number Vendors</tab1> <br>
                                                        <tab3>${totalVendors}</tab3>
                                                    </h3>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 150px;">
                                                <c:forEach items="${agentsList}" var="agent">
                                                    <c:set var="totalProperty" value="0" scope="page" />
                                                    <c:set var="totalPrice" value="0" scope="page" />
                                                    <img style="float:left; display: inline; margin-left: 25px; margin-bottom: 20px;" src="assets/images/agents/${agent.agentId}.jpg" alt="" style="width: 40px; height: 40px;">
                                                    <h1 style="float:left; display:inline; margin-left: 30px; margin-right: 20px; font-size: 22pt;">${agent.name}</h1>
                                                    <table class="table table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Id</th>
                                                                <th>City</th>
                                                                <th>Vendor</th>
                                                                <th>Views</th>
                                                                <th>Price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${propertyList}" var="property">
                                                                <c:if test="${property.agentId == agent.agentId}">
                                                                    <c:set var="totalProperty" value="${totalProperty + 1}" scope="page"/>
                                                                    <c:set var="totalPrice" value="${totalPrice + property.price}" scope="page" />
                                                                    <tr>
                                                                        <td>${property.id}</td>
                                                                        <td>${property.city}</td>
                                                                        <c:forEach items="${vendorsList}" var="vendor">
                                                                            <c:if test="${vendor.vendorID == property.vendorId}">
                                                                                <td>${vendor.name}</td>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <td>${property.views}</td>
                                                                        <td><fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                            <tr>
                                                                <td colspan="2"><h3>Total Properties</h3></td>
                                                                <td><h3>${totalProperty}</h3></td>
                                                                <td><h3>Total Price</h3></td>
                                                                <td><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </c:forEach>
                                                    
                                                <h1 style="float:left; display:inline; margin-left: 30px; margin-right: 20px; font-size: 22pt;">10 Oldest Properties</h1>
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>City</th>
                                                            <th>Agent</th>
                                                            <th>Vendor</th>
                                                            <th>Date Added</th>
                                                            <th>Views</th>
                                                            <th>Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${oldestProperties}" var="p">
                                                            <tr>
                                                                <td>${p.id}</td>
                                                                <td>${p.city}</td>
                                                                <c:forEach items="${agentsList}" var="a">
                                                                    <c:if test="${a.agentId == p.agentId}">
                                                                        <td>${a.name}</td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:forEach items="${vendorsList}" var="v">
                                                                    <c:if test="${v.vendorID == p.vendorId}">
                                                                        <td>${v.name}</td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <td><fmt:formatDate pattern="dd-MM-yyyy" value="${p.dateAdded}" /></td>
                                                                <td>${p.views}</td>
                                                                <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </section>
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <a href="GenerateReport">
                                                <button class="btn btn-submit" type="button">Download PDF</button>
                                            </a>
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
