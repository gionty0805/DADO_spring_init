<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/inc-header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
</head>

<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/board/list/${board.board_id}/${board.pageVO.page_no}">Community</a></li>
                        <li class="breadcrumb-item active">view</li>
                    </ol>
                </div>
                <h4 class="page-title">Community</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <sec:authentication property='principal.USERID' var="userid"/>
        <c:if test="${userid == board.writer}">
        <div class="col-6">
            <div class="btn-group">
                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-toggle="dropdown" aria-expanded="false">
                    <i class="mdi mdi-folder font-16"></i>
                </button>
                <div class="dropdown-menu">
                    <span class="dropdown-header">Move to:</span>
                    <a class="dropdown-item" href="javascript: void(0);">Social</a>
                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                    <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                </div>
            </div>

            <div class="btn-group">
                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-toggle="dropdown" aria-expanded="false">
                    <i class="mdi mdi-content-copy font-16"></i>
                </button>
                <div class="dropdown-menu">
                    <span class="dropdown-header">Copy to:</span>
                    <a class="dropdown-item" href="javascript: void(0);">Social</a>
                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                    <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                </div>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-secondary" onclick="location.href='/board/write/${board.board_id}?post_id=${board.post_id}'"><i class="mdi mdi-square-edit-outline font-16"></i></button>
                <button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#delete-modal"><i class="mdi mdi-trash-can font-16"></i></button>
            </div>
        </div>
        </c:if>
        <div class="col-6">
            <div class="d-md-flex justify-content-md-end">
                <button class="btn btn-sm btn-outline-secondary me-md-2 mr-1" type="button" onclick="location.href='/board/write/${board.board_id}?origin_no=${board.origin_no}&post_id=${board.post_id}'">답글</button>
                <button class="btn btn-sm btn-outline-secondary me-md-2" type="button" onclick="location.href='/board/list/${board.board_id}/${board.pageVO.page_no}'">목록</button>
            </div>
        </div>
        <div class="col-12">
            <div class="mt-3">
                <h5 class="font-18">${board.title}</h5>
                <hr>
                <div class="media mb-3 mt-1">
                    <div class="media-body">
                        <small class="float-right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.regdate}"/></small>
                        <h6 class="m-0 font-14"><i class="mdi mdi-account"></i>${board.writer_nm}</h6>
                        <small class="text-muted"> 조회수:0</small>
                    </div>
                </div>

                ${board.cont}

                <c:if test="${fn:length(board.file_list) > 0}">
                <hr>
                <div class="mb-2">&nbsp;<i class="mdi mdi-attachment"></i> 첨부파일(${fn:length(board.file_list)})</div>
                <div class="row mb-3">
                    <c:forEach var="file" items="${board.file_list}">
                        <div class="col-md-4">
                            <div class="card mb-1 shadow-none border">
                                <div class="p-1">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <div class="avatar-sm">
                                                <span class="avatar-title bg-primary-lighten text-secondary rounded text-uppercase fs-6">
                                                    .${file.extension}
                                                </span>
                                            </div>
                                            <%--or--%>
                                            <%--<img src="assets/images/projects/project-1.jpg" class="avatar-sm rounded" alt="file-image">--%>
                                        </div>
                                        <div class="col pl-0">
                                            <a href="javascript:download('/${file.upload_path}/${file.file_name_uuid}')" class="text-muted font-weight-bold fs-6">${file.file_name_org}<span class="pl-1">${file.file_size} MB</span></a>
                                        </div>
                                        <div class="col-auto">
                                            <!-- Button -->
                                            <a href="javascript:download('/${file.upload_path}/${file.file_name_uuid}')" class="btn btn-link btn-sm text-muted">
                                                <i class="dripicons-download"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end col -->
                    </c:forEach>
                </div>
                </c:if>
                <!-- end row-->

                <hr class="m-0 mt-3">
                <div class="my-1">
                    <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted pl-0"><i class="mdi mdi-heart text-danger"></i> 2k Likes</a>
                    <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="mdi mdi-comment-multiple-outline"></i> 200 Comments</a>
                    <%--<a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="uil uil-share-alt"></i> Share</a>--%>
                </div>
                <hr class="m-0">
                <div class="mt-3">
                    <div class="media">
                        <img class="mr-2 rounded" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
                        <div class="media-body">
                            <h5 class="m-0">Sansa Stark </h5>
                            <p class="text-muted mb-0"><small>2 mins ago</small></p>

                            <p class="my-1">This is awesome! Proud of sis :) Waiting for you to
                                come back to winterfall</p>

                            <div>
                                <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted p-0">
                                    <i class="uil uil-heart mr-1"></i> Like
                                </a>
                                <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted p-0 pl-2">
                                    <i class="uil uil-comments-alt mr-1"></i> Reply
                                </a>
                            </div>

                            <div class="media mt-3">
                                <img class="mr-2 rounded" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
                                <div class="media-body">
                                    <h5 class="m-0">Cersei Lannister </h5>
                                    <p class="text-muted mb-0"><small>1 min ago</small></p>

                                    <p class="my-1">I swear! She won't be able to reach to winterfall</p>
                                </div> <!-- end media-body -->
                            </div> <!-- end media-->

                            <div class="media mt-3">
                                <img class="mr-2 rounded" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
                                <div class="media-body">
                                    <h5 class="m-0">Cersei Lannister </h5>
                                    <p class="text-muted mb-0"><small>1 min ago</small></p>

                                    <p class="my-1">I swear! She won't be able to reach to winterfall</p>
                                </div> <!-- end media-body -->
                            </div> <!-- end media-->
                        </div> <!-- end media-body -->
                    </div> <!-- end media-->

                    <hr>

                    <div class="media mb-2">
                        <img src="/resources/images/avartar.png" height="32" class="align-self-start rounded mr-2" alt="Arya Stark">
                        <div class="media-body">
                            <input type="text" class="form-control border-0 form-control-sm" placeholder="이곳에 댓글을 입력하세요">
                        </div> <!-- end medi-body -->
                    </div> <!-- end media-->

                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="dripicons-information h1 text-info"></i>
                    <h4 class="mt-2">정말 삭제하시겠습니까?</h4>
                    <p class="mt-3">삭제시 해당 글만 삭제되며 답글은 삭제되지 않습니다</p>
                    <button type="button" class="btn btn-info my-2" onclick="delete_post()">&nbsp;네&nbsp;</button>
                    <button type="button" class="btn btn-outline-info my-2" data-dismiss="modal">아뇨</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<form method="post" action="/board/delete" id="frm_delete">
    <input type="hidden" name="board_id" value="${board.board_id}"/>
    <input type="hidden" name="post_id" value="${board.post_id}"/>
    <sec:csrfInput/>
</form>

</body>

<%@include file="../inc/inc-footer.jsp" %>

<script>
    $(function () {
        $('.dropdown-toggle').dropdown();
    });

    function download(fileName){
        self.location = '/file/download?fileName='+encodeURIComponent(fileName);
    }

    function delete_post(){
        $("#frm_delete").submit();
    }

</script>
