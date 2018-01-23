<%-- 
    Document   : single
    Created on : 08-Dec-2017, 20:42:29
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
        <link rel="stylesheet" href="assets/css/lightslider.min.css">
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
                        <li class="wow"><a href="LoadGalleryPage">Gallery</a></li>
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
                        <h1 class="page-title">Property in ${property.city}</h1>               
                    </div>
                </div>
            </div>
        </div>
        <div class="content-area single-property" style="background-color: #FCFCFC;">
            <div class="container">
                <div class="clearfix padding-top-40">
                    <c:if test="${message.equals(true)}">
                        <h4>This property has been successfully added to your favourites!</h4>
                    </c:if>
                    <div class="col-md-8 single-property-content ">
                        <div class="row">
                            <div class="light-slide-item">            
                                <div class="clearfix">
                                    <div class="favorite-and-print">
                                        <a class="add-to-fav" href="SetFavourites?propertyID=${property.id}" data-toggle="modal">
                                            <i class="fa fa-star"></i>
                                        </a>
                                    </div> 
                                    <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                        <c:forEach items="${imageList}" var="image">
                                            <li data-thumb="assets/images/properties/large/${property.listingNum}/${image}">
                                                <img src="assets/images/properties/large/${property.listingNum}/${image}"/>
                                            </li>
                                        </c:forEach>                                         
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="single-property-wrapper">
                            <div class="single-property-header">                                          
                                <h1 class="property-title pull-left">${property.city}</h1>
                                <span class="property-price pull-right">
                                    <fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="0"/>
                                </span>
                            </div>
                            <div class="property-meta entry-meta clearfix ">   
                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info icon-area">
                                        <i class="fa fa-arrows-alt fa-2x"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Area</span>
                                        <span class="property-info-value">
                                            <fmt:formatNumber value="${property.squarefeet}" type="number" maxFractionDigits="0"/>
                                            <b class="property-info-unit">Sq. Ft.</b></span>
                                    </span>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bed">
                                        <i class="fa fa-bed fa-2x"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Bedrooms</span>
                                        <span class="property-info-value">${property.bedrooms}</span>
                                    </span>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bath">
                                        <i class="fa fa-bath fa-2x"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Bathrooms</span>
                                        <span class="property-info-value">${property.bathrooms}</span>
                                    </span>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-garage">
                                        <i class="fa fa-car fa-2x"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Garages</span>
                                        <span class="property-info-value">${property.garagesize}</span>
                                    </span>
                                </div>
                            </div>
                            <div class="section">
                                <h4 class="s-property-title">Description</h4>
                                <div class="s-property-content">
                                    <p>${property.description}</p>
                                </div>
                            </div>
                            <div class="section additional-details">
                                <h4 class="s-property-title">Additional Details</h4>
                                <ul class="additional-details-list clearfix">
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Style</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${propertyStyle.styleName}</span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Type</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${propertyType.typeName}</span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Lot Size</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${property.lotsize}</span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Garage Type</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${propertyGarage.garageName}</span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">BER Rating</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">
                                            <img src="assets/images/BER/${property.berRating}.png"/>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Address</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">
                                            ${property.street}, ${property.city}
                                        </span>
                                    </li>
                                </ul>
                            </div>
                            <div class="section property-video"> 
                                <h4 class="s-property-title">Property Location</h4> 
                                <div class="map">
                                    <iframe
                                      src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAPh4dt9nl_uYKIkwRsZK1w1PoR9lcR0Gs
                                        &q=${propertyAddress}" allowfullscreen>
                                    </iframe>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 p0">
                        <aside class="sidebar sidebar-property blog-asside-right">
                            <div class="dealer-widget">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">
                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                                <a href="">
                                                    <img src="assets/images/agents/${propertyAgent.agentId}.jpg" class="img-circle">
                                                </a>
                                            </div>
                                            <div class="col-xs-8 col-sm-8 ">
                                                <h3 class="dealer-name">
                                                    <a href="">${propertyAgent.name}</a><br>
                                                    <span>Real Estate Agent</span>        
                                                </h3>
                                                <div class="dealer-social-media">
                                                    <a class="twitter" target="_blank" href="">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                    <a class="facebook" target="_blank" href="">
                                                        <i class="fa fa-facebook"></i>
                                                    </a>
                                                    <a class="gplus" target="_blank" href="">
                                                        <i class="fa fa-google-plus"></i>
                                                    </a>
                                                    <a class="linkedin" target="_blank" href="">
                                                        <i class="fa fa-linkedin"></i>
                                                    </a> 
                                                    <a class="instagram" target="_blank" href="">
                                                        <i class="fa fa-instagram"></i>
                                                    </a>       
                                                </div>

                                            </div>
                                        </div>
                                        <div class="clear">
                                            <ul class="dealer-contacts">                                       
                                                <li><i class="fa fa-phone"> </i>${propertyAgent.phone}</li>
                                                <li><i class="fa fa-fax"> </i> ${propertyAgent.fax}</li>
                                                <li><i class="fa fa-envelope"> </i><a href="mailto:${propertyAgent.email}"> ${propertyAgent.email}</a></li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <c:if test="${fn:length(similarProperties) > 0}">
                                <div class="panel panel-default sidebar-menu similar-property-wdg wow fadeInRight animated">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Similar Properties</h3>
                                    </div>
                                    <div class="panel-body recent-property-widget">
                                        <ul>
                                            <c:forEach items="${similarProperties}" var="property">
                                                <li>
                                                    <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                        <a href="LoadSinglePage?propertyId=${property.id}">
                                                            <img src="assets/images/properties/thumbs/${property.photo}"></a>
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
                            </c:if>



                            <div class="panel panel-default sidebar-menu wow fadeInRight animated">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Ads her  </h3>
                                </div>
                                <div class="panel-body recent-property-widget">
                                    <img src="assets/img/ads.jpg">
                                </div>
                            </div>
                        </aside>
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

        <script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
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
        <script type="text/javascript" src="assets/js/lightslider.min.js"></script>
        <script src="assets/js/main.js"></script>

        <script>
                            $(document).ready(function () {

                                $('#image-gallery').lightSlider({
                                    gallery: true,
                                    item: 1,
                                    thumbItem: 9,
                                    slideMargin: 0,
                                    speed: 500,
                                    auto: true,
                                    loop: true,
                                    onSliderLoad: function () {
                                        $('#image-gallery').removeClass('cS-hidden');
                                    }
                                });
                            });
        </script>

    </body>
</html>
