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

<!-- Summernote -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<script>
    $('.search-box btn').click(function(){
      
    });
    $('#keyword').keypress(function(event){
      if(event.which == 13){
        $('.search-box btn').click();
        return false;
      }
    });
</script>
<style>
/* 공통으로 사용하는 CSS */
@charset "utf-8";

body::-webkit-scrollbar { 

    display: none; 

}

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
    height: 189px;
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
    width: 1001px;
    height: max-content;
    position: relative;
    left: 100px;
    text-align: left;
    font-size: 14px;
    margin-top: 0px;
    color: black;
    margin-left: 0;
    padding-bottom: 100px;
    border-left-color: darkblue;
    border-left: 1px solid #efefef;
    padding-left: 50px;
    padding-right: 0;
    min-height: 940px;
    padding-top: 200px;
}

/* 각각의 페이지에서 사용할 CSS */


.list-group {
	border-bottom: 1px solid rgba(0,0,0,.125);
}
.list-group-item {
    position: relative;
    display: block;
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: white;
    border: 1px solid rgba(0,0,0,.125);
}
/* 현재 페이지의 서브메뉴 */
li.list-group-item.click > a {
    font-weight: bold;
    color: #5c5c8a;
}


.list-group-item > a {
	text-decoration : none;
	}

/* 프로필 사진  */
.profile {
    text-align: center;
}

/* 테이블 */
table {
    border-collapse: collapse;
    margin: 0 auto;
}
.table{
    margin-bottom: 0rem;
}

/* 책임분양내역 */
.auth_img {
    -webkit-box-flex: 0;
    flex: 0 0 45.666667%;
    max-width: 45.666667%;
}
.card-body {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.2rem;
}

.card-img {
    width: 380px;
    height: 253px;
    border-radius: calc(0.75rem - 1px);
}

p.card-text {
    text-align: left;
    margin-bottom: 5px;
}
input#fdoc_img {
    margin-bottom: 5px;
    margin-top: 20px;
}
.no-gutters {
    margin-right: 0;
    margin-left: 0;
    border: 1px solid rgba(0,0,0,.125);
}
.auth-btn {
    width: 71.45px;
    height: 29px;
    padding:1px;
}

/*책임분양 인증현황*/
.auth-confirm {
	border: 1px solid rgba(0,0,0,.125);
}

*, ::after, ::before {
    box-sizing: border-box;
    border-radius: .25rem;
}

.row.auth-date {
    justify-content: space-between;
}
.s-date {
    margin-left: 16px;
}
.e-date {
    margin-right: 16px;
}
.s-date-label {
    margin-left: 20px;
}
.e-date-label {
    margin-right: 20px;
}
.progress-bar {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    color: #fff;
    text-align: center;
    background-color: #158cba;
    transition: width .6s ease;
    border
}
form.input-account {
    margin-left: 20px;
}


.btn:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.btn-primary {
    border-color:  #00BCD4;
}

.btn-primary {
    color: #fff;
    background-color:  #00BCD4;
}

.btn-primary:hover {
    color: #fff;
    background-color: #009eb3;
    border-color: #009eb3;
}

.btn-danger {
    border-color: #ed457d;
}
.btn-danger {
    color: #fff;
    background-color: #ed457d;
}
.btn-danger:hover {
    color: #fff;
    background-color: #e8175d;
    border-color: #e8175d;
}

.row.account-auth {
    justify-content: space-between;
}

/* summernote */
.note-editor.note-frame .note-editing-area .note-editable {
    padding: 10px;
    overflow: auto;
    color: #000;
    background-color: #fff;
    
}

</style>

</head>
<body>
<div class ="body_content">
<header id = "header">

		<div class ="inout_gocen">
         <%if(email != null){ %>
         
         <input  type="button" class= "header_btn"  value="로그아웃" onclick="location.href='logout.me'">
         <input  type="button" class= "header_btn"  value="마이페이지" onclick="location.href='mypage.me'">
         <%}else{ %>
         <input  type="button" class= "header_btn" value="로그인" onclick="location.href='loginForm.me'">
         <input  type="button" class= "header_btn" value="회원가입" onclick="location.href='joinform.me'">
         <%} %>
         <a href="customer_service.me"><input type="button" class= "header_btn" id="gocen" value="고객센터"></a>
      </div>
	
		<div class="nav-menu">
            <ul class="sticky-wrapper">
               <li class="dropdown"><a href="home.me">HOME</a></li>
               <li class="dropdown"><a href="home_list.bo">분양</a>
                  <ul class="dropdown-menu board">
                     <li><a href="home_list.bo">&nbsp;&nbsp;가정분양</a></li>
                     <li><a href="fdoclist.bo">책임분양</a></li>
                     <li><a href="selladopt_list.bo">업체분양</a></li>
                  </ul></li>
             <li class="dropdown"><a href="SJ/pet_list">보호소</a>
                  <ul class="dropdown-menu care">
                     <li><a href="SJ/pet_list">&nbsp;&nbsp;&nbsp;&nbsp;보호소</a></li>
                     <li><a href="SJ/payang/list">파양</a></li>
                     <li><a href="SJ/missing/list">실종</a></li>
                  </ul></li>
               <li class="dropdown"><a href="doclist.bo">커뮤니티</a>
                  <ul class="dropdown-menu commu">
                     <li><a href="doclist.bo">&nbsp;자유게시판</a></li>
                     <li><a href="auth_fdoc.bo">책임분양인증</a></li>
                     <li><a href="hospital_map.me">Map</a></li>
                  </ul></li>
            </ul>
				
	<div class="header-top">
		<div class="mainlogo">
		<a href="home.me">
		<img src = "resources/img/mainlogo.png" class = "img-circle">
		</a>
		</div>
	</div>
	
	
	 <form action="home_search.me" method="post" name="home_search">
            <div class="search-wrapper">
               <input class="search-box input"  id="keyword" name="keyword" type="text" placeholder="Search">
               <button class="search-box btn" type="submit">
                  <i class="fas fa-search"></i>
               </button>
            </div>
      </form>
	
	</div><!-- nav-menu -->
</header>
		
		<div class="main-content">
			<div class="content-wrap">
			
			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section">
				
			
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="myinfo_check.me">회원정보</a></li>
				<li class="list-group-item"><a href="myinfo_write.me">작성글관리</a></li>
				<li class="list-group-item click"><a href="myfree_auth.me">책임분양관리</a></li>
				<li class="list-group-item"><a href="myinfo_auth.me">판매허가번호인증</a></li>
			</ul>
			</div>
			
			<!-- 오른쪽. 내용이 들어갈 부분 -->
			<div class="content-section">
				<h2>책임인증글 작성</h2>
				<br>
<form action="./write_auth.me#write" method="post" name="write_free_auth_form" enctype="multipart/form-data">
<input type="hidden" name="fadoc_r_email" value="<%=myfree_doc_confirm_write.getConfirm_fdoc_r_email() %>">
<input type="hidden" name="fadoc_s_email" value="<%=myfree_doc_confirm_write.getConfirm_fdoc_s_email() %>">
<input type="hidden" name="fadoc_confirm_no" value="<%=myfree_doc_confirm_write.getConfirm_no() %>">
<input type="hidden" name="confirm_fdoc_code" value="<%=myfree_doc_confirm_write.getConfirm_fdoc_code() %>">
<input type="hidden" name="fadoc_nick" value="<%=session.getAttribute("nick") %>">
<input type="hidden" name="fadoc_check" value="검토중">
<input type="hidden" name="fadoc_comment" value=0>
<table border="2" width="830px">
	<tr>
		<td>
			<table width="820px" cellspacing="10px">
				<tr><td height="5px"></td></tr>
				<tr>
					<th width="100px" class="text-center" height="15">제목</th>
					<td width="700px"><input name="fadoc_subject" class="titleFocus" type="text" size="85" style="padding-left: 3px;"></td>
				</tr>
				<tr><td height="5px"></td></tr>
				<tr>
					<th width="100px" class="text-center">분양코드</th>
					<td><%=myfree_doc_confirm_write.getConfirm_fdoc_code() %></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="820" colspan="2">
  						<textarea id="summernote" name="fadoc_content"></textarea>
						</form>
					</td>
				</tr>
			</table>		
		</td>
	</tr>
</table>
<br>
	<center>
		<button type="button" class="btn btn-primary btn-md"><a href="javascript:write_auth()" style="color:white;">등록하기</a></button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-danger btn-md"><a href="javascript:history.go(-1)" style="color:white;">취소하기</a></button>
	</center>
<br>
 			
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
//제목에 focus
$(document).ready(function(){
  $("input.titleFocus").focus();
});
</script>

<!-- 부트스트랩 4.0 js -->
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

<!-- Summernote -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>




<script>

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
     height: 500,                 // 에디터 높이
     minHeight: null,             // 최소 높이
     maxHeight: null,             // 최대 높이
     focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
     lang: "ko-KR",               // 한글 설정
     placeholder: '책임분양을 받은 아이의 사진을 포함해서 올려주세요',	//placeholder 설정
       callbacks: {
            onImageUpload: function(files, editor, welEditable) {
                  for (var i = files.length - 1; i >= 0; i--) {
                     sendFile(files[i], this);
                  }
              }
         }
       
});

$("div.note-editable").on('drop',function(e){
    for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
    	sendFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
    }
   e.preventDefault();
})

function sendFile(file, el) {
    var form_data = new FormData();
    form_data.append('file', file);
	
    $.ajax({
      
      data: form_data,
      type: "post",
      url: 'auth_img.me',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(url) {
     		 $(el).summernote('editor.insertImage', url);
     		 
      }
    });
  }
		 
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










