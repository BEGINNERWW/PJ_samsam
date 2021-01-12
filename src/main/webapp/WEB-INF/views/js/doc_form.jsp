<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style>

.FlexableTextArea .textarea_input {
    display: block;
    width: 100%;
    min-height: 40px;
    padding: 11px 12px 10px;
    border: 1px solid #ebecef;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
}
.SmartEditor {
    margin-top: 12px;
    border: 1px solid #ebecef;
    border-bottom: 0;
    background: #fff;
}
</style>
<script>

$(document).ready(function() {
	   //여기 아래 부분

	   $('#summernote').summernote({
		    toolbar: [
	            // [groupName, [list of button]]
	            ['fontname', ['fontname']],
	            ['fontsize', ['fontsize']],
	            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	            ['color', ['forecolor','color']],
	            ['table', ['table']],
	            ['para', ['ul', 'ol', 'paragraph']],
	            ['height', ['height']],
	            ['insert',['picture','link','video']],
	            ['view', ['fullscreen', 'help']]
	          ],
	        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	        height: 300,                 // 에디터 높이
	        minHeight: null,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",               // 한글 설정
	        placeholder: '최대 2048자까지 쓸 수 있습니다',   //placeholder 설정
	          callbacks: {
	               onImageUpload: function(files, editor, welEditable) {
	                     for (var i = files.length - 1; i >= 0; i--) {
	                        sendFile(files[i], this);
	                     }
	                 }
	            }
	          
	   });
	   

	   function sendFile(file, el) {
	       var form_data = new FormData();
	       form_data.append('file', file);
	   
	       $.ajax({
	         data: form_data,
	         type: "post",
	         url: 'image.bo',
	         cache: false,
	         contentType: false,
	         enctype: 'multipart/form-data',
	         processData: false,
	         success: function(url) {
	        		 $(el).summernote('editor.insertImage', url);
	         }
	       });
	     }
	   
});
</script>
</head>
<body>
<div class="container">
<div class="WritingWrap">

<div class="WritingHeader">
<h2 class="title">커뮤니티 글쓰기</h2>
</div>
<form name="doc_form" action="doc_write.bo" method="post">
<div class="WritngContent">
<div class="WritngEditor">
<div class="FlexableTextArea"><textarea name="doc_subject" placeholder="제목을 입력해 주세요." class="textarea_input" style="height: 40px;"></textarea></div>
<div class="SmartEditor"><textarea id="summernote" name="doc_content"></textarea></div>
<div><button type="submit">글 작성</button></div>
</div>
</div>
</form>
</div>
</div>

</body>
</html>