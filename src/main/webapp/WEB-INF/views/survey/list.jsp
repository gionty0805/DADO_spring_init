<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/inc-header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/jquery.toast.css" rel="stylesheet" />
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
                        <li class="breadcrumb-item active">List</li>
                    </ol>
                </div>
                <h4 class="page-title">Survey</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 mb-1">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-sm btn-outline-secondary me-md-2" type="button" onclick="location.href='/survey/write'">새 설문 작성</button>
            </div>
        </div>
        <div class="col-12">
            <table class="table table-hover table-centered mb-0">
                <thead>
                <colgroup>
                    <col width="50%"/>
                    <col width="10%"/>
                    <col width="25%"/>
                    <col width="15%"/>
                </colgroup>
                <tr>
                    <th>설문</th>
                    <th>진행자</th>
                    <th>등록일</th>
                    <th>진행상태</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${fn:length(list) == 0}">
                    <tr><td colspan="4" class="text-center">아직 등록된 설문이 없어요</td></tr>
                </c:if>
                <c:forEach items="${list}" var="survey">
                    <tr class="c-pointer" onclick="location.href='/survey/view/${survey.survey_id}'">
                        <td class="sorting_1">
                            <p class="m-0 d-inline-block align-middle font-16">
                                <a href="apps-ecommerce-products-details.html" class="text-body">${survey.sv_name}</a>
                                <br>
                                <span class="text-warning mdi mdi-star"></span>${survey.sv_start_dt}
                                <span class="text-warning mdi mdi-star"></span>${survey.sv_end_dt}
                            </p>
                        </td>
                        <td>${survey.sv_creater}</td>
                        <td>${survey.sv_create_dt}</td>
                        <td>${survey.sv_state}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-12 mt-3">
            <%@include file="../inc/inc-pagination.jsp" %>
        </div>
    </div>
</div>
</body>

<%@include file="../inc/inc-footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery.toast.js"></script>
<script>
    $(function(){
        if('${result}' != ''){
            if('${result}' == 'delete_success'){
                show_toast('','삭제 완료되었습니다','success', 'rgb(30,102,10)');
            }else if('${result}' == 'insert_success'){
                show_toast('', '등록 완료되었습니다', 'success', 'rgb(30,102,10)');
            }else if('${result}' == 'update_success'){
                show_toast('', '수정 완료되었습니다', 'success', 'rgb(30,102,10)');
            }else{
                show_toast('','오류가 발생했습니다','error', 'rgb(147,31,31)');
            }
        }

    });

    function go_page(page_no){
        location.href = "/survey/list/${surveyVO.survey_id}/"+page_no;
    }
</script>