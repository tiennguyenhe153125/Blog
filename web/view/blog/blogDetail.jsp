<%-- 
    Document   : blogDetail
    Created on : Oct 14, 2021, 8:23:53 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.blog.title}</title>
        <script>
            function doEdit(id) {
                window.location.href = "updateComment?id=" + id;
            }
            function doDelete(id) {
                var c = confirm("Are you sure?");
                if (c) {
                    window.location.href = "deleteComment?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <h1>${requestScope.blog.title}</h1>
        <h5>${requestScope.blog.user.displayName} - Created: ${requestScope.blog.from}</h5><br>
        <h3>${requestScope.blog.description}</h3>


        COMMENT <br>
<c:if test="${!empty requestScope.blog.comments}">
    <table border="1px">
    <c:forEach items="${requestScope.blog.comments}" var="c">
        <tr>
            <td>${c.user.displayName}</td>
            <td>${c.description}</td>
        <c:if test="${c.user.id == sessionScope.account.user.id}">
            <td><input type="button" value="Edit" onclick="doEdit(${c.id})"></td>
            <td><input type="button" value="Delete" onclick="doDelete(${c.id})"></td>
        </c:if>
</tr>
    </c:forEach>
</table>
</c:if>
<br>
<form action="blogDetail" method="POST">
    <input type="hidden" value="${requestScope.blog.id}" name="blgid">
    <input name="cmt" type="text">
    <input type="submit" value="Send">
</form>

</body>
</html>-->

<!DOCTYPE html>
<html lang="en" style="background-color: white"> 
    <head>
        <title>${requestScope.blog.title}</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Blog Template">
        <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
        <link rel="shortcut icon" href="../bootstrap/favicon.ico"> 

        <!-- FontAwesome JS-->
        <script defer src="../bootstrap/assets/fontawesome/js/all.min.js"></script>

        <!-- Plugin CSS -->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.14.2/styles/monokai-sublime.min.css">

        <!-- Theme CSS -->  
        <link id="theme-style" rel="stylesheet" href="../bootstrap/assets/css/theme-1.css">
        <link id="comment" rel="stylesheet" href="../bootstrap/assets/css/comment.css">

        <script>
            function doDelete(id) {
                var c = confirm("Are you sure?");
                if (c) {
                    window.location.href = "../auth/blogDelete?id=" + id;
                }
            }

            function doDelCmt(id) {
                var c = confirm("Are you sure?");
                if (c) {
                    window.location.href = "../auth/deleteComment?id=" + id;
                }
            }

        </script>
    </head> 

    <body style="body {
              overflow-x: hidden;
              min-height: 100%;
          }">

        <header class="header text-center">	    
            <h1 class="blog-name pt-lg-4 mb-0"><i class="fas fa-user-circle fa-fw me-2"></i>Blogger<br><a class="no-text-decoration" href="userDetail?id=${requestScope.blog.user.id}">${requestScope.blog.user.displayName}</a></h1>

            <nav class="navbar navbar-expand-lg navbar-dark" >

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div id="navigation" class="collapse navbar-collapse flex-column" >
                    <div class="profile-section pt-3 pt-lg-0">
                        <!--<img class="profile-image mb-3 rounded-circle mx-auto" src="../bootstrap/assets/images/profile.png" alt="image" >-->			

                        <div class="bio mb-3">Hi, my name is ${requestScope.blog.user.displayName}.<br><a href="userDetail?id=${requestScope.blog.user.id}"> Find out more about me</a></div> <!--bio-->
                        <hr>
                    </div><!--//profile-section-->

                    <ul class="navbar-nav flex-column text-start">
                        <li class="nav-item">
                            <a class="nav-link" href="listBlog"><i class="fas fa-home fa-fw me-2"></i> Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="myList?id=${requestScope.blog.user.id}"><i class="fas fa-bookmark fa-fw me-2"></i>My Post</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="userDetail?id=${requestScope.blog.user.id}"><i class="fas fa-info fa-fw me-2"></i>About Me</a>
                        </li>

                        <c:if test="${sessionScope.account eq null}">
                            <li class="nav-item">
                                <a class="nav-link" href="../login"><i class="fas fa-sign-in-alt fa-fw me-2"></i>Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../signUp"><i class="fas fa-user-plus fa-fw me-2"></i>Sign Up</a>
                            </li>
                        </c:if>
                    </ul>

                    <!--				<div class="my-2 my-md-3">
                                                            
                                                        <a class="btn btn-primary" href="https://themes.3rdwavemedia.com/" target="_blank">Get in Touch</a>
                                                        
                                                    </div>-->
                </div>
            </nav>
        </header>

        <section>
            <div class="main-wrapper">

                <article class="blog-post px-3 py-5 p-md-5">
                    <div class="container single-col-max-width">
                        <header class="blog-post-header" style="text-align: center;
                                word-break: break-all;overflow: hidden;
                                text-overflow: ellipsis;
                                display: -webkit-box;
                                -webkit-box-orient: vertical;">
                            <h2 class="title mb-2" style="color: #37a0ff">${requestScope.blog.title}</h2>
                            <div class="meta mb-3"><span class="date">Published since ${requestScope.blog.from}</span></div>
                        </header>

                            <c:if test="${requestScope.blog.description != null}">
                        <div class="blog-post-body" style="padding: 10px;
                             max-width: 100%;
                             line-height: 1.5;
                             border-radius: 5px;
                             border: 1px solid #ccc;
                             margin-bottom: 10px;
                             border-style: outset">
                            ${requestScope.blog.description}
                        </div>
                            </c:if>


                        <c:if test="${requestScope.blog.user.id == sessionScope.account.user.id}">
                            <div>
                                <a class="btn btn-primary btn-sm" type="button" href="../auth/blogUpdate?id=${requestScope.blog.id}"><i class="fas fa-edit fa-fw me-2"></i>Edit</a>
                                <a class="btn btn-outline-primary btn-sm" type="button" onclick="doDelete(${requestScope.blog.id})"><i class="fas fa-trash-alt fa-fw me-2"></i>Delete</a>
                            </div>
                        </c:if>

                        <c:if test="${!empty requestScope.blog.comments}">
                            <div class="container mt-5">
                                <div class="d-flex justify-content-center row">
                                    <div class="col-md-10">
                                        <div class="d-flex flex-column comment-section">
                                            <c:forEach items="${requestScope.blog.comments}" var="c">
                                                <div class="bg-white p-2" style="padding: 10px;
                                                     max-width: 100%;
                                                     line-height: 1.5;
                                                     border-radius: 5px;
                                                     border: 1px solid #ccc;
                                                     margin-bottom: 10px;">
                                                    <div class="d-flex flex-row user-info">
                                                        <div class="d-flex flex-column justify-content-start ml-2"><span class="d-block font-weight-bold name">${c.user.displayName}</span><span class="date text-black-50">Posted since ${c.from}</span></div>
                                                    </div>
                                                    <div class="comment-text" style="overflow-wrap: break-word;">
                                                        ${c.description}
                                                    </div>
                                                    <c:if test="${c.user.id == sessionScope.account.user.id}">
                                                        <div class="d-flex flex-row-reverse" style="margin-top: 10px">
                                                            <a class="btn btn-outline-primary btn-sm" type="button" onclick="doDelCmt(${c.id})"><i class="fas fa-trash-alt fa-fw me-2"></i>Delete</a>
                                                            <a class="btn btn-primary btn-sm" type="button" style="margin-right: 5px;" href="../auth/updateComment?id=${c.id}"><i class="fas fa-edit fa-fw me-2"></i>Edit</a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <form action="blogDetail" method="POST">
                            <div class="p-3" style="background-color: #cfefd4;
                                 margin-top: 10px">
                                <div class="d-flex flex-row align-items-start"><c:if test="${sessionScope.account != null}"><span class="d-block font-weight-bold name" style="margin-right: 10px;
                                                                                                                                  padding: 5px;
                                                                                                                                  border-radius: 5px;
                                                                                                                                  border: 1px solid #ccc;
                                                                                                                                  background-color: white;
                                                                                                                                  font-weight: bolder;">${sessionScope.account.user.displayName}</span></c:if><textarea id="summernote" class="form-control ml-1 shadow-none textarea" name="cmt" style="margin-bottom: 10px; margin-top: 0px; height: 54px;"></textarea><input type="hidden" value="${requestScope.blog.id}" name="blgid"></div>
                                <div class="text-end"><button class="btn btn-primary btn-sm shadow-none" type="submit">Post comment</button></div>
                            </div>
                        </form>
                        
                        <c:if test="${requestScope.totalpage > 1}">
                            <nav class="blog-nav nav nav-justified my-5">
                                <a class="nav-link-prev nav-item nav-link rounded-left disabled" onclick="doPrev(${requestScope.pageindex})">Previous<i class="arrow-prev fas fa-long-arrow-alt-left"></i></a>
                                <span class="nav-link-prev nav-item nav-link rounded">${requestScope.pageindex}</span>
                                <a class="nav-link-next nav-item nav-link rounded-right disabled" onclick="doNext(${requestScope.pageindex}, ${requestScope.totalpage})">Next<i class="arrow-next fas fa-long-arrow-alt-right"></i></a>      
                            </nav>
                        </c:if>
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
    </body>
</html> 

