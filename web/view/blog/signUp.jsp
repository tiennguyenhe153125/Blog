<%-- 
    Document   : signUp
    Created on : Oct 14, 2021, 12:16:59 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRATION</title>
    </head>
    <body>
        <h1>REGISTRATION FORM</h1>
        <form action="signUp" method="POST"> 
            Username: <input type="text" name="user"/> <br/>
            Password:<input type="password" name ="pass" /> <br/>
            Re-input pass word: <input type="password" name ="pass1" /> <br/>
            Display name: <input type="text" name="displayName"/> <br/>
            Gender:<input name="gender" type="radio" value="male" checked="checked">Male
            <input name="gender" type="radio" value="female" >Female <br>
            Date of Birth: <input name="dob" type="date"><br>
            Address: <input type="text" name="address"/> <br/>
            <input type="submit" value="Sign Up" />
        </form>
    </body>
</html>-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sign Up</title>
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
        <link rel="stylesheet" type="text/css" href="bootstrap/login/css/cssReg.css"/>
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="signUp" method="POST">
                        <span class="login100-form-title">
                            Sign Up
                        </span>
                        <c:if test="${requestScope.alert != null}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.alert}
                            </div>
                        </c:if>
                        
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                            <input class="input100" type="text" name="user" pattern="[a-zA-Z0-9@_.]+" placeholder="Username">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter password">
                            <input class="input100" type="password" name="pass" pattern="[a-zA-Z0-9@]+" placeholder="Password">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please re-enter password">
                            <input class="input100" type="password" name="pass1" placeholder="Confirm Password">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter display name">
                            <input class="input100" type="text" name="displayName" placeholder="Display name">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="form-group">
                            <div class="radio">
                                <div class="gen-form">Gender
                                <label class="btn btn-default">
                                    <input name="gender" type="radio" value="male" checked="checked">Male
                                </label>
                                <label class="btn btn-default">
                                    <input name="gender" type="radio" value="female" >Female <br>
                                </label>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter display name">
                            <input class="input100" type="date" name="dob">
                            <span class="focus-input100"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter display name">
                            <input class="input100" type="text" name="address" placeholder="Address">
                            <span class="focus-input100"></span>
                        </div>
                        
                        <div class="text-right p-t-13 p-b-23">
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit">
                                Sign up
                            </button>
                        </div>

                        <div class="flex-col-c p-t-170 p-b-40">
                            <a href="blog/listBlog" class="txt2">
                                Home
                            </a>
                            <span class="txt1 p-b-9">
                                Already have an account?
                            </span>

                            <a href="login" class="txt3">
                                Sign in now
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