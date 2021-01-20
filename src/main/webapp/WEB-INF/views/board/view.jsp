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
                <button class="btn btn-sm btn-outline-secondary me-md-2" type="button" onclick="add_html()">html 추가 샘플</button>
                <select id="num_area"></select>

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
                    <div class="mb-2">&nbsp;<i class="mdi mdi-attachment"></i> 첨부파일(${fn:length(board.file_list)}) <a href="javascript:download_all()" data-bs-toggle="tooltip" data-bs-placement="bottom" title="한번에 내려받기"><i class="mdi mdi-download-multiple"></i></a></div>
                <div class="col-12 mb-3 pl-0">
                    <c:forEach var="file" items="${board.file_list}">
                        <div class="col-md-4 pl-0">
                            <div class="card mb-1 shadow-none border">
                                <div class="p-1">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <div class="avatar-xs">
                                                <span class="avatar-title rounded  bg-primary-lighten text-secondary text-uppercase">
                                                    .${file.extension}
                                                </span>
                                            </div>
                                            <%--or--%>
                                            <%--<img src="assets/images/projects/project-1.jpg" class="avatar-sm rounded" alt="file-image">--%>
                                        </div>
                                        <div class="col pl-0">
                                            <a href="javascript:download('/${file.upload_path}/${file.file_name_uuid}')" data-file-name="/${file.upload_path}/${file.file_name_uuid}" class="text-muted font-weight-bold fs-6 file-name">${file.file_name_org}<span class="pl-1">${file.file_size} MB</span></a>
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
                <div class="py-1 bg-light-light">
                    <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted pl-0"><i class="mdi mdi-heart text-danger"></i> 2k Likes</a>
                    <a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="mdi mdi-comment-multiple-outline"></i> 200 Comments</a>
                    <%--<a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="uil uil-share-alt"></i> Share</a>--%>
                </div>
                <hr class="m-0">
                <div class="mt-3">
                    <div class="media">
                        <img class="mr-2 rounded-circle" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
                        <div class="media-body">
                            <h5 class="mt-0 h5">Jeremy Tomlinson <small class="text-muted float-right">5 hours ago</small></h5>
                            Nice work, makes me think of The Money Pit.

                            <br>
                            <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2"><i class="mdi mdi-reply"></i> Reply</a>

                            <div class="media mt-3">
                                <a class="pr-2" href="#">
                                    <img src="/resources/images/avartar.png" class="rounded-circle" alt="Generic placeholder image" height="32">
                                </a>
                                <div class="media-body">
                                    <h5 class="mt-0 h5">Thelma Fridley <small class="text-muted float-right">3 hours ago</small></h5>
                                    i'm in the middle of a timelapse animation myself! (Very different though.) Awesome stuff.
                                    <br>
                                    <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2">
                                        <i class="mdi mdi-reply"></i> Reply
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="media mt-3">
                        <img class="mr-2 rounded-circle" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
                        <div class="media-body">
                            <h5 class="mt-0 h5">Kevin Martinez <small class="text-muted float-right">1 day ago</small></h5>
                            It would be very nice to have.

                            <br>
                            <a href="javascript: void(0);" class="text-muted font-13 d-inline-block mt-2"><i class="mdi mdi-reply"></i> Reply</a>
                        </div>
                    </div>
                    <div class="text-center mt-2">
                        <a href="javascript:void(0);" class="text-danger"><i class="mdi mdi-spin mdi-loading mr-1"></i> Load more </a>
                    </div>
                    <div class="border rounded mt-4">
                        <form action="#" class="comment-area-box">
                            <textarea rows="3" class="form-control border-0 resize-none" placeholder="Your comment..."></textarea>
                            <div class="p-2 bg-light d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="btn btn-sm px-1 btn-light"><i class="mdi mdi-upload"></i></a>
                                    <a href="#" class="btn btn-sm px-1 btn-light"><i class="mdi mdi-at"></i></a>
                                </div>
                                <button type="submit" class="btn btn-sm btn-success"><i class="uil uil-message mr-1"></i>Submit</button>
                            </div>
                        </form>
                    </div>


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

<script src="${pageContext.request.contextPath}/resources/js/handlebars.js"></script>
<%@include file="../inc/inc-footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery.toast.js"></script>
<script>
    $(function () {
        $('.dropdown-toggle').dropdown();
    });

    function download(fileName){
        self.location = '/file/download?fileName='+encodeURIComponent(fileName);
    }

    function download_all(){
        var iFrameCnt = 0;
        show_toast('','준비중입니다','warn', 'rgb(147,31,31)');
        $('.file-name').each(function () {
            //다음에 알아보도록 하자..
            //download($(this).data('file-name'));
            //fnSleep(1000);
        });
    }

    function fnSleep(delay){
        var start = new Date().getTime();
        while (start + delay > new Date().getTime());
    }

    function fnCreateIframe(name){
        var frm = $('<iframe name="' + name + '" style="display: none;"></iframe>');
        frm.appendTo("body");
    }

    function delete_post(){
        $("#frm_delete").submit();
    }

    function add_html(){

        var data = [{num:1},{num:2},{num:3},{num:4},{num:5}];
        var source = $('#test-template').html();
        var template = Handlebars.compile(source);
        var html = template(data);
        console.log(html);
        $('#num_area').append(html);
    }



</script>

<script id="test-template" type="text/x-handlebars-template">
    {{#each .}}
<option>{{num}}</option>
    {{/each}}
</script>