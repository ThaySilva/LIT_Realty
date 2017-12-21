<%-- 
    Document   : index
    Created on : 07-Dec-2017, 20:39:12
    Author     : Thaynara Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LIT Realty</title>
        <meta name="author" content="Thaynara Silva">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Stylesheet Links -->
        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <!-- Font Links -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon"> 
    </head>
    <body>
        <jsp:include page="/LoadIndexPage"/>
        <nav class="navbar navbar-default ">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo.gif" alt=""></a>
                </div>

                <div class="collapse navbar-collapse yamm" id="navigation">
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li class="wow"><a href="index.jsp" class="dropdown-toggle active">Home</a></li>
                        <li class="wow"><a href="LoadGalleryPage">Gallery</a></li>
                        <li class="wow"><a href="contact.html">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="slider-area">
            <div class="slider">
                <div class="item"><img src="assets/images/banner.jpg" alt=""></div>
            </div>
            <div class="slider-content">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <div class="search-form">
                            <form action="PropertiesIndexSearch" class="form-inline" method="post">
                                <div class="form-group">
                                    <select name="city" class="selectpicker" data-live-search="true" data-live-search-style="begins">
                                        <option value="All">All Locations</option>
                                        <c:forEach items="${cityList}" var="city">
                                            <option value="${city}">${city}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="style" class="selectpicker">
                                        <option value="All">All Styles</option>
                                        <c:forEach items="${styleList}" var="style">
                                            <option value="${style.styleId}">${style.styleName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="price" class="selectpicker">
                                        <option value="All">All Prices</option>
                                        <option value="below75000">Under <fmt:formatNumber value="75000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></option>
                                        <option value="75000To250000"><fmt:formatNumber value="75000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                            <fmt:formatNumber value="250000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                        </option>
                                        <option value="250000To425000"><fmt:formatNumber value="250000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                            <fmt:formatNumber value="425000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                        </option>
                                        <option value="425000To600000"><fmt:formatNumber value="425000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                            <fmt:formatNumber value="600000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                        </option>
                                        <option value="over600000">Over <fmt:formatNumber value="600000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></option>
                                    </select>
                                </div>
                                <button class="btn search-btn" type="submit"><i class="fa fa-search"></i></button>                    
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${fn:length(recentProperties) > 0}">
            <div class="content-area home-area-1 recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                            <h2>Recently Added</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="proerty-th">
                            <c:forEach items="${recentProperties}" var="property">
                                <div class="col-sm-6 col-md-3 p0">
                                    <div class="box-two proerty-item">
                                        <div class="item-thumb">
                                            <a href="LoadSinglePage?propertyId=${property.id}">
                                                <img src="assets/images/properties/thumbs/${property.photo}">
                                            </a>
                                        </div>
                                        <div class="item-entry overflow">
                                            <h5><a href="LoadSinglePage?propertyId=${property.id}">${property.city}</a></h5>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>Area :</b> 
                                                <fmt:formatNumber value="${property.squarefeet}" type="number" maxFractionDigits="0"/>m<sup>2</sup> </span>
                                            <span class="proerty-price pull-right"><fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></span>
                                            <div class="property-icon">
                                                <i class="fa fa-bed"></i>
                                                ${property.bedrooms} | 
                                                <i class="fa fa-shower"></i>
                                                <fmt:formatNumber value="${property.bathrooms}" type="number" maxFractionDigits="1"/> | 
                                                <i class="fa fa-car"></i>
                                                ${property.garagesize}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="content-area home-area-1 recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">
                <div class="row">
                    <div class="proerty-th">
                        <c:forEach items="${propertyList}" var="property">
                            <div class="col-sm-6 col-md-3 p0">
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="LoadSinglePage?propertyId=${property.id}">
                                            <img src="assets/images/properties/thumbs/${property.photo}" height="250" width="250">
                                        </a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a href="LoadSinglePage?propertyId=${property.id}">${property.city}</a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b>Area :</b> 
                                            <fmt:formatNumber value="${property.squarefeet}" type="number" maxFractionDigits="0"/>m<sup>2</sup> </span>
                                        <span class="proerty-price pull-right"><fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></span>
                                        <div class="property-icon">
                                            <i class="fa fa-bed"></i>
                                            ${property.bedrooms} | 
                                            <i class="fa fa-shower"></i>
                                            <fmt:formatNumber value="${property.bathrooms}" type="number" maxFractionDigits="1"/> | 
                                            <i class="fa fa-car"></i>
                                            ${property.garagesize}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-sm-6 col-md-3 p0">
                            <div class="box-tree more-proerty text-center">
                                <div class="item-tree-icon">
                                    <a href="LoadGalleryPage"><i class="fa fa-th"></i></a>
                                </div>
                                <div class="more-entry overflow">
                                    <h5><a href="LoadGalleryPage">CAN'T DECIDE ? </a></h5>
                                    <h5 class="tree-sub-ttl">Show all properties</h5>
                                    <a href="LoadGalleryPage"><button class="btn border-btn more-black" value="All properties">All properties</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="testimonial-area recent-property" style="background-color: #FCFCFC; padding-bottom: 15px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                        <h2>Our Agents  </h2> 
                    </div>
                </div>
                <div class="row">
                    <div class="row testimonial">
                        <div class="col-md-12">
                            <div id="testimonial-slider" class="owl-carousel owl-theme">
                                <c:forEach items="${agents}" var="agent">
                                    <div class="item">
                                        <div class="client-text">                                
                                            <p><i class="fa fa-phone"></i> ${agent.phone}</p>
                                            <p><i class="fa fa-fax"></i> ${agent.fax}</p>
                                            <p><i class="fa fa-envelope"></i><a href="mailto:${agent.email}"> ${agent.email}</a></p>
                                            <h4><strong>${agent.name}</strong></h4>
                                        </div>
                                        <div class="client-face"> 
                                            <img src="assets/images/agents/${agent.agentId}.jpg" alt="">
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2436251.021417586!2d-10.198534971792588!3d53.39423175991899!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x485e619e5d73698f%3A0xca9b39444d6ac68d!2sIreland!5e0!3m2!1sen!2sie!4v1511818793596" allowfullscreen>
            </iframe>
        </div>
        <div class="footer-area">
            <div class="footer-copy text-center">
                <div class="container">
                    <div class="row">
                        <div class="pull-left">
                            <span>&copy; <a href="https://github.com/ThaySilva/LIT_Realty">Thaynara Silva</a>, All rights reserved 2017</span> 
                        </div> 
                        <div class="bottom-menu pull-right"> 
                            <ul> 
                                <li><a class="wow" href="index.jsp">Home</a></li>
                                <li><a class="wow" href="LoadGalleryPage">Gallery</a></li>
                                <li><a class="wow" href="#">Contact Us</a></li>
                            </ul> 
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script src="assets/js/modernizr-2.6.2.min.js"></script>

        <script src="assets/js/jquery-1.10.2.min.js"></script> 
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="assets/js/easypiechart.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.js"></script>

        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/price-range.js"></script>

        <script src="assets/js/main.js"></script>

    </body>
</html>
