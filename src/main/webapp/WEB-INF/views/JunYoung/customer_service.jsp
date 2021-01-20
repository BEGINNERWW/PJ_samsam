<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.samsam.myfree.*" %>

<%
	String email = (String)session.getAttribute("email");
	//email.toUpperCase();
	Member_listVO member_listVO = (Member_listVO)request.getAttribute("member_listVO");
	Myfree_doc_confirmVO myfree_doc_confirm_write = (Myfree_doc_confirmVO)request.getAttribute("myfree_doc_confirm_write");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- 부트스트랩 4.0 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>


<style>
/* 공통으로 사용하는 CSS */
@charset "utf-8";

* {
   margin:0;
   padding: 0;
}
html{
   margin:0 auto;
   width : 100%;
   height: 100%;
    overflow: auto;
}


body {
   margin: 0;
   height: auto;
    min-height : 600px;
    box-sizing : content-box;
   line-height: 1.7;
    color: gray;
      font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    font-size: .9rem;
}


a{
   text-decoration : none;
   color : #9494b8;
}
a:hover {
    color: #0056b3;
    text-decoration: none;
}

body {
   text-align: -webkit-center;
   display : flex;
   flex-direction : column;
   justify-content : space-between;
}

.body_content{
     margin : 0;
     padding : 0;
     width : 100%;
     height:100vh;
    display : flex;
    flex-direction : column;
}

#header {
    width: 100%;
    height: 190px;
    box-sizing: content-box;
    display: flex;
    flex-direction: column;
    border-bottom: 1px solid #efefef;
    padding-bottom: 18px;
    background-color : #fff;
    position : fixed;
    z-index : 100;
    top : 0;
    left : 0;
    right : 0;
}

.inout_gocen{
   position : inline;
   display : flex;
   justify-content : flex-end;
   margin-top : 20px;
   margin-right : 340px;
   background-color : #fff;
}
.fixinner{
   position: fixed; 
}
.header-top {
   margin-top : -10px;
   display : flex;
   justify-content : flex-start;
   margin-right: auto;
}
.header_btn{
   width : 70px;
   height : 30px;
   background-color : #fff;
   color : #9494b8;
    border-radius: 5px;
    border : none;
    outline : 0;
}
.header_btn:hover{
   color : #6200cc;
   font-weight: 700;
}
#logout, #mypage{
   display : none;
}
.img-circle{
   width : 450px;
   height : 150px;
   display: block;
   margin : 0 auto;
}
.nav-menu{
   margin : 0 auto;
   display : flex;
   justify-content : space-around;
   align-items: baseline;
   width: 1200px;
}
.sticky-wrapper{
   width: 400px;
   height: 50px;
   margin : 0;
   margin-left: 0;
     position: sticky;
     list-style : none;
    display : flex;
    padding: 0;
}

.sticky-wrapper > li{
   padding : 8px 8px;
   list-style-type:none;
   float: left;
}
.sticky-wrapper > ul{
   padding : 8px 8px;
}

li.dropdown {
    color: #9494b8;
    background: #fff;
    transition: .3s all ease;
    font-size: 20px;
    width: 90px;
    height: 50px;
}

.sticky-wrapper.active{
   position: fixed;
    top: 0px;
}

/* dropdown */
.dropdown-menu {
   display: none;
      justify-content : flex-start;
   position: absolute;
   list-style : none;
    visibility: visible;
    background-color: #fff;
   width: 1200px;
   top : 48px;
   margin-left : -30px;
   border: none;
   border-top: 1px solid #efefef;
}

.board {
	padding-left: 46px;
}
.care {
	padding-left: 30px;
}
.commu {
	padding-left: 35px;
}

li.dropdown > a {
    text-decoration: none;
}

.dropdown-menu li{
   margin-right : 40px;
}
.dropdown:hover .dropdown-menu { 
   display: flex; 
   visibility: visible; 
}

/* search-wrapper */
.search-wrapper {
  padding : 5px;
  width: 280px;
  height: 38px;
  display: flex;
  justify-content : space-betwwen;
  background: #fff;
  border: 2px solid #9494b8;
  border-radius: 10px;
}
.search-box {
  height : 100%;
  padding: 0;
  border: none;
  background: #fff;
}
.search-box.input {
  width : 80%;
  margin-left : 15px;
  font-size : .9rem;
}
.search-box.input:focus {outline:none;}

.search-box.btn1 {
  color : #9494b8;
  text-align : left; 
}

/* search-wrqpper */

.main-content{
   width : 100%;
   height : auto;
   margin : 0 auto;
}


/* footer */
#footer {
    margin: 0 auto;
    width: fit-content;
    bottom: 20px;
    position: relative;
}

.fa-heart{
   color : red;
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


/*카카오톡 톡상담*/
.kakaoChat {
    text-align: right;
    position: fixed;
    margin-right: 28px;
    bottom: 90px;
    right: 0;
}
.kakao_btn {
	border-radius: 1rem!important;
}

/* side menu와 내용 묶음 */
.content-wrap {
	width: 1200px;
	min-height: 100%;
	margin: 0 auto;
	position: relative;
	top: 50px;
	
}
/* side menu 틀*/
.sidemenu-section {
    width: 200px;
    font-size: 18px;
    text-align: left;
    min-height: 740px;
    border-right-color: darkblue;
    border-right: 1px solid #efefef;
    padding: 0px 0px 0 0;
    margin-left: 0;
    margin-top: 210px;
    position: fixed;
}


/* 내용 틀*/
.content-section {
    width: 1100px;
    height: max-content;
    position: relative;
    left: 0px;
    text-align: left;
    font-size: 14px;
    margin-top: 0px;
    color: black;
    margin-left: 0;
    padding-bottom: 100px;
    border-left-color: darkblue;
    padding-left: 0px;
    padding-right: 0;
    min-height: 940px;
    padding-top: 200px;
}

/* 각각의 페이지에서 사용할 CSS */


/* 테이블 */
table {
    border-collapse: collapse;
    margin: 0 auto;
}
.table{
    margin-bottom: 0rem;
}


div#accordion {
    width: 1000px;
}
.FAQ {
    margin-left: 50px;
    margin-right: 50px;
}

.card-body {
	background-color: ghostwhite;
    border-radius: 10px;
}
.btn-link {
    color: black; 
    text-decoration: none;
}
.btn-link:hover {
	text-decoration: none;
	
}

h5 {
    margin-top: -7px;
    margin-bottom: -7px;
}

.h4, h4 {
    font-size: 1.5rem;
    margin-bottom: 20px;
}

</style>

</head>
<body>
<div class ="body_content">
<header id = "header">

	<div class ="inout_gocen">
			<a href="loginForm.me"><input type="button" class= "header_btn" id="login" value="로그인"></a>
			<a href="logout.me"><input type="button" class= "header_btn" id="logout" value="로그아웃"></a>
			<a href="joinform.me"><input type="button" class= "header_btn" id="signin" value="회원가입"></a>
			<a href="mypage.me"><input type="button" class= "header_btn" id="mypage" value="마이페이지"></a>
			<a href="customer_service.me"><input type="button" class= "header_btn" id="gocen" value="고객센터"></a>
		</div>
	
	
		 <div class="nav-menu">
            <ul class="sticky-wrapper">
               <li class="dropdown"><a href="home.me">HOME</a></li>
               <li class="dropdown"><a href="home_list.bo">분양</a>
                  <ul class="dropdown-menu">
                     <li><a href="home_list.bo">&nbsp;&nbsp;가정분양</a></li>
                     <li><a href="fdoclist.bo">책임분양</a></li>
                     <li><a href="selladopt_list.bo">업체분양</a></li>
                  </ul></li>
               <li class="dropdown"><a href="/SJ/pet_list">보호소</a>
                  <ul class="dropdown-menu">
                     <li><a href="/SJ/pet_list">&nbsp;&nbsp;&nbsp;&nbsp;보호소</a></li>
                     <li><a href="/SJ/payang/list">파양</a></li>
                     <li><a href="/SJ/missing/list">실종</a></li>
                  </ul></li>
               <li class="dropdown"><a href="doclist.bo">커뮤니티</a>
                  <ul class="dropdown-menu">
                     <li><a href="doclist.bo">&nbsp;자유게시판</a></li>
                     <li><a href="auth_fdoc.bo">책임분양인증</a></li>
                  </ul></li>
            </ul>
				
	<div class="header-top">
		<div class="mainlogo">
		<a href="home.me">
		<img src = "resources/img/mainlogo.png" class = "img-circle">
		</a>
		</div>
	</div>
	
	
	<div class= "search-wrapper">
      <input class="search-box input" type="text" placeholder="Search">
      <button class="search-box btn1" type="button"><i class="fas fa-search"></i></button>
	</div>
	
	</div><!-- nav-menu -->
</header>
		
		<div class="main-content">
			<div class="content-wrap">
			
			<!--내용이 들어갈 부분 -->
			<div class="content-section">
				<h2>자주 묻는 질문</h2>
				<br><br><br>
					<div class="FAQ">
						<h4>회원</h4>
						<div id="accordion">
						
							<div class="card">
								<div class="card-header" id="headingOne">
									<h5>
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="false"
											aria-controls="collapseOne">판매허가인증을 받으려면 어떻게 해야 하나요?</button>
									</h5>
								</div>

								<div id="collapseOne" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">
										마이페이지의 판매허가번호 인증에서 본인의 판매번호 인증을 신청하시면 관리자가 검수 후 인증을 완료합니다.
									</div>
								</div>
							</div>
							
							<br><br>
							
							<h4>분양</h4>
							<div class="card">
								<div class="card-header" id="headingTwo">
									<h5>
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseTwo" aria-expanded="false"
											aria-controls="collapseTwo">분양게시판에서 반려동물을 분양하기 위해서는 어떻게 해야 하나요?</button>
									</h5>
								</div>

								<div id="collapseTwo" class="collapse"
									aria-labelledby="headingTwo" data-parent="#accordion">
									<div class="card-body">
									분양게시판에서 반려동물을 분양하기 위해서는 먼저 판매허가번호를 인증받아야 합니다. 판매허가번호를 인증받은 회원만이 업체분양, 가정분양 게시판에서
									반려동물 분양이 가능합니다.
									</div>
								</div>
							</div>
							
							<div class="card">
								<div class="card-header" id="headingThree">
									<h5>
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseThree" aria-expanded="false"
											aria-controls="collapseThree">책임분양이 무엇인가요?</button>
									</h5>
								</div>

								<div id="collapseThree" class="collapse"
									aria-labelledby="headingThree" data-parent="#accordion">
									<div class="card-body">
									책임분양이란 반려동물을 분양할 때 일정 금액의 책임분양비를 받고 분양해주는 방식입니다.
									책임분양비는 보통 일정 기간에 걸쳐 입양자로부터 본인이 분양한 반려동물의 안부를 확인 한 후 입양자에게 돌려주거나,
									분양자가 기부를 하는 등의 목적으로 사용됩니다.
									</div>
								</div>
							</div>
							
							<div class="card">
								<div class="card-header" id="headingFour">
									<h5>
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseFour" aria-expanded="false"
											aria-controls="collapseFour">책임분양 인증 시스템이 무엇인가요?</button>
									</h5>
								</div>

								<div id="collapseFour" class="collapse"
									aria-labelledby="headingFour" data-parent="#accordion">
									<div class="card-body">
									분양자가 책임분양이라는 명목으로 책임분양비를 받은 후에 연락이 두절되거나 사라지는 등의 문제가 발생하여, 입양자가 추후에 
									책임분양비를 돌려받지 못하는 경우가 종종 발생합니다.
									그래서 저희는 책임분양이 이루어질 때 책임분양비를 저희가 맡아두었다가 입양자가 일정한 기간에 걸쳐 반려동물의 안부를 확인할 수 있는
									글을 올릴 때 책임분양비를 나눠서 돌려드리고 있습니다. 이것을 책임분양 인증 시스템이라 합니다.
									만약 인증게시글을 올리지 않은 기간에 대한 책임분양비는 사전에 동의를 받아 기부 등의 목적으로 사용됩니다.
									</div>
								</div>
							</div>
							
							<div class="card">
								<div class="card-header" id="headingFive">
									<h5>
										<button class="btn btn-link collapsed" data-toggle="collapse"
											data-target="#collapseFive" aria-expanded="false"
											aria-controls="collapseFive">정액권이 무엇인가요?</button>
									</h5>
								</div>

								<div id="collapseFive" class="collapse"
									aria-labelledby="headingFive" data-parent="#accordion">
									<div class="card-body">
									저희는 무분별한 분양글의 도배를 막기 위해, 펫샵(동물판매업자)의 경우 정액제를 운영하고 있습니다. 
									정액권의 개수만큼 분양글을 게시할 수 있으며, 정액권의 금액은 한달에 올릴 수 있는 분양글의 개수에 따라 차등하여 정해집니다.
									<br>
									가정분양의 경우 따로 정액제를 운영하지 않고, 분양글을 1달에 5건으로 제한하고 있으며 3일에 한 번 기존에 작성한 글을 끌어올릴 수 있습니다.
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
					
 			</div> <!-- content-section -->
		</div> <!-- content-wrap -->
		<footer id="footer">
			<div>Copyright ©2021 All rights reserved | This template is made with <i class="fas fa-heart"></i> by SamSam</div>
		</footer>	
			
	</div> <!-- main-content -->


	<!-- 카카오톡 채널 상담 -->
	<div class="kakaoChat">
	<a href="javascript:void plusFriendChat()">
    <img src="resources/img/kakaolink_btn_medium.png" width="45px" height="45px" class="kakao_btn">
	</a>
	</div>
	
	<!-- pageup button -->
	<div class ="back-to-top">
	<a href="#" class ="back-to-top" style="display: inline;">
	<i class = "fas fa-angle-up"></i>
	</a>
	</div>
	
</div><!-- 바디컨텐트 -->


<script>
$(document).ready(function(){
    console.log("<%= email %>") 
    var session = '<%= email %>'
    console.log(session);
    if(session == "null" ){
        $('#logout').hide();
          $('#mypage').hide();
          $('#login').show();
          $('#signin').show();
        
     } //헤더 상단 로그인상태 일때
     else{
       $('#logout').show();
         $('#mypage').show();
         $('#login').hide();
         $('#signin').hide();
     }; //헤더 상단 로그아웃상태 일때 
  });
</script>


<!-- 부트스트랩 4.0 js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	

<!-- 카카오톡 채널 상담 js -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('be685f4c6119a7e447cd31c67878faf1');
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    function plusFriendChat() {
        Kakao.Channel.chat({
              channelPublicId: '_cjxmxiK' // 카카오톡채널 홈 URL에 명시된 홈ID
        });
    }
    
  //]]>
</script>


<script language="javascript">
function write_auth() {
	write_free_auth_form.submit();
}
</script>

<!-- 새로고침시 스크롤 유지 -->
<script>
﻿
//item click 을 통한 상세 화면 이동관련 함수

function itemClick(itemIndex) {

//쿠키에 관련 내용 저장

var scrollHeightPosition = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;

setCookie("category", "myCategory"); // 쿠키에 내용을 정의하는 사용자 정의 함수

setCookie("scroll_position", scrollHeightPosition); // 쿠키에 내용을 정의하는 사용자 정의 함수


//상세 화면 이동

nextPage(itemIndex); // 페이지 이동하는 사용자 정의 함수

}


//body.onload 시 사용하게 될 함수

function afterLoad() {

//쿠키에 저장된 내용 호출

var category = getCookie("category"); // 쿠키의 내용을 불러오는 사용자 정의 함수

var scrollPosition = getCookie("scroll_position"); // 쿠키의 내용을 불러오는 사용자 정의 함수

var pageCategory = 'myCategory'; // 페이지 로딩 시 현제 카테고리 내용

if (category != "" && category != 'undefined' && category == pageCategory &&

scrollPosition != "" && scrollPosition != 'undefined') {

window.scroll(0, scrollPosition); // 또는 body.scrollTop(scrollPosition);

}

//쿠키 내용 초기화

setCookie("category", "");

setCookie("scroll_position", "");

}

﻿</script>
	
</body>
</html>










