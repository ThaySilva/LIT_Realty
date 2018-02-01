<%-- 
    Document   : addProperty
    Created on : 23-Jan-2018, 11:46:57
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
                                    <a href="LoadProfile?edit=false"><img src="assets/images/admins/${sessionScope.userId}.jpg" alt="" class="img-circle profile_img"></a>
                                </shiro:hasRole>
                                <shiro:hasRole name="agent">
                                    <a href="LoadProfile?&edit=false"><img src="assets/images/agents/${sessionScope.userId}.jpg" alt="" class="img-circle profile_img"></a>
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
                                    <li><a href="LoadAdminProperties?"><i class="fa fa-building"></i> Properties</a></li>
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
                                        <a href="LoadProfile?uedit=false">
                                            <img src="assets/images/admins/${sessionScope.userId}.jpg" alt="" style="width: 40x; height: 40px;">
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
                                        <h2>Add Property</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li>
                                                <a href="LoadAdminProperties" class="close-link">
                                                    <i class="fa fa-close"></i>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br>
                                        <form name="addForm" action="AddProperty" method="post" enctype="multipart/form-data" class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="street">
                                                    Street
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="street" id="street" class="big-control col-md-7 col-xs-12" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="city">
                                                    City
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="city" id="city" class="big-control col-md-7 col-xs-12" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="price">
                                                    Price
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="price" id="price" class="big-control col-md-7 col-xs-12" required="required" type="text" pattern="[0-9]+([\.][0-9]+)?" step="0.01" title="Please enter a valid price! e.g.: 2456.98">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="description">
                                                    Description
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea name="description" id="description" class="textarea" required="required"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="style">
                                                    Style
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select name="style" id="style" class="left-form-control">
                                                        <c:forEach items="${stylesList}" var="style">
                                                            <option value="${style.styleId}">${style.styleName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="type">
                                                    Type
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select name="type" id="type" class="right-form-control">
                                                        <c:forEach items="${typesList}" var="type">
                                                            <option value="${type.typeId}">${type.typeName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="beds">
                                                    Bedrooms
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="bedrooms" id="beds" class="left-form-control col-md-7 col-xs-12" pattern="[0-9]*" title="Please enter a valid number of bedrooms! e.g.: 2" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="baths">
                                                    Bathrooms
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="bathrooms" id="baths" class="right-form-control col-md-7 col-xs-12" required="required" type="text" pattern="[0-9]+([\.][5]+)?" step="0.1" title="Please enter a valid number of bathrooms! e.g.: 3 or 1.5">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="garageStyle">
                                                    Garage
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select name="garageType" id="garageStyle" class="right-form-control">
                                                        <c:forEach items="${garageList}" var="garage">
                                                            <option value="${garage.garageId}">${garage.garageName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="garageSize">
                                                    Garage Size
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="garageSize" id="garageSize" class="right-form-control col-md-7 col-xs-12" required="required" type="text" pattern="[0-9]*" title="Please enter a valid garage size! e.g.: 4">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="squareFeet">
                                                    Square Feet
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="squareFeet" id="squareFeet" class="left-form-control col-md-7 col-xs-12" required="required" type="text" pattern="[0-9]*" title="Please enter a valid square feet size! e.g.: 975">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="lotSize">
                                                    Lot Size
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input name="lotSize" id="lotSize" class="right-form-control col-md-7 col-xs-12" required="required" type="text" pattern="^[0-9]{1,3}x[0-9]{1,3}$" title="Plese enter a valid lot size! e.g.: 120x80">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="vendor">
                                                    Vendor
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select name="vendor" id="vendor" class="left-form-control">
                                                        <c:forEach items="${vendorsList}" var="vendor">
                                                            <option value="${vendor.vendorID}">${vendor.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <shiro:hasRole name="admin">
                                                <div class="form-group">
                                                    <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="agent">
                                                        Agent
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <select name="agent" id="agent" class="right-form-control">
                                                            <c:forEach items="${agentsList}" var="agent">
                                                                <option value="${agent.agentId}">${agent.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </shiro:hasRole>
                                            <shiro:hasRole name="agent">
                                                <input type="hidden" name="agent" value="${sessionScope.userId}">
                                            </shiro:hasRole>
                                            <shiro:hasRole name="admin">
                                                <div class="form-group">
                                                    <label class="big-label col-md-3 col-sm-3 col-xs-12" for="ber">
                                                        BER Rating
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <select name="ber" id="ber" class="big-control">
                                                            <c:forEach items="${berRatings}" var="ber">
                                                                <option value="${ber}">${ber}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </shiro:hasRole>
                                            <shiro:hasRole name="agent">
                                                <div class="form-group">
                                                    <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="ber">
                                                        BER Rating
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <select name="ber" id="ber" class="right-form-control">
                                                            <c:forEach items="${berRatings}" var="ber">
                                                                <option value="${ber}">${ber}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </shiro:hasRole>
                                            <div class="form-group">
                                                <label class="upload-label col-md-3 col-sm-3 col-xs-12" for="file">
                                                    Select photos to upload
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input class="upload" type="file" name="uploadFile" multiple="multiple"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <a href="LoadAdminProperties">
                                                        <button class="btn btn-reset" type="button">Cancel</button>
                                                    </a>
                                                    <button class="btn btn-reset" type="reset">Reset</button>
                                                    <button class="btn btn-submit" type="submit">Submit</button>
                                                </div>
                                            </div>
                                        </form>
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
