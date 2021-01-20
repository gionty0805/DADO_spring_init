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
                        <li class="breadcrumb-item"><a href="/board/list/${boardVO.board_id}/${boardVO.pageVO.page_no}">Community</a></li>
                        <li class="breadcrumb-item active">list</li>
                    </ol>
                </div>
                <h4 class="page-title">Community</h4>
            </div>
        </div>
    </div>

    <div class="row">
        <c:choose>
            <c:when test="${board.origin_no != 0}">
                <c:set var="title" value="${boardVO.title}"/>
                <c:set var="cont" value="============= 원글 =============<br/><br/>${boardVO.cont}<br/><br/><br/>============= 답글 =============<br/>"/>
                <c:set var="sort" value="reply"/>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${board.post_id != 0}">
                        <c:set var="title" value="${boardVO.title}"/>
                        <c:set var="cont" value="${boardVO.cont}"/>
                        <c:set var="sort" value="update"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="title" value=""/>
                        <c:set var="cont" value=""/>
                        <c:set var="sort" value="write"/>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>

        <div class="col-12 mb-1">
            <form method="post" action="${sort == 'update' ? '/board/update' : '/board/write'}" id="frm_write">
                <div class="row">
                    <div class="col-12 mb-2">
                        <input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력하세요" required="true" value="${title}">
                    </div>
                    <div class="col-12">
                        <textarea id="summernote" id="cont" name="cont" required="true">${cont}</textarea>
                    </div>
                </div>
                <div id="file_area"></div>
                <input type="hidden" name="post_id" value="${boardVO.post_id}"/>

                <c:if test="${sort == 'reply'}">
                    <input type="hidden" name="origin_no" value="${boardVO.origin_no}"/>
                    <input type="hidden" name="parent_ord" value="${boardVO.group_ord}"/>
                    <input type="hidden" name="parent_layer" value="${boardVO.group_layer}"/>
                </c:if>

                <input type="hidden" name="board_id" value="${boardVO.board_id}"/>
                <input type="hidden" name="writer" value="<sec:authentication property='principal.USERID'/>"/>
                <sec:csrfInput/>

                <div class="d-none" id="area_file_list"></div>
            </form>
        </div>

        <div class="col-12 mt-3">
            <!-- File Upload -->
            <%@include file="../inc/inc-fileuploader.jsp" %>
        </div>

        <div class="col-12 mt-3 ${sort == 'update' ? '' : 'd-none'}">
            <c:forEach var="file" items="${boardVO.file_list}">
                <div class="col-md-4" id="${file.file_id}">
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
                                    <a data-toggle="modal" data-target="#delete-file-modal" data-file-url="/${file.upload_path}/${file.file_name_uuid}" data-file-id="${file.file_id}" class="btn btn-link btn-sm text-muted">
                                        <i class="dripicons-trash"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- end col -->
            </c:forEach>
            <input type="hidden" id="del_file_url"/>
            <input type="hidden" id="del_file_id"/>
        </div>

        <div class="col-12 mt-3">
            <div class="alert alert-danger d-none" id="alert-message" role="alert">
                입력값을 확인하세요
            </div>
        </div>

        <div class="col-12 mt-3">
            <div class="d-grid mx-auto">
                <button class="btn btn-primary" type="button" id="submit-all">등록하기</button>
                <button class="btn btn-primary d-none" type="button" disabled="" id="submit-loading">
                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                    Loading...
                </button>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="delete-file-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="dripicons-information h1 text-info"></i>
                    <h4 class="mt-2">해당 파일을 삭제하시겠습니까?</h4>
                    <p class="mt-3">삭제시 수정을 취소해도 파일이 원복되지 않습니다</p>
                    <button type="button" class="btn btn-info my-2" onclick="delete_file()">&nbsp;네&nbsp;</button>
                    <button type="button" class="btn btn-outline-info my-2" data-dismiss="modal">아뇨</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<%@include file="../inc/inc-footer.jsp" %>
<link href="${pageContext.request.contextPath}/resources/summer_note/summernote.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/summer_note/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.toast.js"></script>
<script>

    $(document).ready(function() {

        //init summernote
        $('#summernote').summernote({
            height: 400,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload: function (files, editor, welEditable) {
                    var formData = new FormData();
                    $.each(files, function(idx, item){
                        formData.append('files', item);
                    });

                    $.ajax({
                        type: 'post',
                        url: '/file/upload',
                        data: formData,
                        processData: false,
                        contentType: false,
                        beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                        },
                        success: function (data) {
                            var image = $('<img>').attr('src', "/file/display?fileName=/"+data[0].upload_path+"/"+data[0].file_name_uuid);
                            $('#summernote').summernote("insertNode", image[0]);
                        },
                        error: function (request,status,error) {
                            console.error("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            show_toast('','오류가 발생했습니다','error', 'rgb(147,31,31)');
                        }
                    });
                }
            },

        });

        $('#submit-all').click(function () {
            $("#submit-all").addClass('d-none');
            $("#submit-loading").removeClass('d-none');

            if($('#frm_write').valid()){
                $("#alert-message").addClass('d-none');

                //파일+게시판 데이터 한번에 넘기는 버전
                //var formData = new FormData(document.querySelector('#frm_write'));

                //start of file upload
                file_upload();  //file_upload_callback 에서 파일 업로드 callback 처리
                //end of file upload
            }else{
                $("#alert-message").removeClass('d-none');

                $("#submit-all").removeClass('d-none');
                $("#submit-loading").addClass('d-none');
            }

        });

        $("#delete-file-modal").on('show.bs.modal', function (e) {
            var file_url = $(e.relatedTarget).data('file-url');
            var file_id = $(e.relatedTarget).data('file-id');
            $("#del_file_url").val(file_url);
            $("#del_file_id").val(file_id);
        });



    });

    function delete_file(){
        $("#delete-file-modal").modal("hide");

        $.ajax({
            url: "/file/delete",
            method: "POST",
            data:{fileName: $("#del_file_url").val(), file_id: $("#del_file_id").val()},
            datatype: "json",
            beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success : function (data) {
                if(data == 'deleted'){
                    var file_id = $("#del_file_id").val();
                    $('#'+file_id).remove();
                    show_toast('','파일을 삭제했습니다','success', 'rgb(30,102,10)');
                }else{
                    show_toast('','오류가 발생했습니다','error', 'rgb(147,31,31)');
                }
            },error: function (request,status,error) {
                console.error("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                show_toast('','오류가 발생했습니다','error', 'rgb(147,31,31)');
            }
        });
    }

    function file_upload_callback(result){

        $('#area_file_list').empty();

        if(result != null) {
            for (var i = 0; i < result.length; i++) {
                $('#area_file_list').append($('<input/>', {type: 'hidden', name: 'file_list['+i+'].extension', value: result[i].extension}));
                $('#area_file_list').append($('<input/>', {type: 'hidden', name: 'file_list['+i+'].file_name_org', value: result[i].file_name_org}));
                $('#area_file_list').append($('<input/>', {type: 'hidden', name: 'file_list['+i+'].file_name_uuid', value: result[i].file_name_uuid}));
                $('#area_file_list').append($('<input/>', {type: 'hidden', name: 'file_list['+i+'].file_size', value: result[i].file_size}));
                $('#area_file_list').append($('<input/>', {type: 'hidden', name: 'file_list['+i+'].upload_path', value: result[i].upload_path}));
            }
        }

        $('#frm_write').submit();
    }

    function download(fileName){
        self.location = '/file/download?fileName='+encodeURIComponent(fileName);
    }
</script>

