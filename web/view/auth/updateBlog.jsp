<%-- 
    Document   : updateBlog
    Created on : Oct 19, 2021, 9:48:05 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Blog</title>
    </head>
    <body>
        <form action="blogUpdate" method="POST">
            <input type="text" name="title" value="${requestScope.blog.title}"><br>
            <input type="text" name="description" value="${requestScope.blog.description}"><br>
            <input type="hidden" name="id" value="${requestScope.blog.id}">
            <input type="submit" value="Publish">
        </form>
    </body>
</html>-->
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>${requestScope.blog.title}: Edit</title>

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
            <h1 class="blog-name pt-lg-4 mb-0"><br><i class="fas fa-user-circle fa-fw me-2"></i><a class="no-text-decoration" style="font-size: 25px; font-family: sans-serif; font-weight: bold" href="../blog/userDetail?id=${sessionScope.account.user.id}">${sessionScope.account.user.displayName}'s Blog</a></h1>

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
                            <a class="nav-link" href="insertBlog"><i class="fas fa-plus fa-fw me-2"></i> New Blog</a>
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
                        <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="blogUpdate" method="POST">
                            <div class="col-12 col-md-9">
                                <label class="sr-only" for="title"></label>
                                <input type="text" id="title" name="title" class="form-control me-md-1 searchBlog" placeholder="Title here" value="${requestScope.blog.title}">
                            </div>
                            <br>
                            <div class="col-12 col-md-9">
                                <label class="sr-only" for="description"></label>
                                <textarea type="text" id="description" name="description" class="form-control me-md-1 description" style="height: 60vh; resize: none;">${requestScope.blog.description}</textarea>
                            </div>
                            <br>
                            <input type="hidden" name="id" value="${requestScope.blog.id}">
                            <div>
                                <button class="btn btn-primary btn-sm" type="submit">Publish</button>
                                <a class="btn btn-outline-primary btn-sm" type="button" onclick="doCancel()">Cancel</a>
                            </div>
                        </form>
    <!--                        <h2 class="title mb-2">${requestScope.blog.title}</h2>
                    <div class="meta mb-3"><span class="date">Published since ${requestScope.blog.from}</span></div>
                </header>
    
                <div class="blog-post-body">
    
                    <p>${requestScope.blog.description}</p>
    
                </div>-->
                        <!--
                        <c:if test="${!empty requestScope.blog.comments}">
                            <div class="container mt-5">
                                <div class="d-flex justify-content-center row">
                                    <div class="col-md-10">
                                        <div class="d-flex flex-column comment-section">
                            <c:forEach items="${requestScope.blog.comments}" var="c">
                                <div class="bg-white p-2">
                                    <div class="d-flex flex-row user-info">
                                        <div class="d-flex flex-column justify-content-start ml-2"><span class="d-block font-weight-bold name">${c.user.displayName}</span><span class="date text-black-50">Posted since ${c.from}</span></div>
                                    </div>
                                    <div class="mt-2">
                                        <p class="comment-text">${c.description}</p>
                                    </div>
                                </div>
                            </c:forEach>
    
                        </div>
                    </div>
                </div>
            </div>
                        </c:if>
                        <form action="blogDetail" method="POST">
                            <div class="bg-light p-2">
                                <div class="d-flex flex-row align-items-start"><span class="d-block font-weight-bold name">${sessionScope.account.user.displayName}</span><textarea class="form-control ml-1 shadow-none textarea" name="cmt"></textarea><input type="hidden" value="${requestScope.blog.id}" name="blgid"></div>
                                    <div class="mt-2 text-right"><button class="btn btn-primary btn-sm shadow-none" type="submit">Post comment</button></div>
                                </div>
                            </form>
                            
                        <nav class="blog-nav nav nav-justified my-5">
                            <a class="nav-link-prev nav-item nav-link rounded-left" href="#">Previous<i class="arrow-prev fas fa-long-arrow-alt-left"></i></a>
                            <a class="nav-link-next nav-item nav-link rounded-right" href="#">Next<i class="arrow-next fas fa-long-arrow-alt-right"></i></a>
                        </nav>-->

                        <div class="blog-comments-section">
                            <div id="disqus_thread"></div>
                            <script>
                                /**
                                 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT 
                                 *  THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR 
                                 *  PLATFORM OR CMS.
                                 *  
                                 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: 
                                 *  https://disqus.com/admin/universalcode/#configuration-variables
                                 */
                                /*
                                 var disqus_config = function () {
                                 // Replace PAGE_URL with your page's canonical URL variable
                                 this.page.url = PAGE_URL;  
                                 
                                 // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                                 this.page.identifier = PAGE_IDENTIFIER; 
                                 };
                                 */

                                (function () {  // REQUIRED CONFIGURATION VARIABLE: EDIT THE SHORTNAME BELOW
                                    var d = document, s = d.createElement('script');

                                    // IMPORTANT: Replace 3wmthemes with your forum shortname!
                                    s.src = 'https://3wmthemes.disqus.com/embed.js';

                                    s.setAttribute('data-timestamp', +new Date());
                                    (d.head || d.body).appendChild(s);
                                })();
                            </script>
                            <noscript>
                            Please enable JavaScript to view the 
                            <a href="https://disqus.com/?ref_noscript" rel="nofollow">
                                comments powered by Disqus.
                            </a>
                            </noscript>
                        </div><!--//blog-comments-section-->

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