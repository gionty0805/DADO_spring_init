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
                <button class="btn btn-sm btn-outline-secondary me-md-2 mr-1" type="button" onclick="location.href='/board/write/${board.board_id}?origin_no=${board.origin_no}&post_id=${board.post_id}&parent_id=${board.post_id}'">답글</button>
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
	                <c:if test="${fn:length(comment) == 0}">
	                <div id="no_content" >
	                    <tr ><td colspan="3" class="text-center">아직 등록된 댓글이 없어요</td></tr>
	                </div>
	                </c:if>

                    <c:forEach items="${comment}" var="comment">
                        <c:if test="${comment.target_layer > 5}">
                            <c:set var="target_layer" value="5"/> <%--comment_layer_5 이상이 되면 외관상 안좋으니까 5이상은 같은 layer로 표기--%>
							<c:out value="${target_layer}" />
                        </c:if>
	                    <div class="media mt-3 comment_layer_<c:if test="${comment.target_layer > 5}">5</c:if><c:if test="${comment.target_layer <= 5}">${comment.target_layer}</c:if>">
	                        <img class="mr-2 rounded-circle" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
	                        <div class="media-body">
	                            <h5 class="mt-0 h5">${comment.writer_nm}<small class="text-muted float-right">${comment.regdate}</small></h5>
	                            ${comment.cont}
	                            <br>
	                            <a id="reply_btn_${comment.comment_id}" href="javascript: fn_reply(${comment.target_layer},${comment.comment_id},${comment.origin_no});" class="text-muted font-13 d-inline-block mt-2"><i class="mdi mdi-reply"></i> Reply</a>
	                        </div>
	                    </div>
	                    <section id="reply_${comment.comment_id}"></section>
	                </c:forEach>
	                <section id=comment_area></section>
                    <div class="text-center mt-2">
                        <a id="loadmore" href="javascript:fn_loadComment();" class="text-danger"> Load more </a>
                    </div>
                    <div class="border rounded mt-4">
                        <form action="#" class="comment-area-box">
                            <textarea rows="3" class="form-control border-0 resize-none" placeholder="Your comment..."></textarea>
                            <input type="hidden" value="0"/>
							<input type="hidden" value="0"/>
							<input type="hidden" value="0"/>
                            <div class="p-2 bg-light d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="btn btn-sm px-1 btn-light"><i class="mdi mdi-upload"></i></a>
                                    <a href="#" class="btn btn-sm px-1 btn-light"><i class="mdi mdi-at"></i></a>
                                </div>
                                <button type="button" onclick="fn_reply_call(this);" class="btn btn-sm btn-success"><i class="uil uil-message mr-1"></i>Submit</button>
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
    <input type="hidden" id="board_id" name="board_id" value="${board.board_id}"/>
    <input type="hidden" id="post_id" name="post_id" value="${board.post_id}"/>
    <input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.USERID'/>"/>  
    <sec:csrfInput/>
    <input type="hidden" id="writer_nm" name="writer_nm" value="<sec:authentication property='principal.NAME'/>"/>  
    <sec:csrfInput/>
</form>
</body>

<script src="${pageContext.request.contextPath}/resources/js/handlebars.js"></script>
<%@include file="../inc/inc-footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery.toast.js"></script>
<script>
    var comment_cnt = 0;
    $(function () {
        $('.dropdown-toggle').dropdown();


        //max layer가 5 이상인 경우
        Handlebars.registerHelper("check_max_layer", function (target_layer) {
            if (parseInt(target_layer) > 5 ) {
                return 5;
            }
            return target_layer;
        });
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
    function fn_loadComment(){
		comment_cnt += 3;
        $.ajax({
            url: "/comment/view",
            method: "POST",
            data:{
            	post_id: $("#post_id").val(), 
            	comment_cnt: comment_cnt
            },
            datatype: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            	$('#loadmore').html('<i class="mdi mdi-spin mdi-loading mr-1"></i>');
            },
            success : function (data) {
                var source = $('#entry-template').html();
                var template = Handlebars.compile(source);
                var html = template(data);
                $('#comment_area').append(html);
            	$('#loadmore').html(' Load more ');
            },error: function (request,status,error) {
                console.error("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                show_toast('','오류가 발생했습니다','error', 'rgb(147,31,31)');
            }
        });
    }
    
	function fn_reply(layer,id,origin_no){
		$('#reply_btn_'+id).remove();
        var source = $('#reply-template').html();
        var template = Handlebars.compile(source);
        var data ={target_layer:layer,comment_id:id,origin_no:origin_no};
        var html = template(data);
        $('#reply_'+id).append(html);
	}
	
	function fn_reply_call(dom){
		var comment_cont = $(dom).parent().parent().children().eq(0).val();
		var comment_layer = $(dom).parent().parent().children().eq(1).val();
		var comment_id = $(dom).parent().parent().children().eq(2).val();
		var origin_no = $(dom).parent().parent().children().eq(3).val();
		var post_id = $('#post_id').val();
		var writer = $('#writer').val();
		var writer_nm = $('#writer_nm').val();
		$(dom).html('<i class="mdi mdi-spin mdi-loading mr-1"></i>');
		$.ajax({
            url: "/comment/write",
            method: "POST",
            data:{
            	target_id : post_id,
            	origin_no: origin_no, 
            	target_layer: comment_layer,
            	parent_id:comment_id,
            	cont : comment_cont,
            	writer : writer 
            },
            datatype: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                $(dom).html('<i class="mdi mdi-spin mdi-loading mr-1"></i>');
            },
            success : function (data) {
                var source = $('#now_entry-template').html();
                var template = Handlebars.compile(source);
                var res = {writer_nm:writer_nm,regdate:'Now',target_layer:parseInt(comment_layer)+1,cont:comment_cont}
                var html = template(res);
                if(origin_no==0){
                	$('#comment_area').append(html);
                	$('#no_content').remove();
                	$(dom).html('<i class="uil uil-message mr-1"></i>Submit');
                }
                else{
                    $('#submit_'+comment_id).remove();
                    $('#reply_'+comment_id).append(html);
                	
                }
                show_toast('','입력 완료되었습니다','success', 'rgb(30,102,10)');
            },error: function (request,status,error) {
                console.error("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                show_toast('','오류가 발생했습니다','error', 'rgb(147,31,31)');
            }
        });
	}

</script>
<script id="entry-template" type="text/x-handlebars-template">
	{{#each .}}
	<div class="media mt-3 comment_layer_{{check_max_layer target_layer}}">
	  <img class="mr-2 rounded-circle" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
	     <div class="media-body">
	        <h5 class="mt-0 h5">{{writer_nm}}<small class="text-muted float-right">{{regdate}}</small></h5>
	        {{cont}}
	        <br>
	        <a id="reply_btn_{{comment_id}}"href="javascript: fn_reply({{target_layer}},{{comment_id}},{{origin_no}});" class="text-muted font-13 d-inline-block mt-2"><i class="mdi mdi-reply"></i> Reply</a>
	     </div>
	</div>
	<section id="reply_{{comment_id}}"></section>
	{{/each}}
</script>

<script id="now_entry-template" type="text/x-handlebars-template">
	<div class="media mt-3 comment_layer_{{check_max_layer target_layer}}">
	  <img class="mr-2 rounded-circle" src="/resources/images/avartar.png" alt="Generic placeholder image" height="32">
	     <div class="media-body">
	        <h5 class="mt-0 h5">{{writer_nm}}<small class="text-muted float-right">{{regdate}}</small></h5>
	        {{cont}}
	        <br>
	     </div>
	</div>
</script>
<script id="reply-template" type="text/x-handlebars-template">
    <div id="submit_{{comment_id}}" class="border rounded mt-4 comment_layer_{{check_max_layer target_layer}}">
         <form action="#" class="comment-area-box">
            <textarea rows="3" class="form-control border-0 resize-none" placeholder="Your comment..."></textarea>
			<input type="hidden" value="{{target_layer}}"/>
			<input type="hidden" value="{{comment_id}}"/>            
			<input type="hidden" value="{{origin_no}}"/>
			<div class="p-2 bg-light d-flex justify-content-between align-items-center">
            	<div>
            		<a href="#" class="btn btn-sm px-1 btn-light"><i class="mdi mdi-upload"></i></a>
            		<a href="#" class="btn btn-sm px-1 btn-light"><i class="mdi mdi-at"></i></a>
            	</div>
            	<button type="button" onclick="fn_reply_call(this);" class="btn btn-sm btn-success"><i class="uil uil-message mr-1"></i>Submit</button>
            </div>
         </form>
    </div>
</script>
