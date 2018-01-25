<%-- 
    Document   : singleProperty
    Created on : 23-Jan-2018, 11:54:04
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
                                    <div class="x_content">
                                        <div class="col-md-7 col-sm-7 col-xs-12 gallery">
                                            <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
                                            <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
                                            <div class="w3-modal-content w3-animate-zoom">
                                                <img id="img01" style="width:250px">
                                            </div>
                                            </div>
                                            <div class="product_gallery">
                                                <c:forEach items="${imageList}" var="image">
                                                    <div class="w3-container w3-third">
                                                        <img src="assets/images/properties/large/${property.listingNum}/${image}" style="width: 80px; height: 80px;" onclick="onClick(this)">
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-xs-12 info" style="border:0px solid #e5e5e5;">
                                            <h1>${property.city}</h1>
                                            <div class="">
                                                <div class="product_price">
                                                    <h1 class="price">
                                                        <fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                    </h1>
                                                </div>
                                            </div>
                                            <div class="">
                                                <a href="EditProperty?propertyId=${property.id}">
                                                    <button class="btn btn-submit" type="button">Edit</button>
                                                </a>

                                                <butoon class="btn btn-submit" type="button">Delete</butoon>
                                            </div>
                                            <h2>Description</h2>
                                            <p>${property.description}</p>
                                            <br>
                                            <div class="">
                                                <h2>Property Details</h2>
                                                <div class="icons">
                                                    <i class="fa fa-arrows-alt fa-2x"></i><br>
                                                    Area<br>
                                                    <fmt:formatNumber value="${property.squarefeet}" type="number" maxFractionDigits="0"/>
                                                    <b>Sq. Ft.</b>
                                                </div>
                                                <div class="icons">
                                                    <i class="fa fa-bed fa-2x"></i><br>
                                                    Bedrooms<br>
                                                    ${property.bedrooms}
                                                </div>
                                                <div class="icons">
                                                    <i class="fa fa-bathtub fa-2x"></i><br>
                                                    Bathrooms<br>
                                                    ${property.bathrooms}
                                                </div>
                                                <div class="icons">
                                                    <i class="fa fa-car fa-2x"></i><br>
                                                    Garages<br>
                                                    ${property.garagesize}
                                                </div>
                                                <div class="icons">
                                                    <i class="fa fa-user fa-2x"></i><br>
                                                    Vendor<br>
                                                    ${propertyVendor.name}
                                                </div>
                                            </div>
                                            <br>
                                            <div class="">
                                                <h2>Additional Details</h2>
                                                <table class="table1">
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">Style</th>
                                                            <td>${propertyStyle.styleName}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Type</th>
                                                            <td>${propertyType.typeName}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Lot Size</th>
                                                            <td>${property.lotsize}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Garage Type</th>
                                                            <td>${propertyGarage.garageName}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">BER Rating</th>
                                                            <td><img src="assets/images/BER/${property.berRating}.png"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">Address</th>
                                                            <td>${property.street}, ${property.city}</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function onClick(element) {
              document.getElementById("img01").src = element.src;
              document.getElementById("modal01").style.display = "block";
            }
        </script>
    </body>
</html>
