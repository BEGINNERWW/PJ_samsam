<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.samsam.member.MemberVO"%> 
<%	
	MemberVO vo = (MemberVO) request.getAttribute("MemberVO"); 
%>  
  

<!doctype html>
<html>

<head>

<meta charset="utf-8" />
<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<head profile="http://www.w3.org/2005/10/profile">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<link href="resources/css/join_form.css"rel="stylesheet"/>
<script src="resources/js/login_form.js"></script>
<!-- 스윗얼럿 -->
<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
body::-webkit-scrollbar { 
    display: none; 
}

/* pageup button */
.back-to-top{
   width : 40px;
   height : 40px;
   margin : 0 auto;
   font-size : 24px;
   color : white;
   background-color : #149DDD;
   border-radius : 50%;
   visibility : visible;
   position: fixed; 
   bottom: 45px; 
   right: 30px;
   text-align : center;
}
/* pageup button */
*, ::after, ::before {
    box-sizing: border-box;
}
.fas fa-home, i{
    margin-top: 6px;
}

/*카카오톡 톡상담*/
.kakaoChat {
    text-align: right;
    position: fixed;
    margin-right: 28px;
    bottom: 86px;
    right: 0;
}
.kakao_btn {
	border-radius: 1rem!important;
}
</style>
<script type="text/javascript">
 
//이메일 체크

		
		
		
$(document).ready(function(){

	 var isEmpty = function(val) {
		    if (val === "" || val === null || val === undefined
		      || (val !== null && typeof val === "object" && !Object.keys(val).length)
		    ){
		      return true
		    } else {
		      return false
		    }
		  };
	//// 이메일 유효성 검사 
	$('#email').focusout(function(){
	
	if(isEmpty($('#email').val())) { 
		$(".check_email").text("");
	}
	if(! email_check($('#email').val()) ) { 
		$(".check_email").text("잘못된 형식의 이메일입니다.");
		$(this).focus();
	}
	else{
	
	
	var data = {
			email : $('#email').val()
	}
	console.log($('#email').val());

	$.ajax({
		url: '/samsam/idcheckajax.do',
		type: 'POST',
		data: JSON.stringify(data),
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',

		success : function(map) {
			//$(".check_email").empty();
			if(map.email == "ZERO"){  //이메일 중복
			$(".check_email").text("사용가능한 이메일입니다.");
			$(".check_email").css("color", "#999");
			
			}
			else{
				$(".check_email").text("중복된 이메일입니다. 다시 확인하세요.");
				$(".check_email").css("color", "#999");
				$(this).focus();
			}
		},//success
		error : function(){
			alert("통신실패");
		}
	});//ajax
}//else



});
// 이메일 체크 끝

		//닉네임 체크 시작
		$('#nick').focusout(function(){
		//$("input[name='email']").blur(function(){ 
			var emailt = $('#email').val(); 
			
				if(emailt == '' || emailt == 'undefined' || emailt == null) {
					return false; 
				}else{
					var data = {
							nick : $('#nick').val()
						}
					console.log($('#nick').val());
				
					$.ajax({
						url: '/samsam/nickcheckajax.do',
						type: 'POST',
						data: JSON.stringify(data),
						contentType : 'application/json;charset=utf-8',
						dataType : 'json',
					
						success : function(map) {
							//$(".check_email").empty();
							if(map.nick == "ZERO"){  //이메일 중복
							$(".check_nick").text("사용가능한 닉네임입니다.");
							$(".check_nick").css("color", "#999");
							
							}
							else{
								$(".check_nick").text("중복된 닉네임입니다.");
								$("#nick").on(focus);
							}
						},//success
						error : function(){
							alert("통신실패");
						}
					});//ajax
			
				}//else
		});//닉네임체크 끝

	
	
	//비밀번호
	$('#pw').keyup(function(){
		if($('#pw').val().length <=6){
			$('.pass1').text("비밀번호를 6자리 이상 15자리 미만으로 설정하세요");
		}
		else{
			$('.pass1').text('');
		}
		});
	$('#pw').focusout(function(e){
		console.log($('#pw').val().length)
		if($('#pw').val().length <=6){
		$('#pw').empty();
		}
	});
	$('#pw2').focusout(function(e){
		if($('#pw').val() != $('#pw2').val()){
			$('.pass2').text("비밀번호가 일치하지 않습니다");
			$('#pw2').empty();
		
			}
		
		});
	//휴대번호
	$('.phone').keyup(function(){
		if(isEmpty($('.phone').val())){
			$('.phonecheck').text("");
		}else{
			$('.phonecheck').text("전화번호는 ' - ' 없이 숫자만 입력하세요");
		}
	});
	
	
   
});  //ready 끝

//이메일 형식
function email_check(emailt) { 
	var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; 
	return (emailt != '' && emailt != 'undefined' && regex.test(emailt)); }
//끝
 function num_check(str) {
      var i;
      for (i = 0; i < str.length; i++) {
        if ((str.substring(i, i + 1) < "0" || str.substring(i, i + 1) > "9")) {
          return false;
        }
      }
      return true;
    }//전화번호 랭스


  //서브밋 체크
    function check_input() {
     if(document.input_form.name.value==""){
    	 alert("이메일을 입력하세요");
         document.input_form.email.focus();
         return false;
     }

      // 패스워드 체크 ---->
      if (document.input_form.pw.value == "") {
        alert("패스워드를 입력하세요!!!");
        document.input_form.pw.focus();
        return false;
      }
      else {
        str = document.input_form.pw.value;
        if (str.length < 6 || str.length > 16) {
          alert("패스워드 길이 확인(6~16자리)!!!");
          document.input_form.pw.focus();
          return false;
        }

      }
      if (document.input_form.pw.value != document.input_form.pw2.value) {
        alert("패스워드 입력 오류!!!")
        document.input_form.pw2.focus();
        return false;
      }//패스워드 체크 <----

      // 전화번호 체크 --->
      if (document.input_form.phone.value.length == 11) {
        if (!num_check(document.input_form.phone.value)) {
          alert("전화번호입력 오류 !!!");
          document.input_form.phone.focus();
          return false;
        }
      }
      else {
        alert("전화번호를 입력하세요!!!");
        document.input_form.phone.focus();
        return false;
      }
      
      //
      if(document.input_form.local.value == ""){
    	  alert("이용지역을 선택하세요.");
          document.input_form.local.focus();
          return false;
      }
      if(!$("input:checked[id=check]").is(":checked")){
    	  alert("동의 후 회원가입이 완료됩니다");
    	  return;
      }
     console.log("너의 등급은 " + $('.grade').val())
	 if($('.grade').val() == '일반'){
	 swal("","인증번호가 발송되었습니다. 이메일을 확인하세요","info")
	 }
     input_form.submit(); // 서버로 전송
    }
  </script>

<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>
</head>

<body>
<div id="wrap">

<div class="join-header">
<hgroup>
  <h1>SIGN UP</h1>
</hgroup>
</div>
<% if (vo!= null) {%>
<form name="input_form" action = "kkoJoin.me" method="post" class="joinform" onsubmit="return check_input();" >
<%}else{ %>
<form name="input_form" action = "signUp.me" method="post" class="joinform" onsubmit="return check_input();" >
<%} %>
<div class="group">
  <div class="id">
  <% if(vo != null){ %>
  <input type="text"name="email" id="email" readonly value=<%=vo.getEmail() %>>
  <%} else {%>
	<input type="text"name="email" id="email">
  <%} %><span class="highlight"></span><span class="bar"></span>
    <label for="email" class="label-email"id="labelemail"><span class="content-email">Email</span></label>
  </div>
  <div class ="check_email"></div>
</div>

<div class="group">
	<input type="text"name="name" ><span class="highlight"></span><span class="bar"></span>
    <label for="name" class="label-email"><span class="content-email">이름</span></label>
</div>
<div class="group">
<div class="nick">
<% if(vo != null){ %>
<input type="text"name="nick"id="nick" value=<%=vo.getNick() %>>
<%} else {%>
	<input type="text"name="nick"id="nick">
<%} %>	<span class="highlight"></span><span class="bar"></span>
    <label for="nick" class="label-email"id="labelnick"><span class="content-email">닉네임</span></label>
</div>
<div class ="check_nick"></div>
</div>
  
  
<div class="group">
 <div class="pw">
	<input type="password" name="pw"id="pw"maxlength="16"><span class="highlight"></span><span class="bar"></span>
    <label for="pw"class="labelpw"><span class="content-email">password</span></label>
</div>
<div class="pass1"></div>
</div>

<div class="group group2">
 <div class="pw">
	<input type="password" name="pw2"id="pw2"maxlength="16"><span class="highlight"></span><span class="bar"></span>
    <label for="pw2"class="labelpw"><span class="content-email">password 확인</span></label>
</div>
<div class="pass2"></div>
</div>


<div class="group group2">
<div class="phonenum">
	<input type="number" name="phone" class="phone" maxlength="11" autocomplete="off"><span class="highlight"></span><span class="bar"></span>
    <label for="phone"class="labelphone"><span class="content-email">휴대폰 번호</span></label>
</div>
<div class="phonecheck"></div>
</div>
	
<div class="group">
   <div class="local-group">
	 <span><h5>이용지역</h5></span>
	 <select  name="local" class="local">
						<option value="">지역선택
						<option value="서울">서울
						<option value="경기">경기
						<option value="강원">강원
						<option value="경남">경남
						<option value="경북">경북
						<option value="광주">광주
						<option value="대구">대구
						<option value="대전">대전
						<option value="부산">부산
						<option value="세종">세종
						<option value="울산">울산
						<option value="인천">인천
						<option value="전남">전남
						<option value="전북">전북
						<option value="제주">제주
						<option value="충남">충남
						<option value="충북">충북
	<span class="bar"></span></select>
	
  </div>
</div>

<div class="wrap centre">
	<div class="checkbox">
		<input id="check" type="checkbox" name="check" value="check">
		<label for="check">약관동의</label>&nbsp;<a href="#">Terms and Conditions</a>
	</div>
</div>
	
	
<div class="group">	
<button type="button" class="button buttonBlue" value="회원가입" onclick="check_input();" >
회원가입</button>
  </div>
<div class="etc">
			<% if(vo != null){ %>
				<input type="hidden" name = "grade" value =<%=vo.getGrade() %>>
			<%} else{%>
			<input type="hidden" name="grade" class = "grade" value="일반">
			<input type="hidden" name="authkey" value="">
			<input type="hidden" name="status" value="0">
			<%} %>
		</div>
			

</form> 
	<!-- 카카오톡 채널 상담 -->
	<div class="kakaoChat">
	<a href="javascript:void plusFriendChat()">
    <img src="resources/img/kakaolink_btn_medium.png" width="45px" height="45px" class="kakao_btn">
	</a>
	</div>
	
	<!-- pageup button -->
	<div class ="back-to-top">
	<a href="home.me" class ="back-to-top" style="display: inline;">
	<i class = "fas fa-home"></i>
	</a>
	</div>
</div>
</body>
</html>
 
 

