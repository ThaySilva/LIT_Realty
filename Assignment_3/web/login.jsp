<%-- 
    Document   : login
    Created on : 15-Jan-2018, 01:28:10
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
        <title>LIT Realty Login</title>
        <meta name="author" content="Thaynara Silva">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Stylesheet Links -->
        <link href="assets/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/nprogress/nprogress.css" rel="stylesheet" type="text/css"/>
        <link href="assets/animate.css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.min.css" rel="stylesheet" type="text/css"/>
        <!-- Font Links -->
        <link href="assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="login">
        <shiro:guest>
            <div>
                <a class="hiddenanchor" id="signup"></a>
                <a class="hiddenanchor" id="signin"></a>

              <div class="login_wrapper">
                <div class="animate form login_form">
                  <section class="login_content">
                    <form name="loginform" method="post">
                      <h1>Login Form</h1>
                      <div>
                        <input type="text" class="form-control" placeholder="Username" id="username" name="username" required="" />
                      </div>
                      <div>
                        <input type="password" class="form-control" placeholder="Password" id="password" name="password" required="" />
                      </div>
                      <div>
                          <input type="submit" value="Login" class="btn-submit"/>
                        <!-- <a class="reset_pass" href="#">Lost your password?</a> -->
                      </div>

                      <div class="clearfix"></div>

                      <div class="separator">
                        <!-- <p class="change_link">New to site?
                          <a href="#signup" class="to_register"> Create Account </a>
                        </p> -->

                        <div class="clearfix"></div>
                        <br />
                        <div>
                            <a href="index.jsp"><img src="assets/images/logo.gif" alt=""/></a>
                        </div>
                      </div>
                    </form>
                  </section>
                </div>

                <div id="register" class="animate form registration_form">
                  <section class="login_content">
                    <form>
                      <h1>Create Account</h1>
                      <div>
                        <input type="text" class="form-control" placeholder="Username" id="username" name="username" required="" />
                      </div>
                      <div>
                        <input type="email" class="form-control" placeholder="Email" required="" />
                      </div>
                      <div>
                        <input type="password" class="form-control" placeholder="Password" required="" />
                      </div>
                      <div>
                        <a class="btn btn-default submit" href="index.html">Submit</a>
                      </div>

                      <div class="clearfix"></div>

                      <div class="separator">
                        <p class="change_link">Already a member ?
                          <a href="#signin" class="to_register"> Log in </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                        <div>
                          <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                          <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                        </div>
                      </div>
                    </form>
                  </section>
                </div>
              </div>
            </div>
        </shiro:guest>
        <shiro:user>
            <jsp:include page="LoadAdminIndex" />
        </shiro:user>
  </body>
</html>

