<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/dropzone/dropzone.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/dropzone/dropzone.js"></script>
<form class="dropzone" id="upload_zone">
    <div class="fallback"></div>
    <div class="dz-message needsclick">
        <i class="h1 text-muted dripicons-cloud-upload"></i>
        <h3>파일을 이곳에 놓거나 클릭하여 업로드하세요</h3>
        <span class="text-muted font-13">
            (최대 <strong>10MB 이하</strong>의 파일 10개 이하 등록 가능합니다)
        </span>
    </div>
    <sec:csrfInput/>
</form>

<script>
    Dropzone.autoDiscover = false;

    $(document).ready(function() {
        //init dropzone
        $("#upload_zone").dropzone({
            url: '/file/upload',
            dictDefaultMessage: "Drop files here or<br>click to upload...",
            addRemoveLinks : true,
            dictRemoveFile: '삭제',
            dictInvalidFileType : '허용하지 않는 확장명입니다',
            dictMaxFilesExceeded : '최대 업로드 수를 초과했습니다',
            maxFilesize: 10, //MB 단위
            maxFiles: 10,
            uploadMultiple: true,
            autoProcessQueue: false,
            init: function() {
                this.on("sending", function(file, xhr, formData){
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                });
            }
        });
    });

    function file_upload(){

        if($('#upload_zone')[0].dropzone.getAcceptedFiles().length == 0){
            return file_upload_callback(null);
        }

        var formData = new FormData();
        $.each($('#upload_zone')[0].dropzone.getAcceptedFiles(), function(idx, item){
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
                //console.log(data);
                //list 형태로 return 된 서버에 업로드된 파일리스트를 callback 합수에수 후처리
                file_upload_callback(data);
            },
            error: function (xhr, status, er) {
                alert('파일업로드에 오류가 발생했습니다' + er);
                $("#submit-all").removeClass('d-none');
                $("#submit-loading").addClass('d-none');
            }
        });
    }
</script>