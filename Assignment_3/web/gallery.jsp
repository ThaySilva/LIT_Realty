<%-- 
    Document   : gallery
    Created on : 08-Dec-2017, 16:25:27
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
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">   
    </head>
    <body>
        <nav class="navbar navbar-default ">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo.gif" alt=""></a>
                </div>
                <div class="collapse navbar-collapse yamm" id="navigation">
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li class="wow"><a href="index.jsp">Home</a></li>
                        <li class="wow"><a href="LoadGalleryPage" class="dropdown-toggle active">Gallery</a></li>
                        <li class="wow"><a href="LoadFavouritesPage">Favourites</a></li>
                        <li class="wow"><a href="contactUs.jsp">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="page-head"> 
            <div class="container">
                <div class="row">
                   <div class="page-head-content">
                        <h1 class="page-title">Gallery</h1>               
                    </div>
                </div>
            </div>
        </div>
        <div class="properties-area recent-property" style="background-color: #FFF;">
            <div class="container">  
                <div class="row">   
                    <div class="col-md-3 p0 padding-top-40">
                        <div class="blog-asside-right pr0">
                            <div class="panel panel-default sidebar-menu" >
                                <div class="panel-heading">
                                    <h3 class="panel-title">Refine Search</h3>
                                </div>
                                <div class="panel-body search-widget">
                                    <form action="RefinedSearch" method="post" class="form-inline"> 
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <select name="city" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select Location">
                                                        <option value="All">All Locations</option>
                                                        <c:forEach items="${cityList}" var="city">
                                                            <c:choose>
                                                                <c:when test="${selectedCity.equals(city)}">
                                                                    <option value="${city}" selected="selected">${city}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${city}">${city}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <select name="style" class="selectpicker" title="Select Style">
                                                        <option value="All">All Styles</option>
                                                        <c:forEach items="${propertyStyles}" var="style">
                                                            <c:choose>
                                                                <c:when test="${selectedStyle.equals(style.styleId)}">
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
                                        </fieldset>
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <select name="priceRange" class="selectpicker" title="Select Price Range">
                                                        <option value="All">All Prices</option>
                                                        <c:choose>
                                                            <c:when test="${priceRange.equals('below75000')}">
                                                                <option value="below75000" selected="selected">Under <fmt:formatNumber value="75000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="below75000">Under <fmt:formatNumber value="75000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${priceRange.equals('75000To250000')}">
                                                                <option value="75000To250000" selected="selected"><fmt:formatNumber value="75000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                                                    <fmt:formatNumber value="250000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                                </option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="75000To250000"><fmt:formatNumber value="75000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                                                    <fmt:formatNumber value="250000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                                </option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${priceRange.equals('250000To425000')}">
                                                                <option value="250000To425000" selected="selected"><fmt:formatNumber value="250000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                                                    <fmt:formatNumber value="425000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                                </option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="250000To425000"><fmt:formatNumber value="250000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                                                    <fmt:formatNumber value="425000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                                </option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${priceRange.equals('425000To600000')}">
                                                                <option value="425000To600000" selected="selected"><fmt:formatNumber value="425000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                                                    <fmt:formatNumber value="600000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                                </option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="425000To600000"><fmt:formatNumber value="425000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/> - 
                                                                    <fmt:formatNumber value="600000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                                </option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${priceRange.equals('over600000')}">
                                                                <option value="over600000" selected="selected">Over <fmt:formatNumber value="600000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="over600000">Over <fmt:formatNumber value="600000" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>                                              
                                                </div>                                           
                                            </div>
                                        </fieldset>                                
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <select name="footage" class="selectpicker" title="Select Square Footage">
                                                        <option value="All">All Sizes</option>
                                                        <option value="under1000">Under <fmt:formatNumber value="1000" type="number" maxFractionDigits="0"/> sq. ft.</option>
                                                        <option value="1000To2000"><fmt:formatNumber value="1000" type="number" maxFractionDigits="0"/> - 
                                                            <fmt:formatNumber value="2000" type="number" maxFractionDigits="0"/> sq. ft.
                                                        </option>
                                                        <option value="2000To3000"><fmt:formatNumber value="2000" type="number" maxFractionDigits="0"/> - 
                                                            <fmt:formatNumber value="3000" type="number" maxFractionDigits="0"/> sq. ft.
                                                        </option>
                                                        <option value="3000To5000"><fmt:formatNumber value="3000" type="number" maxFractionDigits="0"/> - 
                                                            <fmt:formatNumber value="5000" type="number" maxFractionDigits="0"/> sq. ft.
                                                        </option>
                                                        <option value="over5000">Over <fmt:formatNumber value="5000" type="number" maxFractionDigits="0"/> sq. ft.</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <select name="bedrooms" class="selectpicker" title="Select Number of Bedrooms">
                                                        <option value="All">Any</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4+">4+</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset >
                                            <div class="row">
                                                <div class="col-xs-12">  
                                                    <input class="button btn largesearch-btn" value="Search" type="submit">
                                                </div>  
                                            </div>
                                        </fieldset>                                     
                                    </form>
                                </div>
                            </div>

                            <div class="panel panel-default sidebar-menu">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Most Popular</h3>
                                </div>
                                <div class="panel-body recent-property-widget">
                                    <ul>
                                        <c:forEach items="${mostPopular}" var="property">
                                            <li>
                                                <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                    <a href="LoadSinglePage?propertyId=${property.id}"><img class="image" src="assets/images/properties/thumbs/${property.photo}"></a>
                                                    <span class="property-seeker">
                                                        <b class="b-1"><img src="assets/images/BER/${property.berRating}.png"></b>
                                                    </span>
                                                </div>
                                                <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                    <h6> <a href="LoadSinglePage?propertyId=${property.id}">${property.city} </a></h6>
                                                    <span class="property-price">
                                                        <fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                    </span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9  pr0 padding-top-40 properties-page">
                        <div class="col-md-12 clear"> 
                            <div id="list-type" class="proerty-th">
                                <c:forEach items="${propertyList}" var="property">
                                    <div class="col-sm-6 col-md-4 p0">
                                        <div class="box-two proerty-item">
                                            <div class="item-thumb">
                                                <a href="LoadSinglePage?propertyId=${property.id}" ><img src="assets/images/properties/thumbs/${property.photo}"></a>
                                            </div>

                                            <div class="item-entry overflow">
                                                <h5><a href="LoadSinglePage?propertyId=${property.id}"> ${property.city}</a></h5>
                                                <div class="dot-hr"></div>
                                                <span class="pull-left"><b> Area :</b> 
                                                    <fmt:formatNumber value="${property.squarefeet}" type="number" maxFractionDigits="0"/>m<sup>2</sup> </span>
                                                <span class="proerty-price pull-right"> 
                                                    <fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                                </span>
                                                <p style="display: none;">${property.description}</p>
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
            </div>
        </div>
        <div class="footer-area">
            <div class="footer-copy text-center">
                <div class="container">
                    <div class="row">
                        <div class="pull-left">
                            <span>&copy; <a href="login.jsp">Thaynara Silva</a>, All rights reserved 2017</span> 
                        </div> 
                        <div class="bottom-menu pull-right"> 
                            <ul> 
                                <li><a class="wow" href="index.jsp">Home</a></li>
                                <li><a class="wow" href="LoadGalleryPage">Gallery</a></li>
                                <li><a class="wow" href="LoadFavouritesPage">Favourites</a></li>
                                <li><a class="wow" href="contactUs.jsp">Contact Us</a></li>
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
