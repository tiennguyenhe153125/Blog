<%-- 
    Document   : updateComment
    Created on : Oct 23, 2021, 10:41:03 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Comment</title>
    </head>
    <body>
        <form action="updateComment" method="POST">
            <input type="hidden" value="${requestScope.blog.id}" name="blgid">
            <input type="hidden" value="${requestScope.comment.id}" name="cmtid">
            <h3>${sessionScope.account.user.displayName}</h3>
            <input name="cmt" type="text" value="${requestScope.comment.description}">
            <input type="submit" value="Send">
        </form>
    </body>
</html>-->

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Comment: Edit</title>

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
                            <a class="nav-link" href="../blog/listBlog"><i class="fas fa-home fa-fw me-2"></i> Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../blog/myList?id=${sessionScope.account.user.id}"><i class="fas fa-bookmark fa-fw me-2"></i>My Post</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="insertBlog"><i class="fas fa-plus fa-fw me-2"></i> New Blog </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../blog/userDetail?id=${sessionScope.account.user.id}"><i class="fas fa-info fa-fw me-2"></i>About Me</a>
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
                        <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="updateComment" method="POST">
                            <header class="blog-post-header">
                                <h2 class="title mb-2">${requestScope.blog.title}</h2>
                                <div class="meta mb-3"><span class="date">Published since ${requestScope.blog.from}</span></div>
                            </header>
                            <br>
                            <div class="col-12 col-md-9">
                                <label class="sr-only" for="cmt"></label>
                                <textarea type="text" id="cmt" name="cmt" class="form-control me-md-1 description" style="height: 60vh;
                                          padding: 10px;
                                          max-width: 100%;
                                          line-height: 1.5;
                                          border-radius: 5px;
                                          border: 1px solid #ccc;
                                          resize: none">${requestScope.comment.description}</textarea>
                            </div>
                            <br>
                            <input type="hidden" name="blgid" value="${requestScope.blog.id}">
                            <input type="hidden" name="cmtid" value="${requestScope.comment.id}">
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