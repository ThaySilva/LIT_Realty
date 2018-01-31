<%-- 
    Document   : vendorsProfile
    Created on : 23-Jan-2018, 11:55:55
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
                                <c:choose>
                                    <c:when test="${edit.equals(false)}">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>Profile</h2>
                                                <ul class="nav navbar-right panel_toolbox">
                                                    <li class="dropdown">
                                                        <a class="dropdown-toggle" href="LoadVendorsProfile?edit=true" data-toggle="dropdown" role="button">
                                                            <i class="fa fa-wrench"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                                    <div class="profile_img">
                                                        <div id="crop-avatar">
                                                            <img class="img-responsive avatar-view" src="assets/images/vendors/${vendor.vendorID}.jpg" style="width: 200px; height: 200px;" alt="Avatar">
                                                        </div>
                                                    </div>
                                                    <h3>${vendor.name}</h3>
                                                    <ul class="list-unstyled user-data" style="list-style-type: none;">
                                                        <li>
                                                            <i class="fa fa-phone"></i> ${vendor.phone}
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-building"></i> ${vendor.address}, ${vendor.county}
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-envelope"></i> ${vendor.email}
                                                        </li>
                                                    </ul>
                                                    <form action="LoadVendorsProfile?edit=true" method="post">
                                                        <input type="hidden" value="${vendor.vendorID}" name="vendorId">
                                                        <button type="submit" class="btn btn-success">
                                                            <i class="fa fa-edit m-right-xs"></i>
                                                            Edit Profile
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>Edit Vendor Details</h2>
                                                <ul class="nav navbar-right panel_toolbox">
                                                    <li>
                                                        <a href="LoadVendorsProfile?edit=false" class="close-link">
                                                            <i class="fa fa-close"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <br>
                                                <form name="editForm" class="form-horizontal form-label-left input_mask" action="EditVendorProfile" method="post">
                                                    <input type="hidden" value="${vendor.vendorID}" name="vendorId">
                                                    <input type="hidden" value="edit" name="function">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Name</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input id="name" name="name" class="form-control" placeholder="${vendor.name}" value="${vendor.name}" onfocus="if(this.value === '${vendor.name}'){this.value=''}" onblur="if(this.value === ''){this.value='${vendor.name}'}" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Phone</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input id="phone" name="phone" class="form-control" placeholder="${vendor.phone}" value="${vendor.phone}" onfocus="if(this.value === '${vendor.phone}'){this.value=''}" onblur="if(this.value === ''){this.value='${vendor.phone}'}" type="text" pattern="^[0-9]{3}-[0-9]{7}$" title="Please enter a valid phone number! e.g.: 083-1234567">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Address</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input id="address" name="address" class="address" placeholder="${vendor.address}" value="${vendor.address}" onfocus="if(this.value === '${vendor.address}'){this.value=''}" onblur="if(this.value === ''){this.value='${vendor.address}'}" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">County</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input id="county" name="county" class="form-control" placeholder="${vendor.county}" value="${vendor.county}" onfocus="if(this.value==='${vendor.county}'){this.value=''}" onblur="if(this.value === ''){this.value='${vendor.county}'}" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Email</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input id="email" name="email" class="form-control" placeholder="${vendor.email}" value="${vendor.email}" onfocus="if(this.value === '${vendor.email}'){this.value=''}" onblur="if(this.value === ''){this.value='${vendor.email}'}" type="email">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                            <form action="LoadVendorsProfile?edit=false" method="post">
                                                                <input type="hidden" value="${vendor.vendorID}" name="vendorId">
                                                                <button class="btn btn-reset" type="submit">Cancel</button>
                                                            </form>
                                                            <button class="btn btn-reset" type="reset">Reset</button>
                                                            <button onclick="confirmEdit()" class="btn btn-submit" type="button">Submit</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function confirmEdit(){
                if(confirm("Are you sure you want to edit these details?")) {
                    document.editForm.submit();
                }
            }
        </script>
    </body>
</html>
