<%-- 
    Document   : editProperty
    Created on : 24-Jan-2018, 21:35:49
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
                                        <h2>Edit Property</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br>
                                        <form method="post" enctype="multipart/form-data" class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="street">
                                                    Street
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="street" class="big-control col-md-7 col-xs-12" placeholder="${p.street}" value="${p.street}" onfocus="if(this.value === '${p.street}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.street}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="city">
                                                    City
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="city" class="big-control col-md-7 col-xs-12" placeholder="${p.city}" value="${p.city}" onfocus="if(this.value==='${p.city}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.city}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="price">
                                                    Price
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="price" class="big-control col-md-7 col-xs-12" placeholder="${p.price}" value="${p.price}" onfocus="if(this.value==='${p.price}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.price}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="big-label col-md-3 col-sm-3 col-xs-12" for="description">
                                                    Description
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea id="description" class="textarea" placeholder="${p.description}" value="${p.description}" onfocus="if(this.value==='${p.description}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.description}'}"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="style">
                                                    Style
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="style" class="left-form-control">
                                                        <c:forEach items="${stylesList}" var="style">
                                                            <c:choose>
                                                                <c:when test="${p.styleId.equals(style.styleId)}">
                                                                    <option value="${style.styleId}" selected="selected">${style.styleName}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${style.styleId}">${style.styleName}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="type">
                                                    Type
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="type" class="right-form-control">
                                                        <c:forEach items="${typesList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${p.typeId.equals(type.typeId)}">
                                                                    <option value="${type.typeId}" selected="selected">${type.typeName}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${type.typeId}">${type.typeName}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="beds">
                                                    Bedrooms
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="beds" class="left-form-control col-md-7 col-xs-12" placeholder="${p.bedrooms}" value="${p.bedrooms}" onfocus="if(this.value==='${p.bedrooms}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.bedrooms}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="baths">
                                                    Bathrooms
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="baths" class="right-form-control col-md-7 col-xs-12" placeholder="${p.bathrooms}" value="${p.bathrooms}" onfocus="if(this.value==='${p.bathrooms}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.bathrooms}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="garageStyle">
                                                    Garage
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="garageStyle" class="right-form-control">
                                                        <c:forEach items="${garageList}" var="garage">
                                                            <c:choose>
                                                                <c:when test="${p.garageId.equals(garage.garageId)}">
                                                                    <option value="${garage.garageId}" selected="selected">${garage.garageName}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${garage.garageId}">${garage.garageName}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="garageSize">
                                                    Garage Size
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="garageSize" class="right-form-control col-md-7 col-xs-12" placeholder="${p.garagesize}" value="${p.garagesize}" onfocus="if(this.value==='${p.garagesize}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.garagesize}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="squareFeet">
                                                    Square Feet
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="squareFeet" class="left-form-control col-md-7 col-xs-12" placeholder="${p.squarefeet}" value="${p.squarefeet}" onfocus="if(this.value==='${p.squarefeet}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.squarefeet}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="lotSize">
                                                    Lot Size
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="lotSize" class="right-form-control col-md-7 col-xs-12" placeholder="${p.lotsize}" value="${p.lotsize}" onfocus="if(this.value==='${p.lotsize}'){this.value=''}" onblur="if(this.value === ''){this.value='${p.lotsize}'}" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="vendor">
                                                    Vendor
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="vendor" class="left-form-control">
                                                        <c:forEach items="${vendorsList}" var="vendor">
                                                            <c:choose>
                                                                <c:when test="${p.vendorId.equals(vendor.vendorID)}">
                                                                    <option value="${vendor.vendorID}" selected="selected">${vendor.name}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${vendor.vendorID}">${vendor.name}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="ber">
                                                    BER Rating
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="ber" class="right-form-control">
                                                        <c:forEach items="${berRatings}" var="ber">
                                                            <c:choose>
                                                                <c:when test="${p.berRating.equals(ber)}">
                                                                    <option value="${ber}" selected="selected">${ber}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ber}">${ber}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="upload-label col-md-3 col-sm-3 col-xs-12" for="file">
                                                    Select photos to upload
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input class="upload" type="file" name="uploadFile" multiple="multiple"/>
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
