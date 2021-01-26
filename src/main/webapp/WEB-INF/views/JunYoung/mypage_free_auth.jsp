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
	List<Myfree_doc_confirmVO> myfree_doc_confirmVO = (List<Myfree_doc_confirmVO>)request.getAttribute("myfree_doc_confirmVO");
	List<Myfree_authVO> myfree_authVO = (List<Myfree_authVO>)request.getAttribute("myfree_authVO");
	List<Myfree_docVO> myfree_docVO = (List<Myfree_docVO>)request.getAttribute("myfree_docVO");
	
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	
	int listcount_doc=((Integer)request.getAttribute("listcount_doc")).intValue();
	int nowpage_doc=((Integer)request.getAttribute("page_doc")).intValue();
	int maxpage_doc=((Integer)request.getAttribute("maxpage_doc")).intValue();
	int startpage_doc=((Integer)request.getAttribute("startpage_doc")).intValue();
	int endpage_doc=((Integer)request.getAttribute("endpage_doc")).intValue();
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
      z-index : 10000;
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
p{
   text-align : center;
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

.table-sm td, .table-sm th {
    padding: .3rem;
    padding-left: 10px;
}
th.text-center {
    height: 45px;
    padding-bottom: 10px;
}
table.auth-confirm a {
    color: black;
}
table.auth-confirm a:hover {
    color: #0056b3;
}
table.doc_table a {
	 color: black;
}
table.doc_table a:hover {
    color: #0056b3;
}
.table-sm td {
    height: 40px;
    padding-top: 7px;
}

/* 책임분양내역 */
.auth_img {
    -webkit-box-flex: 0;
    flex: 0 0 45.666667%;
    max-width: 45.666667%;
}
.card {
	border: 0;
}
.card-body {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.2rem;
    margin-top: -35px;
    margin-left: 30px;
    padding-bottom: 10px;
    width: 400px;
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
    border: 0;
}
.auth-btn {
    width: 71.45px;
    height: 29px;
    padding:1px;
}

/*책임분양 인증현황*/
.auth-confirm {
	border: 0;
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
.expiry {
    margin-bottom: 10px;
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
    background-color: #00BCD4;
    transition: width .6s ease;
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

.textbox input:focus {
	border-bottom: solid 2px #bdbdbd;
}

.textbox {
	display: flex;
	align-items: center;
	margin-bottom: 5px;
	margin-top: 25px;
}

.textbox input[type="button"] {
	display: inline-block;
	padding: .5em .75em;
	width: 57px;
	height: 41px;
	margin: 0px;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/*라벨디자인 첨부 */
.textbox label[for="fdoc_img"]{ 
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 50px;
    height: 38px;
    margin : 0;
    text-align: center;
    margin-left: 5px;
}
/*파일필드 숨기기*/
.textbox input[type="file"] { 
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.textbox[name="button_1"] label[for="biz_img"] {
	display: inline-block;
	padding: .5em .15em;
	width: 50px;
	height: 28px;
	color: #999;
	font-size: inherit;
	text-align: center;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* 파일 첨부 버튼 */
.textbox .upload-name {
	display: inline-block;
	padding: .5em .15em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	appearance: none;
}
.h3, h3 {
    font-size: 1.75rem;
    margin-bottom: 25px;
}

/* 페이징 버튼  */
td.paging > a {
	color : black;
	text-decoration: none;
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
				<h5>책임분양 관리</h5>
				<%if (myfree_doc_confirmVO.isEmpty()) { %>
			<br><br><br>
			<center>
			<h5>책임분양 받은 내역이 없습니다.</h5>
			</center>
			<br><br><br>
		
		<%
		}
		else {
			for (int i=0; i < myfree_doc_confirmVO.size(); i++) 
			{
				Myfree_doc_confirmVO confirm_list = (Myfree_doc_confirmVO)myfree_doc_confirmVO.get(i);
			%>
			
			<br><br>	
			<h5>나의 <%=nowpage %>번째 책임분양내역</h5>
			
			<table>
				<tr height="250px">
					<td width="850px">
						<div class="card mb-2 ml-2 mr-2 mt-2" style="max-width: 850px">
							<div class="row no-gutters">
								
								<%if (confirm_list.getConfirm_fdoc_img()==null||confirm_list.getConfirm_fdoc_img()=="") { %>
								<div class="auth_img">
									<center>
											<img src="resources/img/auth_basic_img.png"
												class="card-img mt-1 ml-1 mx-1 my-1" alt="..."
												style="width: 250px">
									</center>
								</div>
								<%}
								else { %>
								<div class="auth_img">
								<img src="/resource<%=confirm_list.getConfirm_fdoc_img() %>"
										class="card-img mt-1 ml-1 mx-1 my-1"/>
								</div>
								<%
								}
								%>
								
								
								<div class="col-md-5">
									<div class="card-body">
										<br>
										<br>
										<h4 class="card-title">품종&nbsp;&nbsp;  <%=confirm_list.getConfirm_fdoc_kindof() %></h4>
											<div class="row">
										<p class="card-text" style="font-size:16px;margin-left: 17px;">분양코드</p>
										<p class="card-text" style="font-size:16px;margin-left: 5px;"><%=confirm_list.getConfirm_fdoc_code() %></p>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;margin-left: 17px;">분양자</p>
										<p class="card-text" style="font-size:16px;margin-left: 20px;"><%=confirm_list.getConfirm_fdoc_s_email() %></p>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;margin-left: 17px;">책임비</p>
										<p class="card-text" style="font-size:16px;margin-left: 20px;"><%=confirm_list.getConfirm_fdoc_price() %></p>
											</div>
										
										<form id="fdoc_img_form fdoc_img_form<%=i %>" action="fileUpload.me#location" method="post" enctype="multipart/form-data">
											<input type="hidden" name="confirm_no" value=<%=confirm_list.getConfirm_no() %>>
											
											<div class="textbox preview-image" name="button_1">
											<input class="upload-name" name="biz_img" value="사진 선택" disabled="disabled">
											<label for="fdoc_img<%=i %>" style="display: inline-block;
																			    padding: .5em .75em;
																			    color: #999;
																			    font-size: inherit;
																			    line-height: normal;
																			    vertical-align: middle;
																			    background-color: #fdfdfd;
																			    cursor: pointer;
																			    border: 1px solid #ebebeb;
																			    border-bottom-color: #e2e2e2;
																			    border-radius: .25em;
																			    width: 50px;
																			    height: 38px;
																			    margin: 0;
																			    text-align: center;
																			    margin-left: 5px;">첨부</label>
											<input type="file" id="fdoc_img<%=i %>" name="file" multiple="multiple" accept="img/*" class="upload-hidden"/>
														<button type="submit" id="register_Btn register_Btn<%=i %>"
															class="btn btn-primary auth-btn btn-sm"
															style="width: 50px; height: 37px; margin-left: 5px;">
															등록</button>
													</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</td>
			</table>

			<br><br><br>
			<span id="write"></span>
			<h5><%=nowpage %>번째 책임분양 인증현황</h5>
			<table class="auth-confirm">
				<tr>
					<td width=832px>
						<table align="center">
							<tr height="100px">
								<td width="820px">
									<div class="row auth-date">
										<div class="s-date-label ">책임시작일</div>
										<div class="expiry-label">책임기간</div>
										<div class="e-date-label">책임만료일</div>
									</div>
									<div class="row auth-date">
										<div class="s-date"><%=confirm_list.getConfirm_s_date() %></div>
										<div class="expiry"><%=confirm_list.getConfirm_fdoc_expiry() %> 개월</div>
										<div class="e-date"><%=confirm_list.getConfirm_e_date() %></div>
									</div>
									<%
										double checknum = 0;
									
									for (int k=0; k < myfree_authVO.size(); k++) {
										Myfree_authVO auth_list = (Myfree_authVO)myfree_authVO.get(k);
										
										if (confirm_list.getConfirm_no().equals(auth_list.getFadoc_confirm_no()))
										{
											if (auth_list.getFadoc_check().equals("인증완료"))
											{
												++checknum;
											}
										}
									}
									%>
									<div class="progress ml-2 mr-2" style= "height: 25px;">
										<div class="progress-bar" role="progressbar"
											style="width: <%=(checknum / confirm_list.getConfirm_fdoc_expiry())*100%>%" 
											aria-valuenow="<%=(checknum / confirm_list.getConfirm_fdoc_expiry())*100%>" aria-valuemin="0"
											aria-valuemax="100"><%=(int)checknum%>/<%=confirm_list.getConfirm_fdoc_expiry()%></div>
									</div>
								</td>
							</tr>
						</table> <br>
						
						
									
						<div class="row account-auth">
							<%if (confirm_list.getConfirm_account()==null||confirm_list.getConfirm_account()=="") { %>
							
							<form action="./updateAccount.me" name="account_form" method="post" class="input-account">
							<input type="hidden" name="confirm_no" value="<%=confirm_list.getConfirm_no() %>">
							<label for="confirm_account">환급계좌번호&nbsp;</label>
							<input type="text" name="confirm_account" id="confirm_account">&nbsp;
							<a href="javascript:update_Account()"><input type="button" value="등록" id="update_Account" class="btn btn-primary btn-sm" 
							style="width:45px; height:28px; margin-bottom: 3px;"></a>
							</form>
							
							<%}
								else {%>
							<p class= mb-0 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환급계좌정보 : <%=confirm_list.getConfirm_account() %>
							<button type="button" class="btn btn-danger btn-sm" style="width:45px; height:28px;">
							<a href="deleteAccount.me?confirm_no=<%=confirm_list.getConfirm_no() %>" 
								style="color:white;">삭제</a></button>
							</p>
							
							<% } %>
							
							<%if (confirm_list.getConfirm_fdoc_expiry()>checknum) { %>
							<button type="button" class="btn btn-primary btn-sm" style="width:120px; height:28px; margin-right:20px; margin-bottom:2px" id="write_auth">
								<a href="write_auth_form.me?confirm_no=<%=confirm_list.getConfirm_no()%>" 
								style="color:white;">책임인증글 작성</a>
							</button>
							<%}
							else { %>
							<button type="button" class="btn btn-primary btn-sm" style="width:120px; height:28px; margin-right:20px; margin-bottom:2px; 
							pointer-events:none">
								책임인증 완료
							</button>
							<%} %>
						</div>
						<br>
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col" class="text-center">제목</th>
									<th scope="col" class="text-center">작성일</th>
									<th scope="col" class="text-center">상태</th>
									<th scope="col" class="text-center">&nbsp;</th>
								</tr>
							</thead>
							<%
								for (int j=0; j < myfree_authVO.size(); j++) {
									Myfree_authVO auth_list = (Myfree_authVO)myfree_authVO.get(j);
									
									if (confirm_list.getConfirm_no().equals(auth_list.getFadoc_confirm_no()))
									{
									
							%>
							<tbody>
								<tr>
									<td width="500px"><a href="free_auth_view.me?doc_no=<%=auth_list.getDoc_no() %>"
									onclick="window.open(this.href, '_blanck', 'height='+popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY); return false">
										&nbsp;&nbsp;<%=auth_list.getFadoc_subject() %></a></td>
									<td class="text-center"><%=auth_list.getFadoc_date() %></td>
									
									<%if (auth_list.getFadoc_check().equals("인증완료")) {	%>
									<td class="text-center"><%=auth_list.getFadoc_check() %></td>
									<td class="text-center"><a href="./fadocdetail.bo?doc_no=<%=auth_list.getDoc_no()%>">원문보기</a></td>
									<%} else { %>
									<td class="text-center"><%=auth_list.getFadoc_check() %></td>
									<td class="text-center">&nbsp;</td>
									<%} %>
								</tr>
							</tbody>
									<%
									} 
							}
									%>
						</table>
					</td>
				</tr>
			</table>
			<br><br>			<%
			}
		}
						%>
						<%if (myfree_doc_confirmVO.isEmpty()) {} else { %>
						
					<table>
						<tr align=center height="50px">
						<td colspan=5 class="paging">
							<%if(nowpage<=1){ %> <!-- 이전페이지가 존재하지 않을 때 --> [이전]&nbsp; <!-- 이전 버튼 비활성화 -->
							<%}else{ %> <!-- 이전페이지가 존재할 때 --> <a
							href="./myfree_auth.me?page=<%=nowpage-1 %>" >[이전]&nbsp;</a> <%} %>

							<%for(int a=startpage;a<=endpage;a++){
							if(a==nowpage){%> [<%=a %>] <%}else{ %> <!-- 현재 페이지가 nowpage가 아닐 때 -->
							<a href="./myfree_auth.me?page=<%=a %>">[<%=a %>]
						</a> <%} %> <%} %> <%if(nowpage>=maxpage){ %> &nbsp;[다음] <%}else{ %> <a
							href="./myfree_auth.me?page=<%=nowpage+1 %>">&nbsp;[다음]</a> <%} %>
						</td>
					</tr>
					</table>
				<%} %>
			<br>
			<h5>작성한 책임분양글</h5>

			<table class="doc_table">
				<tr>
					<td width="832px">
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col" class="text-center">글번호</th>
									<th scope="col" class="text-center">제목</th>
									<th scope="col" class="text-center">작성일</th>
									<th scope="col" class="text-center">분양코드</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (int l=0; l < myfree_docVO.size(); l++) {
									Myfree_docVO doc_list = (Myfree_docVO)myfree_docVO.get(l);
								
								%>
								<tr>
									<td width="84px" class="text-center" scope="row"><%=doc_list.getDoc_no() %></td>
									<td width="416px"><a href="./fdocdetail.bo?doc_no=<%=doc_list.getDoc_no()%>"><%=doc_list.getDoc_subject() %></a></td>
									<td width="188px" class="text-center"><%=doc_list.getDoc_date() %></td>
									<td width="143px" class="text-center"><%=doc_list.getDoc_code() %></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<br><br>
				<%if (myfree_docVO.isEmpty()) {} else { %>
						
					<table>
						<tr align=center height="50px">
						<td colspan=5 class="paging">
							<%if(nowpage_doc<=1){ %> <!-- 이전페이지가 존재하지 않을 때 --> [이전]&nbsp; <!-- 이전 버튼 비활성화 -->
							<%}else{ %> <!-- 이전페이지가 존재할 때 --> <a
							href="./myfree_auth.me?page_doc=<%=nowpage_doc-1 %>" >[이전]&nbsp;</a> <%} %>

							<%for(int a=startpage_doc;a<=endpage_doc;a++){
							if(a==nowpage_doc){%> [<%=a %>] <%}else{ %> <!-- 현재 페이지가 nowpage가 아닐 때 -->
							<a href="./myfree_auth.me?page_doc=<%=a %>">[<%=a %>]
						</a> <%} %> <%} %> <%if(nowpage_doc>=maxpage_doc){ %> &nbsp;[다음] <%}else{ %> <a
							href="./myfree_auth.me?page_doc=<%=nowpage_doc+1 %>">&nbsp;[다음]</a> <%} %>
						</td>
					</tr>
					</table>
				<%} %>
			
		
			
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
//환급계좌 입력
function update_Account() {
	document.forms["account_form"].submit();
}
</script>



</script>

<script>
//책임인증글 팝업
var popupWidth = 850;
var popupHeight = 900;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
var popupY= (window.screen.height / 2) - (popupHeight / 2);

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

<script>
//새로고침
function redirect() {
	location.reload();
} 
</script>

</body>
</html>