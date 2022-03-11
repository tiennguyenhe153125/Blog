<%-- 
    Document   : listuser
    Created on : Oct 13, 2021, 3:49:23 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="../bootstrap/adminlist/css/listUser.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script defer src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Address</th>
            </tr>

<c:forEach items="${requestScope.users}" var="u">
    <tr>
        <td>${u.id}</td>
        <td>${u.displayName}</td>
        <td>${u.gender}</td>
        <td>${u.dob}</td>
        <td>${u.address}</td>
    </tr>
</c:forEach>
</table>
</body>
</html>-->

<!--<div class="container mt-5 mb-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-10">
            <div class="row p-2 bg-white border rounded">
                <div class="col-md-3 mt-1"><img class="img-fluid img-responsive rounded product-image" src="https://i.imgur.com/QpjAiHq.jpg"></div>
                <div class="col-md-6 mt-1">
                    <h5>Quant olap shirts</h5>
                    <div class="d-flex flex-row">
                        <div class="ratings mr-2"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></div><span>310</span>
                    </div>
                    <div class="mt-1 mb-1 spec-1"><span>100% cotton</span><span class="dot"></span><span>Light weight</span><span class="dot"></span><span>Best finish<br></span></div>
                    <div class="mt-1 mb-1 spec-1"><span>Unique design</span><span class="dot"></span><span>For men</span><span class="dot"></span><span>Casual<br></span></div>
                    <p class="text-justify text-truncate para mb-0">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.<br><br></p>
                </div>
                <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                    <div class="d-flex flex-row align-items-center">
                        <h4 class="mr-1">$13.99</h4><span class="strike-text">$20.99</span>
                    </div>
                    <h6 class="text-success">Free shipping</h6>
                    <div class="d-flex flex-column mt-4"><button class="btn btn-primary btn-sm" type="button">Details</button><button class="btn btn-outline-primary btn-sm mt-2" type="button">Add to wishlist</button></div>
                </div>
            </div>
        </div>
    </div>
</div>-->

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>User</title>

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
            <h1 class="blog-name pt-lg-4 mb-0"><a class="no-text-decoration" href="../blog/listBlog"><i class="fas fa-user-circle fa-fw me-2"></i>${sessionScope.account.user.displayName}'s Blog</a></h1>
            <nav class="navbar navbar-expand-lg navbar-dark" >

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div id="navigation" class="collapse navbar-collapse flex-column" >
                    <div class="profile-section pt-3 pt-lg-0">			
                        
                            <c:if test="${sessionScope.account == null}">
                            <a class="nav-link" href="../login" style="color: black"><i class="fas fa-user fa-fw me-2"></i>Login</a>
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
                        <c:if test="${sessionScope.account != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="../blog/listBlog"><i class="fas fa-home fa-fw me-2"></i> Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="listUser"><i class="fas fa-list fa-fw me-2"></i>List User</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="../blog/myList?id=${sessionScope.account.user.id}"><i class="fas fa-bookmark fa-fw me-2"></i>My Post</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="../blog/userDetail?id=${sessionScope.account.user.id}"><i class="fas fa-info fa-fw me-2"></i>About Me</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="../logout"><i class="fas fa-sign-out-alt fa-fw me-2"></i>Logout</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="listBlog"><i class="fas fa-home fa-fw me-2"></i> Blog Post</a>
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
                    <h2 class="heading">List user</h2>

                    <!--                    <div class="single-form-max-width pt-3 mx-auto">
                                            <form class="signup-form row g-2 g-lg-2 align-items-center">
                                                <div class="col-12 col-md-9">
                                                    <label class="sr-only" for="searchBlog"></label>
                                                    <input type="searchBlog" id="searchBlog" name="searchBlog1" class="form-control me-md-1 searchBlog" placeholder="Enter blog title">
                                                </div>
                                                <div class="col-12 col-md-2">
                                                    <button type="submit" class="btn btn-primary">Search</button>
                                                </div>
                                            </form>//signup-form
                                        </div>//single-form-max-width
                                    </div>//container-->
            </section>


            <section class="blog-list px-3 py-5 p-md-5">
                <c:forEach items="${requestScope.accounts}" var="a">
                    <!--                    <div class="container single-col-max-width">
                                            <div class="item mb-5">
                                                <div class="row g-3 g-xl-0">
                                                    <div class="col">
                                                        <h3 class="title mb-1"><a class="text-link" href="blogDetail?id=${b.id}">${b.title}</a></h3>
                                                        <div class="meta mb-1"><span class="date">Published since ${b.from}</span></div>
                                                        <div class="intro">${b.description}</div>
                                                        <a class="text-link" href="blogDetail?id=${b.id}">Read more &rarr;</a>
                                                    </div>//col
                                                </div>//row
                                            </div>//item
                                        </div>-->
                    <div class="container mt-5 mb-5">
                        <div class="d-flex justify-content-center row">
                            <div class="col-md-10">
                                <div class="row p-2 bg-white border rounded">
                                    <div class="col-md-9 mt-1">
                                        <h5 style="color: #37a0ff">${a.user.displayName}</h5>
                                        <div class="mt-1 mb-1 spec-1"><span>ID: </span><span>${a.user.id}</span></div>
                                        <div class="mt-1 mb-1 spec-1"><span>Gender: </span><span>${(a.user.gender)?"Male":"Female"}</span></div>
                                        <div class="mt-1 mb-1 spec-1"><span>Date of birth: </span><span>${a.user.dob}</span></div>
                                        <div class="mt-1 mb-1 spec-1"><span>Address: </span><span>${a.user.address}</span></div>
                                    </div>
                                    <div class="align-items-center align-content-center col-md-3 border-left mt-1">

                                        <div class="d-flex flex-column mt-2">
                                            <c:if test="${a.group.id == 2}">
                                                <a class="btn btn-primary btn-sm mt-4" type="button" href="banUser?id=${a.user.id}">Ban</a>
                                            </c:if>
                                            <c:if test="${a.group.id == 3}">
                                                <a class="btn btn-outline-primary btn-sm mt-4" type="button" href="removeBan?id=${a.user.id}">Remove Ban</a>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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



    </body>
</html> 