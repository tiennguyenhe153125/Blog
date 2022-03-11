<%-- 
    Document   : insertBlog
    Created on : Oct 17, 2021, 8:24:27 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Blog</title>
    </head>
    <body>
        <form action="insertBlog" method="POST">
            <input type="text" name="title" placeholder="Title here"><br>
            <input type="text" name="description"><br>
            <input type="submit" value="Publish">
        </form>
    </body>
</html>-->

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>New blog</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Blog Template">
        <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
        <link rel="shortcut icon" href="../bootstrap/favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="../bootstrap/login/css/main.css" />
        <!-- FontAwesome JS-->
        <script defer src="../bootstrap/assets/fontawesome/js/all.min.js"></script>

        <!-- Plugin CSS -->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.14.2/styles/monokai-sublime.min.css">

        <!-- Theme CSS -->  
        <link id="theme-style" rel="stylesheet" href="../bootstrap/assets/css/theme-1.css">
        <link id="comment" rel="stylesheet" href="../bootstrap/assets/css/comment.css">
        <!-- Summernote --> 
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

    </head> 

    <body style="overflow-x: hidden; min-height: 100%;">

        <header class="header text-center">	    
            <h1 class="blog-name pt-lg-4 mb-0"><i class="fas fa-user-circle fa-fw me-2"></i><a class="no-text-decoration" style="font-size: 25px; font-family: sans-serif; font-weight: bold" href="../blog/userDetail?id=${sessionScope.account.user.id}">${sessionScope.account.user.displayName}'s Blog</a></h1>

            <nav class="navbar navbar-expand-lg navbar-dark" >

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div id="navigation" class="collapse navbar-collapse flex-column" >

                    <ul class="navbar-nav flex-column text-start">
                        <li class="nav-item">
                            <a class="nav-link" href="../blog/listBlog"><i class="fas fa-home fa-fw me-2"></i> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../blog/myList?id=${sessionScope.account.user.id}"><i class="fas fa-bookmark fa-fw me-2"></i>My Post</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="insertBlog"><i class="fas fa-plus fa-fw me-2"></i> New Blog </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../blog/userDetail?id=${sessionScope.account.user.id}"><i class="fas fa-info fa-fw me-2"></i>About Me</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="../logout"><i class="fas fa-sign-out-alt fa-fw me-2"></i>Logout</a>
                        </li>
                    </ul>

                    <!--				<div class="my-2 my-md-3">
                                                            
                                                        <a class="btn btn-primary" href="https://themes.3rdwavemedia.com/" target="_blank">Get in Touch</a>
                                                        
                                                    </div>-->
                </div>
            </nav>
        </header>

        <section style="height: 96vh; background-color: white;">
            <div class="main-wrapper">

                <article class="blog-post px-3 py-5 p-md-5">
                    <div class="container single-col-max-width">
                        <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="insertBlog" method="POST">
                            <div class="col-12 col-md-9">
                                <label class="sr-only" for="title"></label>
                                <textarea type="text" id="title" name="title" class="form-control me-md-1 searchBlog" style="height: 6vh; resize: none;" placeholder="Title here"></textarea>
                            </div>
                            <br>
                            <div class="col-12 col-md-9">
                                <label class="sr-only" for="description"></label>
                                <textarea type="text" id="description" name="description" class="form-control me-md-1 description" style="height: 60vh; resize: none;"></textarea>
                            </div>
                            <br>
                            <div>
                                <button class="btn btn-primary btn-sm" type="submit">Publish</button>
                                <a class="btn btn-outline-primary btn-sm" type="button" onclick="doCancel()">Cancel</a>
                            </div>

                        </form>

                    </div><!--//container-->
                </article>
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

    <!-- Page Specific JS -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.14.2/highlight.min.js"></script>

    <!-- Custom JS -->
    <script src="../bootstrap/assets/js/blog.js"></script> 

    <script>
                                    function doCancel() {
                                        window.history.back();
                                    }
    </script>
</body>
</html> 