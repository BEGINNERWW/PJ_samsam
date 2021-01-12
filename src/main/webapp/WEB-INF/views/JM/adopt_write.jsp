<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!--@if($oDocument->hasUploadedFiles())-->

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<style>
	#writeform{
		margin:0 auto;
		width:600px;
	}
</style>

<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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



$(document).ready(function() { 
    if("cats" == "cats"){
        $('input:radio[name="big_name"][value="dog"]').prop('checked', true);
        $("select[name='catMainCategory']").val("2").attr("selected", "selected");
        $( "#viewCatCategory" ).hide();
        $( "#viewDogsCategory" ).show();
        $('#kindof2').attr('disabled','disabled');
        $('#kindof').removeAttr('disabled');
    }
    
    //라디오 버튼 변경시 이벤트
    $("input[name='big_name']:radio").change(function () {
            //라디오 버튼 값을 가져온다.
            	
            var big_name = this.value;      
            
            if(big_name == "cats"){
                $( "#viewDogsCategory" ).hide();
                $( "#viewCatCategory" ).show();
                $('#kindof').attr('disabled','disabled');
                $('#kindof2').removeAttr('disabled');

            }else if(big_name == "dogs"){
                $( "#viewDogsCategory" ).show();
                $( "#viewCatCategory" ).hide();
                $('#kindof2').attr('disabled','disabled');
                $('#kindof').removeAttr('disabled');
            }
                            
        });
});





</script>
</head>
<body>
<form action="./adoptwrite.bo" method="post" name="boardform" enctype="multipart/form-data">
	<div id="writeform">
		제목:
		<input type ="text" placeholder="제목" size="50%" name = "home_subject">
		<br/>
		분양가:<input type ="text" placeholder="분양가" size="50%" name = "home_price">
		<br/>
		<br/>
		 <span id="locCategory">
	       	 지역: 
	        <select class="form-control locCategory" id="kindloc"name="loc" style="width:200px">
	        	<option value="hide">전체</option>
	            <option value="서울">서울</option>
	            <option value="부산">부산</option>
	            <option value="대구">대구</option>
	            <option value="인천">인천</option>
	            <option value="광주">광주</option>
	            <option value="대전">대전</option>
	            <option value="울산">울산</option>
	            <option value="세종">세종</option>
	            <option value="경기">경기</option>
	            <option value="강원">강원</option>
	            <option value="충북">충북</option>
	            <option value="충남">충남</option>
	            <option value="전북">전북</option>
	            <option value="전남">전남</option>
	            <option value="경북">경북</option>
	            <option value="경남">경남</option>
	            <option value="제주">제주</option>         
	        </select>
	    </span>
		<input type="radio" name="big_name" value="dogs" checked><span> 강아지</span>
	    <input type="radio" name="big_name" value="cats"><span> 고양이</span>
	     <br/>
	    <span id="viewDogsCategory">
	       	 강아지 카테고리: 
	        <select class="form-control dogMainCategory" id="kindof"name="kindof" style="width:200px">
	        	<option value="hide">전체</option>
	            <option value="말티즈">말티즈</option>
	            <option value="포메">포메</option>
	            <option value="푸들">푸들</option>
	            <option value="기타">기타</option>
	        </select>
	    </span>
	    <span id="viewCatCategory" style="display:none">
	       	 고양이 카테고리: 
	        <select  class="form-control catMainCategory" id="kindof2" name="kindof" style="width:200px">
	        	
	        	<option value="hide">전체</option>
	            <option value="먼치킨">먼치킨</option>
	            <option value="페르시안">페르시안</option>
	            <option value="기타">기타</option>
	        </select>
	    </span>
	    
	    <br>
	    
	        전화번호:<input type ="text" placeholder="전화번호" name ="home_phone">
		
		<textarea id="summernote" name="home_content"></textarea>	
		
		<input type ="submit" value = "등록">
	</div>
</form>
</body>
</html>