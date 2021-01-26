<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../inc/inc-header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/styles-shop.css" rel="stylesheet" />
<style>
    .table img{
        height: 48px;
    }
</style>
</head>
<body>
<div class="container-fluid mt-5">

    <div class="wrapper">

        <%@include file="../../../inc/inc-side-shop.jsp" %>

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="col-12">
                <table class="table table-hover table-centered mb-0">
                    <thead>
                    <colgroup>
                        <col width="30%"/>
                        <col width="15%"/>
                        <col width="10%"/>
                        <col width="8%"/>
                        <col width="8%"/>
                        <col width="15%"/>

                    </colgroup>
                    <tr>
                        <th>상품</th>
                        <th>카테고리</th>
                        <th>등록일</th>
                        <th>가격</th>
                        <th>옵션</th>
                        <th>재고</th>
                        <th>상태</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--<c:if test="${fn:length(list) == 0}">
                        <tr><td colspan="3" class="text-center">아직 등록된 상품이 없어요</td></tr>
                    </c:if>--%>
                    <%--<c:forEach items="${list}" var="shop">--%>
                    <tr role="row">

                        <td class="">
                            <img src="/resources/images/product_sample.jpeg" alt="contact-img" title="contact-img" class="rounded mr-3" height="48">
                            <p class="m-0 d-inline-block align-middle font-16">
                                <a href="apps-ecommerce-products-details.html" class="text-body">고래 뿅뿅 물총</a>
                                <br>
                                <span class="text-muted">물총</span> / <span class="text-muted">워터건</span>
                                <br>
                                <span class="text-warning mdi mdi-heart"></span> 142
                            </p>
                        </td>
                        <td class="">
                            Category1
                        </td>
                        <td class="">
                            03/24/2018
                        </td>
                        <td>
                            \20,000
                        </td>

                        <td>
                            204
                        </td>
                        <td class="sorting_1">
                            <span class="badge badge-danger">재고없음</span>
                        </td>

                        <td class="table-action" style="">
                            <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>
                            <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                            <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                        </td>
                    </tr>
                    </tr>
                    <%--</c:forEach>--%>
                    </tbody>
                </table>
            </div>
            <div class="col-12 mt-3">
                <%@include file="../../../inc/inc-pagination.jsp" %>
            </div>
        </div>
    </div>





</div>

</body>

<%@include file="../../../inc/inc-footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/scrollbar/jquery.mousewheel.js"></script>

