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
                        <li class="breadcrumb-item"><a href="/board/list/${boardVO.board_id}/1">Community</a></li>
                        <li class="breadcrumb-item active">${boardVO.board_name} List</li>
                    </ol>
                </div>
                <h4 class="page-title">Community</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <%--<button class="btn btn-sm btn-outline-secondary me-md-2" type="button" onclick="location.href='/board/write/${boardVO.board_id}'">새 글 작성</button>--%>
            </div>
        </div>
    </div>
    <div class="row mt-3">
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
            <button type="button" class="btn btn-secondary btn-block" onclick="location.href='/board/write/${boardVO.board_id}'">새 글 작성</button>
            <div class="email-menu-list mt-3">
                <a href="javascript: void(0);" class="text-secondary font-weight-bold"><i class="dripicons-inbox mr-2"></i>공지사항<span class="badge rounded-pill bg-light float-right ml-2">7</span></a>
                <a href="javascript: void(0);"><i class="dripicons-star mr-2"></i>Q&A</a>
                <a href="javascript: void(0);"><i class="dripicons-clock mr-2"></i>FAQ</a>
                <a href="javascript: void(0);"><i class="dripicons-trash mr-2"></i>폐지게시판<span class="badge rounded-pill bg-light float-right ml-2">32</span></a>
            </div>
        </div>
        <div class="col-9">
            <div class="col-12">
                <table class="table table-hover table-centered mb-0">
                    <thead>
                    <colgroup>
                        <col width="60%"/>
                        <col width="15%"/>
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
                        <tr class="c-pointer" onclick="location.href='/board/view/${board.board_id}/${board.post_id}/3'">
                            <td><c:forEach var="layer" begin="1" end="${board.group_layer}">&nbsp;&nbsp;</c:forEach><c:if test="${board.group_layer > 0}"><i class="dripicons-arrow-thin-right"></i> </c:if>${board.title}</td>
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