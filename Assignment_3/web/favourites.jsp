<%-- 
    Document   : favourites
    Created on : 08-Jan-2018, 19:50:19
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
                        <li class="wow"><a href="LoadGalleryPage">Gallery</a></li>
                        <li class="wow"><a href="LoadFavouritesPage" class="dropdown-toggle active">Favourites</a></li>
                        <li class="wow"><a href="contactUs.jsp">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">Favourites</h1>               
                    </div>
                </div>
            </div>
        </div>
        <div class="content-area blog-page padding-top-40" style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">   
                <div class="row">    
                    <div class="blog-asside-right col-md-3">
                        <div class="panel panel-default sidebar-menu wow">
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
                    <div class="blog-lst col-md-9">
                        <c:if test="${message.equals(true)}">
                            <div class="text-center padding-b-50">
                                <h2 class="wow">You currently have no favourite properties. Please visit our gallery!</h2>
                                <div class="title-line wow"></div>
                            </div>
                        </c:if>
                        <c:forEach items="${properties}" var="property">
                            <section class="post">
                                <div class="text-center padding-b-50">
                                    <h2 class="wow">${property.city}</h2>
                                    <div class="title-line wow"></div>
                                </div>
                                <c:forEach items="${agents}" var="agent">
                                    <c:if test="${property.agentId == agent.agentId}">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="author-category">
                                                    Agent ${agent.name}
                                                </p>
                                            </div>
                                            <div class="col-sm-6 right" >
                                                <p class="date-comments">
                                                    <i class="fa fa-phone"></i> ${agent.phone}
                                                    <a href="mailto:${agent.email}"> <i class="fa fa-envelope"></i> ${agent.email}</a>
                                                </p>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                <div class="image wow">
                                    <a href="LoadSinglePage?propertyId=${property.id}">
                                        <img src="assets/images/properties/large/${property.listingNum}/${property.listingNum}.JPG" class="img-responsive" alt="Example blog post alt">
                                    </a>
                                </div>
                                <p class="intro">${property.description}</p>
                                <p class="read-more">
                                    <a href="DeleteFavourite?propertyID=${property.listingNum}" class="btn btn-default btn-border">Delete From Favourites</a>
                                    <a href="LoadSinglePage?propertyId=${property.id}" class="btn btn-default btn-border">See More</a>
                                </p>
                            </section>
                        </c:forEach>
                    </div> 

                </div>

            </div>
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
