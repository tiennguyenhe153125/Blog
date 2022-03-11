<%-- 
    Document   : login
    Created on : Oct 13, 2021, 3:34:44 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="login" method="POST"> 
            Username: <input type="text" name="user"/> <br/>
            Password:<input type="password" name ="pass" /> <br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="bootstrap/login/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="bootstrap/login/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="bootstrap/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="bootstrap/login/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="bootstrap/login/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="bootstrap/login/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="bootstrap/login/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="bootstrap/login/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="bootstrap/login/css/util.css">
        <link rel="stylesheet" type="text/css" href="bootstrap/login/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="login" method="POST">
                        <span class="login100-form-title">
                            Sign In
                        </span>
                        <c:if test="${requestScope.alert != null}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.alert}
                            </div>
                        </c:if>
                        <c:if test="${requestScope.success != null}">
                            <div class="alert alert-success" role="alert">
                                ${requestScope.success}
                            </div>
                        </c:if>
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                            <input class="input100" type="text" name="user" pattern="[a-zA-Z0-9@_.]+" value="${requestScope.username}" placeholder="Username">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Please enter password">
                            <input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" value="${requestScope.password}" placeholder="Password">
                            <span class="focus-input100"></span>
                        </div>

                        
                        <div class="text-right p-t-13 p-b-23">
                            <input class="txt1" type="checkbox" name="remember" ${(requestScope.remember != null)?"checked=\"checked\"":""}> Remember me
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Sign in
                            </button>
                        </div>

                        <div class="flex-col-c p-t-170 p-b-40">
                            <a href="blog/listBlog" class="txt2">
                                Home
                            </a>
                            <span class="txt1 p-b-9">
                                Don’t have an account?
                            </span>

                            <a href="signUp" class="txt3">
                                Sign up now
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--===============================================================================================-->
        <script src="bootstrap/login/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="bootstrap/login/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="bootstrap/login/vendor/bootstrap/js/popper.js"></script>
        <script src="bootstrap/login/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="bootstrap/login/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="bootstrap/login/vendor/daterangepicker/moment.min.js"></script>
        <script src="bootstrap/login/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="bootstrap/login/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="bootstrap/login/js/main.js"></script>

    </body>
</html>