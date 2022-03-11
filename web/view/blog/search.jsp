<%-- 
    Document   : search
    Created on : Nov 1, 2021, 5:06:55 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Blogger</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Blog Template">
        <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
        <link rel="shortcut icon" href="../bootstrap/favicon.ico"> 

        <!-- FontAwesome JS-->
        <script defer src="../bootstrap/assets/fontawesome/js/all.min.js"></script>

        <!-- Theme CSS -->  
        <link id="theme-style" rel="stylesheet" href="../bootstrap/assets/css/theme-1.css">

    </head> 

    <body>

        <header class="header text-center">	
            <c:if test="${sessionScope.account != null}">
                <h1 class="blog-name pt-lg-4 mb-0"><i class="fas fa-user-circle fa-fw me-2"></i><a class="no-text-decoration" href="listBlog">${sessionScope.account.user.displayName}'s Blog</a></h1>
                    </c:if>
            <nav class="navbar navbar-expand-lg navbar-dark" >

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div id="navigation" class="collapse navbar-collapse flex-column" >
                    <div class="profile-section pt-3 pt-lg-0">			
                        <c:if test="${sessionScope.account != null}">
                            <div class="bio mb-3">Hi, ${sessionScope.account.user.displayName}.</div><!--//bio-->
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <a class="nav-link" href="../login" style="color: black"><i class="fas fa-sign-in-alt fa-fw me-2"></i>Login</a>
                            <a class="nav-link" href="../signUp" style="color: black"><i class="fas fa-user-plus fa-fw me-2"></i>Sign Up</a>
                        </c:if>
                        <!--					<ul class="social-list list-inline py-3 mx-auto">
                                                            <li class="list-inline-item"><a href="#"><i class="fab fa-twitter fa-fw"></i></a></li>
                                                            <li class="list-inline-item"><a href="#"><i class="fab fa-linkedin-in fa-fw"></i></a></li>
                                                            <li class="list-inline-item"><a href="#"><i class="fab fa-github-alt fa-fw"></i></a></li>
                                                            <li class="list-inline-item"><a href="#"><i class="fab fa-stack-overflow fa-fw"></i></a></li>
                                                            <li class="list-inline-item"><a href="#"><i class="fab fa-codepen fa-fw"></i></a></li>
                                                        </ul>//social-list-->
                        <hr> 
                    </div><!--//profile-section-->

                    <ul class="navbar-nav flex-column text-start">

                        <li class="nav-item">
                            <a class="nav-link active" href="listBlog"><i class="fas fa-home fa-fw me-2"></i> Home </a>
                        </li>
                        <c:if test="${sessionScope.account.group.id == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="../auth/listUser"><i class="fas fa-list fa-fw me-2"></i>List User</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account != null && sessionScope.account.user.id != requestScope.user.id}">
                            <li class="nav-item">
                                <a class="nav-link" href="myList?id=${sessionScope.account.user.id}"><i class="fas fa-bookmark fa-fw me-2"></i>My Post</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="../auth/insertBlog"><i class="fas fa-plus fa-fw me-2"></i> New Blog </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="userDetail?id=${sessionScope.account.user.id}"><i class="fas fa-info fa-fw me-2"></i>About Me</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.account != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="../logout"><i class="fas fa-sign-out-alt fa-fw me-2"></i>Logout</a>
                            </li>
                        </c:if>
                    </ul>

                    <!--				<div class="my-2 my-md-3">
                                                        <a class="btn btn-primary" href="https://themes.3rdwavemedia.com/" target="_blank">Get in Touch</a>
                                                    </div>-->
                </div>
            </nav>
        </header>

        <div class="main-wrapper">

            <section class="cta-section theme-bg-light py-5">
                <div class="container text-center single-col-max-width">
                    <h2 class="heading">Blog for everyone</h2>

                    <div class="single-form-max-width pt-3 mx-auto">
                        <form class="signup-form row g-2 g-lg-2 align-items-center">
                            <div class="col-12 col-md-9">
                                <label class="sr-only" for="searchBlog"></label>
                                <input type="text" id="searchBlog" name="title" class="form-control me-md-1 searchBlog" placeholder="Enter blog title" value="${requestScope.title}">
                            </div>
                            <div class="col-12 col-md-2">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </form><!--//signup-form-->
                    </div><!--//single-form-max-width-->
                </div><!--//container-->
            </section>


            <section class="blog-list px-3 py-5 p-md-5">

                <c:if test="${requestScope.blogs != null}"> 
                    <c:forEach items="${requestScope.blogs}" var="b">
                        <div class="container single-col-max-width">
                            <div class="item mb-5">
                                <div class="row g-3 g-xl-0">
                                    <div class="col">
                                        <h3 class="title mb-1" style="word-break: break-all;overflow: hidden;
                                            text-overflow: ellipsis;
                                            display: -webkit-box;
                                            -webkit-line-clamp: 2; /* number of lines to show */
                                            -webkit-box-orient: vertical;"><a class="text-link" href="blogDetail?id=${b.id}" style="color: #0080FF">${b.title}</a></h3>
                                        <div class="meta mb-1"><span class="date">Published since ${b.from}</span></div>
                                        <div class="intro" style="word-break: break-all;overflow: hidden;
                                             text-overflow: ellipsis;
                                             display: -webkit-box;
                                             -webkit-line-clamp: 2; /* number of lines to show */
                                             -webkit-box-orient: vertical;">${b.description}</div>
                                        <a class="text-link" href="blogDetail?id=${b.id}">Read more &rarr;</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                        </div>
                    </c:forEach>
                </c:if>

                <!--                <c:if test="${requestScope.totalpage > 1}">
                                    <div class="container single-col-max-width">
                                        <nav class="blog-nav nav nav-justified my-5">
                                            <a class="nav-link-prev nav-item nav-link d-none rounded-left" onclick="doPrev(${requestScope.pageindex})">Previous<i class="arrow-prev fas fa-long-arrow-alt-left"></i></a>
                                            <span class="nav-link-prev nav-item nav-link rounded">${requestScope.pageindex}</span>
                                            <a class="nav-link-next nav-item nav-link rounded" onclick="doNext(${requestScope.pageindex}, ${requestScope.totalpage})">Next<i class="arrow-next fas fa-long-arrow-alt-right"></i></a>
                                        </nav>
                                    </div>
                </c:if> -->
            </section>

            <footer class="footer text-center py-2 theme-bg-dark" style="position:fixed;
                    left:0px;
                    bottom:0px;
                    z-index:1;
                    width:100%;">

                <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
                <small class="copyright">PRJ301</small>

            </footer>

        </div><!--//main-wrapper-->


        <!-- Javascript -->          
        <script src="../bootstrap/assets/plugins/popper.min.js"></script> 
        <script src="../bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
        <!--<script src="../js/pager/pager_listBLog.js" type="text/javascript"></script>-->


    </body>
</html> 
