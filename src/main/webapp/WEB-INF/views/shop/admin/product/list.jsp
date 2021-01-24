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
    <div class="row ml-lg-3 mr-lg-3">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="/">관리자모드</a></li>
                        <li class="breadcrumb-item"><a href="/shop/list/${shopVO.shop_id}/1">상품관리</a></li>
                        <li class="breadcrumb-item active">${shopVO.shop_name} List</li>
                    </ol>
                </div>
                <h4 class="page-title">상품관리</h4>
            </div>
        </div>
    </div>
    <div class="row ml-lg-3 mr-lg-3">
        <div class="col-12">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <%--<button class="btn btn-sm btn-outline-secondary me-md-2" type="button" onclick="location.href='/shop/write/${shopVO.shop_id}'">새 글 작성</button>--%>
            </div>
        </div>
    </div>
    <div class="row mt-3 ml-lg-3 mr-lg-3">
        <div class="col">
            <%--<div class="list-group">
                <a href="#" class="list-group-item list-group-item-action bg-secondary text-white">
                    일반게시판
                </a>
                <a href="#" class="list-group-item list-group-item-action">공지사항</a>
                <button type="button" class="list-group-item list-group-item-action">Q&A</button>
                <button type="button" class="list-group-item list-group-item-action">FAQ</button>
                <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">폐지게시판</a>
            </div>--%>
            <button type="button" class="btn btn-secondary btn-block" onclick="location.href='/shop/admin/product/write'">상품등록</button>
            <div class="email-menu-list mt-3">
                <a href="javascript: void(0);" class="text-secondary font-weight-bold"><i class="dripicons-inbox mr-2"></i>상품관리<span class="badge rounded-pill bg-light float-right ml-2">7</span></a>
                <a href="javascript: void(0);"><i class="dripicons-star mr-2"></i>할인상품</a>
                <a href="javascript: void(0);"><i class="dripicons-star mr-2"></i>주문관리</a>
                <a href="javascript: void(0);"><i class="dripicons-clock mr-2"></i>회원관리</a>
                <a href="javascript: void(0);"><i class="dripicons-trash mr-2"></i>Analytics<span class="badge rounded-pill bg-light float-right ml-2">32</span></a>
            </div>
        </div>
        <div class="col-md-10">
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

