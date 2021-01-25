<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 템플릿  CSS -->

<link rel="stylesheet" href="./resources/fonts/icomoon/style.css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- 부트스트랩 4.0 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->

	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: hidden;
}
.body_content {
	margin: 0;
	height: 100vh;
    min-height : 600px;
    box-sizing : content-box;
	line-height: 1.7;
    color: gray;
   	font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    font-size: .9rem;
    overflow:scroll;
}
table {
	margin: auto;
	width: 60%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

textarea {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: -internal-light-dark(black, white);
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: textarea;
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
	-webkit-rtl-ordering: logical;
	flex-direction: column;
	resize: auto;
	cursor: text;
	white-space: pre-wrap;
	overflow-wrap: break-word;
	margin: 0em;
	font: 400 13.3333px Arial;
	border-width: 1px;
	border-style: solid;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
	padding: 2px;
}


a {
	text-decoration: none;
	color: #9494b8;
}

.name {
	color: #37acc9;
	font-size: 16px;
	margin-top: 16px;
	line-height: 16px;
}

.agreement {
	margin: 10px auto;
}

.option {
	margin-right: 15px;
}

.wrap-info {
	margin-top: 10px;
	margin-bottom: 35px;
}

@charset "utf-8";

* {
	margin: 0;
	padding: 0;
}

html {
	margin: 0 auto;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

a:hover {
	color: #0056b3;
	text-decoration: none;
}

body {
	margin: 0;
	height: 100vh;
	min-height: 600px;
	box-sizing: content-box;
	line-height: 1.7;
	color: gray;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	font-size: .9rem;
}

a {
	text-decoration: none;
	color: #9494b8;
}

body {
	text-align: -webkit-center;
}

.body_content {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100vh;
	display: flex;
	flex-direction: column;
	overflow: auto;
}

#header {
	width: 100%;
	height: 190px;
	box-sizing: content-box;
	display: flex;
	flex-direction: column;
	border-bottom: 1px solid #efefef;
	padding-bottom: 20px;
}

.inout_gocen {
	position: fixed;
	top: 20px;
	right: 390px;
}

.header-top {
	margin-top: 40px;
	display: flex;
	justify-content: flex-start;
	margin-right: auto;
}

.header_btn {
	width: 70px;
	height: 30px;
	background-color: #fff;
	color: #9494b8;
	border-radius: 5px;
	border: none;
	outline: 0;
}

.header_btn:hover {
	color: #6200cc;
	font-weight: 700;
}

#logout, #mypage {
	display: none;
}

.img-circle {
	width: 450px;
	height: 150px;
	display: block;
	margin: 0 auto;
}

.nav-menu {
	margin: 0 auto;
	display: flex;
	justify-content: space-around;
	align-items: baseline;
	width: 1200px;
}

.sticky-wrapper {
	width: 400px;
	height: 50px;
	margin: 0;
	margin-left: 0;
	position: sticky;
	list-style: none;
	display: flex;
	padding: 0;
}

.sticky-wrapper>li {
	padding: 8px 8px;
	list-style-type: none;
	float: left;
}

.sticky-wrapper>ul {
	padding: 8px 8px;
}

li.dropdown {
	color: #9494b8;
	background: #fff;
	transition: .3s all ease;
	font-size: 20px;
	width: 90px;
	height: 50px;
	text-align: -webkit-center;
}

.sticky-wrapper.active {
	position: fixed;
	top: 0px;
}

/* dropdown */
.dropdown-menu {
	display: none;
	justify-content: flex-start;
	position: absolute;
	list-style: none;
	visibility: visible;
	background-color: rgb(0, 0, 0, 0);
	width: 350px;
	top: 48px;
	padding: 5px;
	border: none;
}
.dropdown_1{
	backgrond-color:transparent !important;
	border:0px;
	
}


.dropdown-menu li {
	margin-right: 40px;
	text-decoration: none;
    color: #9494b8;
}

.dropdown:hover .dropdown-menu {
	display: flex;
	visibility: visible;
}

/* search-wrapper */
.search-wrapper {
	padding: 5px;
	width: 280px;
	height: 38px;
	display: flex;
	justify-content: space-betwwen;
	background: #fff;
	border: 2px solid #9494b8;
	border-radius: 10px;
}

.search-box {
	height: 100%;
	padding: 0;
	border: none;
	background: #fff;
}

.search-box.input {
	width: 80%;
	margin-left: 15px;
	font-size: .9rem;
}

.search-box.input:focus {
	outline: none;
}

.search-box.btn {
	color: #9494b8;
	text-align: left;
}

/* search-wrqpper */
.main-content {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

/* footer */
#footer {
	position: relative;
    margin: -15px auto;
    width: 100%;
    bottom: 0px;
    padding-bottom:10px;
    padding-top: 35px;
    z-index: -1;
    border-top: 1px solid #efefef;
    
}




p {
	text-align: left;
}

.fa-heart {
	color: red;
}

/* pageup button */
.back-to-top {
	width: 40px;
	height: 40px;
	margin: 0 auto;
	font-size: 24px;
	color: white;
	background-color: #149DDD;
	border-radius: 50%;
	visibility: visible;
	position: fixed;
	bottom: 45px;
	right: 30px;
	text-align: center;
}
/* pageup button */
*, ::after, ::before {
	box-sizing: border-box;
}

/*카카오톡 톡상담*/
.kakaoChat {
	width: 44px;
	height: 100px;
	margin: 0 auto;
	font-size: 24px;
	color: white;
	border-radius: 50%;
	visibility: visible;
	position: fixed;
	bottom: 45px;
	right: 30px;
	text-align: center;
}

.kakao_btn {
	border-radius: 1rem !important;
}

/* side menu와 내용 묶음 */
.content-wrap {
    width: 1200px;
    margin: 0 auto;
    position: relative;
    top: 50px;
    overflow: visible;
    margin-bottom: 100;

}

.cont_comment {
	margin-top: 35px;
}

.content-wrap::-webkit-scrollbar {
	display: none;
}

.sidemenu-section {
	width: 200px;
	position: absolute;
	font-size: 18px;
	text-align: left;
	height: 100%;
	padding: 0px 0px 0 0;
	margin-left: 0;
}

.content-section {
	width: 1000px;
	position: relative;
	left: 200px;
	text-align: left;
	font-size: 14px;
	margin-top: 3px;
	color: black;
	padding-left: 50px;
	border-left: 1px solid #efefef;
}

.content-section::-webkit-scrollbar {
	display: none;
}

.list-group-item {
	position: relative;
	display: block;
	padding: .75rem 1.25rem;
	margin-bottom: -1px;
	background-color: white;
	border: 1px solid rgba(0, 0, 0, .125);
}

li.list-group-item.click>a {
	font-weight: bold;
	color: #5c5c8a;
}

.list-group-item>a {
	text-decoration: none;
}

.dropdown-menu {
	display: none;
	justify-content: flex-start;
	position: absolute;
	list-style: none;
	visibility: visible;
	background-color: rgb(0, 0, 0, 0);
	width: 350px;
	top: 48px;
	padding: 5px;
	border: none;
}

a {
	text-decoration: none;
	color: #9494b8;
}

.comment_view .list_comment>li {
	position: relative;
	padding: 0 45px;
}

.cont_comment .txt_date {
	color: #959595;
}

.comment_view {
	padding-top: 10px;
}

.comment_section .comment_info .comment_post .opt_more_g {
	margin-top: 0;
}

.comment_section .comment_post .opt_more_g {
	margin: 1px 4px 0 0;
}

.opt_more_g {
	float: left;
}

.comment_section .txt_date {
	font-size: 11px;
}

.comment_more {
	position: absolute;
	top: 18px;
	right: 0;
}

.comment_view .comment_section {
	display: table;
	width: 100%;
	position: relative;
	padding: 19px 0 16px;
	table-layout: fixed;
	box-sizing: border-box;
}

.comment_view .list_comment>li:after {
	position: absolute;
	bottom: 0;
	left: 72px;
	right: 30px;
	height: 1px;
	background-color: #eee;
	content: "";
}

.link_write:link, .link_write:visited {
	text-decoration: none;
	color: #666;
}

.link_write:hover {
	text-decoration: underline;
	color: #666;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.all dd, .all dl, .all dt, .all p, li, ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.comment_more .link_write {
	color: #666;
	float: left;
	margin-right: 10px;
}

.comment_section .comment_info .comment_post .ico_bbs {
	margin-top: 2px;
	margin-left: 1px;
}

.comment_re .comment_post+.comment_write {
	padding-top: 23px;
}

.ico_bbs.ico_lock {
	width: 14px;
	height: 14px;
	margin-top: 3px;
}

.ico_bbs {
	display: inline-block;
	vertical-align: top;
	text-indent: -9999px;
}

.ico_bbs.ico_lock {
	background:
		url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/14_lock.svg);
}

body, button, div, input, select, table, td, textarea, th {

	-webkit-font-smoothing: antialiased;
}

body, div, table, td, th, tr {
	line-height: 1.6;
}

body {
	margin: 0;
	padding: 0;
	font-size: 13px;
}

.comment_section .comment_info .comment_post .ico_bbs.ico_new,
	.comment_section .comment_info .comment_post .ico_role,
	.comment_section .comment_info .comment_post .link_write,
	.comment_section .comment_info .comment_post .tag_comment,
	.comment_section .comment_info .comment_post .txt_date,
	.comment_section .comment_info .comment_post .txt_name {
	vertical-align: middle;
}

.comment_section .comment_post .box_post {
	overflow: hidden;
}

.comment_re {
	display: table;
	width: 100%;
	position: relative;
	padding: 19px 0 16px;
	table-layout: fixed;
	box-sizing: border-box;
	padding: 9px 0 14px 39px;
}

.comment_re .txt_date {
	font-size: 11px;
}

.comment_section .comment_post+.comment_write {
	padding-top: 23px;
}

.comment_section .comment_post+.comment_write {
	padding-top: 23px;
}

.comment_view .comment_write {
	padding: 0;
	margin-top: 0;
}

.cont_comment .comment_write {
	margin-top: 30px;
	padding: 0 30px;
	padding-bottom: 40px;
}

.cont_comment .inner_text_write {
	border-color: #efefef;
	background-color: #fff;
}

.text_write_g .inner_text_write {
	border: 1px solid #efefef;
	padding: 10px 10px 10px 16px;
	background-color: #fff;
	border-radius: 2px;
}

.text_write_g .wrap_menu {
	margin-top: 3px;
}

.text_write_g .wrap_menu .area_r {
	font-size: 0;
}

.text_write_g .wrap_menu .area_r .btn_item {
	margin: 8px 0 0 15px;
}

.text_write_g .wrap_menu .btn_item {
	vertical-align: top;
}

.btn_g_ico {
	margin: 0;
	padding: 0;
	cursor: pointer;
	border: 0;
	background-color: rgba(0, 0, 0, 0);
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
	background-color: -internal-light-dark(rgb(239, 239, 239),
		rgb(59, 59, 59));
	box-sizing: border-box;
	margin: 0em;
	font: 400 13.3333px Arial;
	padding: 1px 6px;
	border-width: 2px;
	border-style: outset;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
}

.btn_g_ico.ico_on .ico_lock_state {
	background:
		url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/18_lock_on.svg);
}

.ico_bbs.ico_lock_state {
	background:
		url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/18_lock_default.svg);
}

.btn_g_ico.ico_on .ico_lock_state, .ico_bbs.ico_lock_state {
	width: 18px;
	height: 18px;
}

.text_write_g .wrap_menu .btn_group {
	display: inline-block;
	margin-left: 15px;
}

.text_write_g .box_textarea .info_text, .text_write_g .box_textarea textarea
	{
	width: 100%;
	height: 86px;
	padding: 0;
	border: 0;
	font-size: 13px;
	background-color: rgba(0, 0, 0, 0);
}

.comment_section .comment_info .desc_info {
	margin: 0px;
	font-size: 13px;
	word-break: break-all;
}

.comment_re .comment_info .desc_info {
	margin: 0px;
	font-size: 13px;
	word-break: break-all;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.text_write_g .box_textarea textarea {
	resize: none;
	vertical-align: top;
}

textarea {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: -internal-light-dark(black, white);
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: textarea;
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
	-webkit-rtl-ordering: logical;
	flex-direction: column;
	resize: auto;
	cursor: text;
	white-space: pre-wrap;
	overflow-wrap: break-word;
	margin: 0em;
	font: 400 13.3333px Arial;
	border-width: 1px;
	border-style: solid;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
	padding: 2px;
	resize: none;
	vertical-align: top;
}

.comment_view .comment_write {
	padding: 0;
	margin-top: 0;
}

.cont_comment .area_r {
	float: right;
}

.text_write_g .wrap_menu:after {
	display: block;
	clear: both;
	content: "";
}

.btn_g.full_type1 {
	background-color: #ff5656;
	color: #fff;
	border: 0;
}

.btn_g {
	display: inline-block;
	height: 34px;
	padding: 6px 14px;
	border: 1px solid #e4e4e4;
	border-radius: 2px;
	cursor: pointer;
	box-sizing: border-box;
	font-size: 12px;
	text-align: center;
	line-height: 14px;
	vertical-align: middle;
}
.option-wrap{
display:inline-block;
float:right;
margin-right:40px;
}
select, input, button, textarea {
    display: inline-block;
    font-family: "Malgun Gothic", 'MalgunGothic', '맑은고딕', sans-serif;
    font-size: 12px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.article-content{
	margin-bottom:60px;
}
.option-info{
	color:#94969b;
}
.headsubject{
	font-size: 24px;
    line-height: 32px;
    font-weight: 700;
    font-family: "Roboto","Noto Sans KR",AppleSDGothicNeo-Regular,"Malgun Gothic","맑은 고딕",dotum,"돋움",sans-serif;
}
.article-head{
padding: 0 0 29px;
    border-bottom: 1px solid #eee;
}


.textarea_input {
    display: block;
    width: 100%;
    min-height: 140px;
    padding: 11px 12px 10px;
    border: 1px solid #a9a9a9;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
}

</style>
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
      <img src = "./resources/img/mainlogo.png" class = "img-circle">
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
					<li class="list-group-item click"><a href="${pageContext.request.contextPath}/SJ/pet_list">보호소</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/SJ/payang/list">파양</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/SJ/missing/list">실종</a></li>
			</ul>
			</div>
			
			<!-- 오른쪽. 내용이 들어갈 부분 -->
			<div class="content-section">
				<h2></h2>
				<div class="contents">
					<div class="article-head">
						<p style="font-szie:16px;font-weight:bold;">보호소 &nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;실종 게시판</p>
						<h2 class="headsubject">${missing.doc_subject}</h2>
						<p class="name">${missing.doc_name}</p>
						<div class="option-info">
							<span class="big option"> 
								<i class="fas fa-dog"></i> 
								<i class="fas fa-cat"></i> 
								<i class="fas fa-dove"></i>
								${missing.doc_big_name}
							</span> 
								<span class="kind_of option">
									<i class="fas fa-tags"></i>&nbsp;
									${missing.doc_kind}
								</span> 
								<span class="local option">
									<i class="fas fa-map-marker-alt"></i>&nbsp;
									${missing.doc_sido}
								</span>
					
					 </div> 
						<div class="option-info">
							<span class="date option"><i class="far fa-clock"></i>&nbsp;</span>
							<span class="pv option"><i class="far fa-eye"></i>&nbsp;</span>
							<span class="cmt"><i class="far fa-comment"></i>&nbsp;</span>
							<div class="option-wrap">
								<span><a href="modify?doc_no=${missing.doc_no}">수정</a>&nbsp;&nbsp;&nbsp;</span>
								<span><a href="remove?doc_no=${missing.doc_no}">삭제</a></span>
							</div>
						</div>
						</div>
					</div>
					
					
					<div class="article-view-content">
						<div class="article-content">
							${missing.doc_content}
						</div>
					</div>
						
						
						
					
						
					<div class="cont_comment" style="background-color: #f8f8f8;">
						<div style="width: 100%; margin: 0;">
							<div class="comment_view">
								<ul class="list_comment"></ul>
							</div>
						</div>
						<div style="margin: 0; width: 100%; background-color: #F8F8F8;">
							<div id="fdoc_refly">
								<div class="text_write_g comment_write">
									<div class="inner_text_write">
										<%-- 세션 정보로 수정할 것 --%>
										<input type="hidden" id="doc_nick" value="${missing.doc_nick }" />
										<input type="hidden" id="doc_email" value="${missing.doc_email }" />
										<div class="box_textarea">
											<textarea id="doc_content" name="doc_content"
												placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."
												maxlength="600" style="height: 86px;"></textarea>
										</div>
										<div class="wrap_menu">
											<div class="area_r">
												<button id="secretcheck"
													class="btn_g_ico btn_item secret_button" data-is-hidden="">
													<span class="ico_bbs ico_lock_state">비밀글</span>
												</button>
												<div class="btn_group">
													<button class="btn_g full_type1 confirm_button"
														onclick="commentInsert();" id="fdoc_submit"
														style="font-size: 13px;">등록</button>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
				
			</div>
	


	<!-- 카카오톡 채널 상담 -->
	<div class="kakaoChat">
	<a href="javascript:void plusFriendChat()">
    <img src="${pageContext.request.contextPath}/resources/img/kakaolink_btn_medium.png" width="45px" height="45px" class="kakao_btn">
	</a>
	</div>
	
	<!-- pageup button -->
	<div class ="back-to-top">
	<a href="#" class ="back-to-top" style="display: inline;">
	<i class = "fas fa-angle-up"></i>
	</a>
	</div>
	
</div><!-- 바디컨텐트 -->
	
		
<footer id="footer">
<p>Copyright ©2021 All rights reserved | This template is made with <i class="fas fa-heart"></i> by SamSam

</footer>


<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		
		// 댓글 조회
		commentList();
		
		 
		var form = $('#board');
		// 수정 버튼 클릭 이벤트
		$('#btnModify').on('click',function() {
			var doc_no = $('#doc_no').val();
			location.href = "/samsam/SJ/missing/modify?doc_no=" + doc_no;
		});
		 
		// 삭제 버튼 클릭 이벤트
		$('#btnRemove').on('click',function() {
			form.attr("action", "/samsam/SJ/missing/remove");
			form.attr("method", "post");
			form.submit();
		}); 
		 
		// 목록 버튼 클릭 이벤트
		$('#btnList').on('click',function() {
			location.href = "/samsam/SJ/missing/list";
		}); 
		 
	}); 
	
	
	// 댓글 등록
	function commentInsert() {
		
		var doc_content = $("#doc_content").val();
		var doc_no = "${missing.doc_no}";
		// 나중에 세션 정보로 변경할 것
		var doc_email = "${missing.doc_email}";
		var doc_nick = "${missing.doc_nick}";
		
		$.ajax({
		    url:'comment_insert', //request 보낼 서버의 경로
		    type : 'POST',
    		data :  {	'doc_no' : doc_no,
    					'doc_content' : doc_content , 
    					'doc_email' : doc_email , 
    					'doc_nick' : doc_nick , 
    					'doc_secret' : 'N'
    				},
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		        if( data == 1 )
		        	commentList();
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});


	}
	
	// 댓글 목록 조회
	function commentList() {
		var doc_no = "${missing.doc_no}";
		
		$.ajax({
		    url:'comment_list', //request 보낼 서버의 경로
		    type : 'GET',
    		data :  {	
    					'doc_no' : doc_no
    				},
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		        console.log(data);
		        $('.list_comment').empty();
		        $('.list_comment').append(data);
		        
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
		
	}

</script>

<!-- 부트스트랩 4.0 js -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
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

