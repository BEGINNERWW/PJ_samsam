<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page session="false" %>
<html>
<head>

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
   
   $("input:radio[name=fdoc_big]").click(function(){
	  	$('#kind').empty();
		  if($("input[name='fdoc_big']:checked").val() =="강아지"){
			  var output ='';
			  output += '<tr><td>중분류 :&nbsp;&nbsp;</td>';
			  output += '<td><select size="1" id="fdoc_kindof" name="fdoc_kindof">';
			  output += '<option value="hide">선택하세요</option>';
			  output += '<option value="포메라니안">포메라니안</option>';
			  output += '<option value="치와와">치와와</option>';
			  output += '<option value="미니어처 핀셔(미니핀)">미니어처 핀셔(미니핀)</option>';
			  output += '<option value="파피용">파피용</option>';
			  output += '<option value="토이 푸들">토이 푸들</option>';
			  output += '<option value="미니어쳐 닥스훈트">미니어처 닥스훈트</option>';
			  output += '<option value="요크셔테리어">요크셔테리어</option>';
			  output += '<option value="말티즈">말티즈</option>';
			  output += '<option value="비숑 프리제">비숑 프리제</option>';
			  output += '<option value="미니어쳐 슈나우저">미니어쳐 슈나우저</option>';
			  output += '<option value="페키니즈">페키니즈</option>';
			  output += '<option value="꼬똥 드 툴레아">꼬똥 드 툴레아</option>';
			  output += '<option value="퍼그">퍼그</option>';
			  output += '<option value="웰시 코기">웰시 코기</option>';
			  output += '<option value="프렌치 불독">프렌치 불독</option>';
			  output += '<option value="비글">비글</option>';
			  output += '<option value="코카 스파니엘">코카 스파니엘</option>';
			  output += '<option value="보스턴 테리어">보스턴 테리어</option>';
			  output += '<option value="셔틀랜드 쉽독">셔틀랜드 쉽독</option>';
			  output += '<option value="이탈리안 그레이하운드">이탈리안 그레이하운드</option>';
			  output += '<option value="스코티시 테리어">스코티시 테리어</option>';
			  output += '<option value="베들링턴 테리어">베들링턴 테리어</option>';
			  output += '<option value="시바이누">시바이누</option>';
			  output += '<option value="불테리어">불테리어</option>';
			  output += '<option value="보더콜리">보더콜리</option>';
			  output += '<option value="시추">시추</option>';
			  
			  output += '</select></td></tr>';
			  $('#kind').append(output);
		  }
		  else if($("input[name='fdoc_big']:checked").val() =="고양이"){
			  var output ='';
			  output += '<tr><td>중분류 :&nbsp;&nbsp;</td>';
			  output += '<td><select size="1" id="fdoc_kindof" name="fdoc_kindof">';
			  output += '<option value="hide">선택하세요</option>';
			  output += '<option value="노르웨이 숲 고양이">노르웨이 숲 고양이</option>';
			  output += '<option value="데본렉스">데본렉스</option>';
			  output += '<option value="라가머핀">라가머핀</option>';
			  output += '<option value="라팜">라팜</option>';
			  output += '<option value="렉돌">렉돌</option>';
			  output += '<option value="러시안블루">러시안블루</option>';
			  output += '<option value="맹크스 고양이">맹크스 고양이</option>';
			  output += '<option value="메인쿤">메인쿤</option>';
			  output += '<option value="발리네즈 고양이">발리네즈 고양이</option>';
			  output += '<option value="버만">버만</option>';
			  output += '<option value="버미즈">버미즈</option>';
			  output += '<option value="봄베이">봄베이</option>';
			  output += '<option value="브리티쉬 숏 헤어">브리티쉬 숏 헤어</option>';
			  output += '<option value="샤트룩스">샤트룩스</option>';
			  output += '<option value="샴">샴</option>';
			  output += '<option value="셀커크 렉스">셀커크 렉스</option>';
			  output += '<option value="소말리">소말리</option>';
			  output += '<option value="스코티쉬 폴드">스코티쉬 폴드</option>';
			  output += '<option value="스핑크스">스핑크스</option>';
			  output += '<option value="시베리아">시베리아</option>';
			  output += '<option value="싱가퓨라">싱가퓨라</option>';
			  output += '<option value="아메리칸 밥테일">아메리칸 밥테일</option>';
			  output += '<option value="아메리칸 숏헤어">아메리칸 숏헤어</option>';
			  output += '<option value="아메리칸 와이어헤어">아메리칸 와이어헤어</option>';
			  output += '<option value="아메리칸 컬">아메리칸 컬</option>';
			  output += '<option value="아비니시안">아비니시안</option>';
			  output += '<option value="오시캣">오시캣</option>';
			  output += '<option value="유러피안 버미즈">유러피안 버미즈</option>';
			  output += '<option value="이그저틱">이그저틱</option>';
			  output += '<option value="이집션 마우">이집션 마우</option>';
			  output += '<option value="재패니즈밥테일">재패니즈밥테일</option>';
			  output += '<option value="컬러포인트쇼트헤어">컬러포인트쇼트헤어</option>';
			  output += '<option value="코니시 렉스">코니시 렉스</option>';
			  output += '<option value="코랫">코랫</option>';
			  output += '<option value="터키시 반">터키시 반</option>';
			  output += '<option value="터키쉬 앙고라">터키쉬 앙고라</option>';
			  output += '<option value="통키니즈">통키니즈</option>';
			  output += '<option value="페르시안">페르시안</option>';
			  output += '<option value="하바나 브라운">하바나 브라운</option>';
			  output += '<option value="자바니즈">자바니즈</option>';
			  
			  
			  output += '</select></td></tr>';
			  $('#kind').append(output);
		  }
		  else{
			  var output = '';
			  output += '<tr><td><input type="text" name="fdoc_kindof" placeholder="직접 입력해주세요"></td></tr>'
				$('#kind').append(output);
		  }
	  });
   //이용약관 동의 체크
   $("#fdoc_agree").change(function(){
		$(this).prop('checked')?$('#fdoc_submit').removeAttr('disabled'):$('#fdoc_submit').attr('disabled','disabled');
	   
   });
   
});
function setThumbnail(event) {
	
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]); 
		}


  
 

</script>

   <title>Home</title>
</head>
<body>

<div style="width: 60%; margin: auto;">
   <form method="post" action="fdoc_write.bo" enctype="multipart/form-data">
   <table style="border-collapse:separate;border-spacing:10px;">
      <tr><td>작성자 :<input type="text" name="fdoc_nick" id="fdoc_nick" style="width: 20%;" placeholder="작성자"/></td></tr>
      <tr><td>제목 :<input type="text" name="fdoc_subject" style="width: 40%;" placeholder="제목"/></td></tr>
     <tr align="center"><td>입력사항</td></tr>
      <tr>
     <td><input type="radio" name="fdoc_big" value="강아지">&nbsp;강아지&nbsp;&nbsp;
         <input type="radio" name="fdoc_big" value="고양이">&nbsp;고양이&nbsp;&nbsp;
         <input type="radio" name="fdoc_big" value="기타">&nbsp;기타&nbsp;&nbsp;</td>
     </tr>
     <tr><td>
     <table id="kind">
    <!-- 종류 구별 -->
     </table>
        </td></tr>
    
	<tr><td>분양비 : <input type="text" name="fdoc_price" placeholder="분양비를 입력해주세요."></td></tr> 
	<tr><td>지역 : <select size="1" id="fdoc_loc" name="fdoc_loc">
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
	<tr><td>책임기간 :<select size="1" id="fdoc_expiry" name="fdoc_expiry">
					<option value="1">1개월</option>
					<option value="2">2개월</option>
					<option value="3">3개월</option>
					<option value="4">4개월</option>
					<option value="5">5개월</option>
					<option value="6">6개월</option>
					<option value="7">7개월</option>
					<option value="8">8개월</option>
					<option value="9">9개월</option>
					<option value="10">10개월</option>
					<option value="11">11개월</option>
					<option value="12">12개월</option>
					</select>
	</td></tr>
	<!--  
	<tr><td>썸네일용 이미지를 업로드해주세요</td></tr>
	<tr><td><input type="file" name="fdoc_Image" onchange="setThumbnail(event);"></td></tr>
	<tr><td><div id="image_container"></div></td></tr>     
     -->
      <tr><td> 
      <textarea id="summernote" name="fdoc_content"></textarea>
      </td></tr>
      <tr><td>책임 분양 이용약관&nbsp;&nbsp;<input type="checkbox" id="fdoc_agree" value="Y"></td></tr>
      <tr><td><textarea cols="100" rows="10" readonly style="background-color:#f3f5f7;">
    	  어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구
      	어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구
     	 어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구
     	 어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구
    	  어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구
      </textarea></td></tr>
      <tr><td><input type="submit" id="fdoc_submit" value="글 작성" style="float: right;" disabled="disabled"><input type="button" value="뒤로" onclick="javascript:history.go(-1)" style="float:right;"></td></tr>
      </table>
   </form>
   
</div>
</body>
</html>