<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/inc-header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/jquery.toast.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/dragula.css" rel="stylesheet" />
</head>

<body>


<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/survey/list/1">Survey</a></li>
                        <li class="breadcrumb-item active">Write</li>
                    </ol>
                </div>
                <h4 class="page-title">Survey</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 mb-3">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <%--<button class="btn btn-sm btn-outline-secondary me-md-2" type="button" onclick="location.href='/survey/write'">새 설문 작성</button>--%>
            </div>
        </div>
        <ul class="nav nav-tabs nav-bordered mb-3">
            <li class="nav-item">
                <a href="#vertical-left-tabs-preview" data-toggle="tab" aria-expanded="false" class="nav-link active">
                    Preview
                </a>
            </li>
            <li class="nav-item">
                <a href="#vertical-left-tabs-code" data-toggle="tab" aria-expanded="true" class="nav-link">
                    Code
                </a>
            </li>
        </ul>
        <div class="col-12">
            <textarea data-toggle="maxlength" class="form-control" maxlength="225" rows="3"
                      placeholder="설문과 관련된 안내사항을 간략하게 입력해주세요"></textarea>
        </div>
        <div class="col-12">
            <div class="col-6 mb-3">
                <input class="form-control" type="text" placeholder="질문을 입력하세요"/>
            </div>
            <div class="col-12 form-group">
                <div class="input-group mb-3">
                    <div class="input-group-text">
                        <input class="form-check-input" type="checkbox" value="" aria-label="Checkbox for following text input">
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with checkbox">
                </div>
            </div>
        </div>
        <div class="col-12 mt-3">
            <%@include file="../inc/inc-pagination.jsp" %>
        </div>
    </div>
</div>
</body>

<%@include file="../inc/inc-footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery.toast.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dragula.js"></script>
<script>


</script>