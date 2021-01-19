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
                        <li class="breadcrumb-item"><a href="/board/list/${boardVO.board_id}">Community</a></li>
                        <li class="breadcrumb-item active">${boardVO.board_name} List</li>
                    </ol>
                </div>
                <h4 class="page-title">Community</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 mb-1">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-sm btn-outline-secondary me-md-2" type="button" onclick="location.href='/board/write/${boardVO.board_id}'">새 글 작성</button>
            </div>
        </div>
        <div class="col-12">
            <table class="table table-hover table-centered mb-0">
                <thead>
                <colgroup>
                    <col width="50%"/>
                    <col width="25%"/>
                    <col width="25%"/>
                </colgroup>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${fn:length(list) == 0}">
                    <tr><td colspan="3" class="text-center">아직 등록된 글이 없어요</td></tr>
                </c:if>
                <c:forEach items="${list}" var="board">
                    <tr class="c-pointer" onclick="location.href='/board/view/${board.board_id}/${board.post_id}'">
                        <td>${board.title}</td>
                        <td>${board.writer}</td>
                        <td>${board.regdate}</td>
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
        location.href = "/board/list/${boardVO.board_id}/"+page_no;
    }
</script>