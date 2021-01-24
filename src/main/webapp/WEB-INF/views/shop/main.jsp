<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/inc-header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/styles-shop.css" rel="stylesheet" />
</head>
<body>
<%@include file="../inc/inc-nav-shop.jsp" %>
<div class="container-fluid p-0">

    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <%--<li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>--%>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/resources/images/carousel/carousel-3.jpg" class="bg-cover w-100" alt="Sample1">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>

    </div>
</div>

</body>

<%@include file="../inc/inc-footer.jsp" %>

