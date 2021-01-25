<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.project.samsam.community.DocVO" %>
<%
	List<DocVO> doclist = (List<DocVO>)request.getAttribute("doclist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
	DecimalFormat form = new DecimalFormat("###,###,###");
	DocVO searchVO = (DocVO)request.getAttribute("vo");
	String email = (String) session.getAttribute("email");
	
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- 부트스트랩 4.0 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>
<style>


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

    
ul {
	background-color: white;
}


/* header, footer 이외 css */


.a_1{
  text-decoration:none;
  color:black;
  
}



*, *:before, *:after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

button {
    vertical-align: top;
    cursor: pointer;
}
button, select, textarea {
    margin: 0;
    font-size: 100%;
    vertical-align: top;
}
button {
    appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: -internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
    min-width: 0em;
    background-image:none;
    border:2px solid black;
}
select, button, textarea {
    display: inline-block;
    font-family: "Malgun Gothic", 'MalgunGothic', '맑은고딕', sans-serif;
    font-size: 12px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}


.btn.btn-sm {
    min-width: 110px;
    height: 38px;
    padding: 0 12px;
    line-height: 36px;
    font-size: 13px;
    letter-spacing: -.65px;
}
.btn.btn-sm {
    min-width: 110px;
    height: 38px;
    padding: 0 12px;
    line-height: 36px;
    font-size: 13px;
    letter-spacing: -.65px;
}

.btn {
    position: relative;
    display: inline-block;
    color: #fff;
    min-width: 140px;
    height: 44px;
    padding: 0 25px;
    background-color: #111;
    border: 1px solid #111;
    text-align: center;
    font-size: 16px;
    font-weight: 500;
    line-height: 42px;
    -webkit-transition: background-color .23s ease-out,border-color .23s ease-out;
    transition: background-color .23s ease-out,border-color .23s ease-out;
    font-size: 14px;
    letter-spacing: -.7px;
}



.section-title {
    color: #000;
    margin-bottom: 30px;
}
.section-title h2 {
	margin-top: 10px;
    font-size: 20px;
    font-weight: 400;
    position: relative;
    display: inline-block;
    border-bottom:none;
}
.post-entry-2 .thumbnail {
    background-size: cover;
    background-position: center;
    width: 30%;
   
}
.order-md-2 {
    -webkit-box-ordinal-group: 3;
    -ms-flex-order: 2;
    order: 2;
}
.post-entry-2 .contents {
    width: 70%;
    padding: 10px 20px;
}
.post-entry-2 .contents h2 {
    font-size: 15px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
    text-align:left;
    margin-top: 0;
    margin-bottom: 1rem;
}

.post-meta {
    font-size: .8rem;
}
.d-block {
    display: block!important;
}
.date-read {
    color: black;
  	width:60px;
  	text-align:center;
}
.post-entry-1, .post-entry-2 {
    font-size: .9rem;
    margin-bottom: 30px;
}
.tag{
	font-family: 'Nanum Pen Script', cursive;
	font-size:21px;
	color:#5c5c8a;
}




.contents {
    width: 736px;
    min-height: 800px;
}
.wrap-srch-home {
    position: relative;
    display:block;
    
}

.wrap-srch-home .inp-srch {
    display: block;
    width: 736px;
    height: 60px;
    padding: 0 10px 0 62px;
    border: 2px solid #222;
    border-radius: 30px;
    font-size: 18px;
    box-sizing: border-box;
}

header.add_gnb~.container .wrap-srch-home .btn-srch {
    top: 2px;
}
.wrap-srch-home .btn-srch {
    top: 2px;
    right: auto;
    left: 10px;
    width: 56px;
    height: 56px;
    color: #fff;
}
.wrap-srch-home .btn-srch {
    position: absolute;
    z-index: 1;
    top: -46px;
    right: 157px;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
     overflow: visible;
    border: 0;
    background-color: transparent;
    cursor: pointer;

}
#search_button{

top: 2px;
    right: auto;
    left: 10px;
    width: 56px;
    height: 56px;
    color: #fff;
}

a, button {
    touch-action: manipulation;
}
.wrap-srch-home .btn-srch:before {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    display: block;
    width: 24px;
    height: 24px;
    background: url(./resources/img/free-icon-search-1250705.png) center no-repeat;
    content: "";
}

.home-list {
    display: flex;
    flex-wrap: wrap;
    width:850px;
}
.home-list .best-list {
    width: 100%;
    margin: 35px 0 0;
}

.home-list .free-list {
    width: 100%;
    margin: 35px 0 0;
}

.detail-read{
	float:right;
	
}
.article:first-of-type {
    padding-top: 11px;
}
.article {
    display: flex;
    margin-top: 2px;
    border-bottom:1px solid #efefef;
    padding-top:5px;
    padding-bottom:5px;
}
.article_subject{
	display:inline-block;
	width:480px;
	padding-left:55px;
	overflow:hidden;
}
.article_writer{
	display:inline-block;
	width:95px;
	text-align:center;
}
.article_no{
	color:black;
	line-height:1.7;
	margin-bottom:0;
	width:50px;
	text-align:center;
}
.article_readcount{
	margin-left:35px;
	width:35px;
	text-align:center;
}
.article_comment{
	margin-left:28px;
	width:35px;
	text-align:center;
}
.head_category{
	display:inline-block;
	text-align:center;
	font-weight: bold;
}
.headsubject{
	font-size: 24px;
    line-height: 32px;
    font-weight: 700;
    font-family: "Roboto","Noto Sans KR",AppleSDGothicNeo-Regular,"Malgun Gothic","맑은 고딕",dotum,"돋움",sans-serif;
}


</style>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript">

</script>
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
			
			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section">
				
			
			<ul class="list-group list-group-flush">
				<li class="list-group-item click"><a href="doclist.bo">자유게시판</a></li>
				<li class="list-group-item"><a href="auth_fdoc.bo">책임분양인증</a></li>
				<li class="list-group-item"><a href="#">[개발중]</a></li>
			</ul>
			</div>
			
			<!-- 오른쪽. 내용이 들어갈 부분 -->
			<div class="content-section">
<div class="content">

<div class="home-list">

<div class="free-list">
<div class="section-title">
              <span class="caption d-block small">Categories</span>
              <h2>자유게시판</h2>
            </div>
<div style="padding-bottom:6px; padding-top:6px; border-top:1px solid #efefef; border-bottom:1px solid #efefef;"><div class="head_category" style="width:50px;">글번호</div><div class="head_category" style="width:480px;">제목</div><div class="head_category" style="width:95px;">작성자</div><div class="head_category" style="padding-left:10px;">작성일</div><div class="head_category" style="padding-left:45px;">조회수</div><div class="head_category" style="padding-left:30px;">댓글</div></div>

   <%
      	int num = listcount - ((nowpage - 1) * 10);
      	for(int i=0; i<doclist.size();i++){
      		DocVO vo=(DocVO)doclist.get(i);
      	
          %>
          <div class="article">
          <div class="article_no"><%=vo.getDoc_no() %></div>
          <div class="article_subject"><a style="color:black;" href="./docdetail.bo?doc_no=<%=vo.getDoc_no()%>&page=<%=nowpage%>"><%=vo.getDoc_subject() %></a></div>
          <div class="article_writer"><%=vo.getDoc_nick() %></div>
          <div class="date-read"><%=date.format(vo.getDoc_date()) %></div>
          <div class="article_readcount"><%=vo.getDoc_readcount() %></div>
          <div class="article_comment"><%=vo.getDoc_comment() %></div>
          </div>
          <%
        	num--;  
      	} %>
      	
</div>
</div>
	<div style="margin-top:20px;">
	
		
		<div style="text-align:center;display:inline-block;margin-left:400px;">
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ 
			
			%>
			<a href="./doclist.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
			<%}
			
			for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){
				//현재페이지는 링크가 필요없으므로 링크를 안검
				
				%>
				[<%=a %>]
				<%}else{ 
				
				%>
				<a href="./doclist.bo?page=<%=a %>">[<%=a %>]</a>
				&nbsp;
				
				<% } %>
			<%} %>
			
			<%if(nowpage>=maxpage){
				//더이상 읽을페이지가없을떄
					%>
			[다음]
			<%}else{ 
			
			%>
			<a href="./doclist.bo?page=<%=nowpage+1 %>">[다음]</a>
			<%}%>
			
			
		</div>
	<%if(email!= null){ %>
	<div style="display:inline-block; float:right;margin-right:125px;">
	   		<a href="./docform.bo">[글쓰기]</a>
	</div>
	<%} %>
	
</div>

</div>
</div>
			
	
		</div>
	


	<!-- 카카오톡 채널 상담 -->
	<div class="kakaoChat">
	<a href="javascript:void plusFriendChat()">
    <img src="./resources/img/kakaolink_btn_medium.png" width="45px" height="45px" class="kakao_btn">
	</a>
	</div>
	
	<!-- pageup button -->
	<div class ="back-to-top">
	<a href="#" class ="back-to-top" style="display: inline;">
	<i class = "fas fa-angle-up"></i>
	</a>
	</div>
	
	<footer id="footer">
<p>Copyright ©2021 All rights reserved | This template is made with <i class="fas fa-heart"></i> by SamSam

</footer>
</div><!-- 바디컨텐트 -->
	
		</div>



<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	 console.log("<%=email%>") 
     var session = '<%=email %>'
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

</body>
</html>			