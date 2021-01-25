<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.samsam.myfree.*" %>

<%
	String email = (String) session.getAttribute("email");
	//email.toUpperCase();
	Myfree_doc_confirmVO myfree_doc_confirm_detail = (Myfree_doc_confirmVO)request.getAttribute("myfree_doc_confirm_detail");
	List<Myfree_authVO> myfree_auth_detail = (List<Myfree_authVO>)request.getAttribute("myfree_auth_detail");
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


<!-- 어드민페이지 css -->
<link href="resources/css/admin_sidebar.css" rel="stylesheet">


<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script src="resources/js/adminPage.js"></script>



</head>


<style>
body {
	overflow: scroll;
}
header, #header {
	height: 210vh;
}
ul {
    list-style-type: none;
}
h1 {
    text-align: center;
}
*, ::after, ::before {
    box-sizing: border-box;
}
h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

table {
    border-collapse: separate;
    margin: 0 auto;
}
.table{
    margin-bottom: 0rem;
}

.table-sm td, .table-sm th {
    padding: .3rem;
    padding-left: 10px;
}
.table {
    width: 100%;
    max-width: 100%;
    background-color: transparent;
    border-collapse: collapse;
    display: table;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
}
.text-center {
    text-align: center!important;
}
.table td, .table th {
    padding: .75rem;
    border-top: 1px solid #dee2e6;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
a {
    display: contents;
    text-decoration: none;
    color: black;
}

.btn > a {
    display: contents;
    text-decoration: none;
    color: white;
}
a:hover {
    color: #0056b3;
    text-decoration: none;
}
.btn > a:hover {
    color: white;
    text-decoration: none;
}
.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    user-select: none;
    border: 1px solid transparent;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.btn-group-sm>.btn, .btn-sm {
    padding: .25rem .5rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .2rem;
}
button, select {
    text-transform: none;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
}
.content {
    margin-top: 40px;
    margin-left: 115px;
    width: 90%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
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
/* 재검토 버튼 */
.btn-warning {
    border-color: #ff851a;
}
.btn-warning {
    color: #fff;
    background-color: #ff851a;
}
.btn-warning:hover {
    color: #fff;
    background-color: #e66b00;
    border-color: #e66b00;
}

/*책임분양 현황*/
.auth_img {
    -webkit-box-flex: 0;
    flex: 0 0 45.666667%;
    max-width: 45.666667%;
}
.ml-2, .mx-2 {
    margin-left: .5rem!important;
}
.mb-2, .my-2 {
    margin-bottom: .5rem!important;
}
.mr-2, .mx-2 {
    margin-right: .5rem!important;
}
.mt-2, .my-2 {
    margin-top: .5rem!important;
}
.card {
    position: relative;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    flex-direction: column;
    min-width: 0;
    background-color: #fff;
    background-clip: border-box;
    border-radius: .25rem;
}
.no-gutters>.col, .no-gutters>[class*=col-] {
    padding-right: 0;
    padding-left: 0px;
    margin-left: 70px;
    margin-top: 30px;
}
.no-gutters {
    margin-right: 0;
    margin-left: 0;
    border: 0;
}
.row {
    display: flex;
    flex-wrap: wrap;
    margin-top: -10px;
}
.row.auth-date {
    justify-content: space-between;
    margin-top: 0px;
}
.auth_img {
    -webkit-box-flex: 0;
    flex: 0 0 45.666667%;
    max-width: 45.666667%;
}
.card-img {
    width: 380px;
    height: 253px;
    border-radius: calc(0.75rem - 1px);
}
.ml-1, .mx-1 {
    margin-left: .25rem!important;
}
.mb-1, .my-1 {
    margin-bottom: .25rem!important;
}
.mr-1, .mx-1 {
    margin-right: .25rem!important;
}
.mt-1, .my-1 {
    margin-top: .25rem!important;
}
.no-gutters>.col, .no-gutters>[class*=col-] {
    padding-right: 0;
    padding-left: 0;
}
@media (min-width: 768px)
.col-md-4 {
    -webkit-box-flex: 0;
    flex: 0 0 33.333333%;
    max-width: 33.333333%;
}
.card-body {
    -webkit-box-flex: 1;
    flex: 1 1 auto;
    padding: 1.2rem;
    margin-top: -115px;
}
.card-title {
    margin-bottom: .75rem;
}
p.card-text {
    text-align: left;
    margin-bottom: 5px;
}
.h5, h5 {
    font-size: 1.25rem;
}


/*책임분양 인증현황*/

.auth-confirm {
	border: 0;
}

*, ::after, ::before {
    box-sizing: border-box;
}

.row.auth-date {
    justify-content: space-between;
}

.progress {
    display: -ms-flexbox;
    display: flex;
    height: 1rem;
    overflow: hidden;
    line-height: 0;
    font-size: 0.9rem;
    background-color: #f0f0f0;
    border-radius: 0.25rem;
    margin-top: 10px;
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
    border-radius: 0.25rem;
}

</style>
</head>
<body>
	<div class ="body_content">

<header id = "header">
	<div class="d-flex flex-column">
		<div class ="profile">
			<img src = "resources/img/samsam2.png" class = "img-circle">
			<h1 class = "text-light">
				<a href = "#" class = "onMember">  <%= email.toUpperCase()%> </a>
			</h1>
		</div>
		<div class ="admin_inout">
			<button type="button" class ="grade">ADMIN</button>
			<button type="button" class ="grade" onclick="location.href='logout.me'">LOGOUT</button>
		</div>
						
		<ul>
			<li>
				<a href = "adminboard.do" class = "nav-menu"><i class= "far fa-clipboard menu"></i><span class="a-menu"> 게시물관리</span></a>
			</li>
			<li>
				<a href="admin_main.me" class = "nav-menu"><i class = "fas fa-users menu"></i><span class="a-menu"> 회원관리</span></a>
			</li>
			<li>
				<a href="admin_pay.me" class = "nav-menu"><i class = "fas fa-ticket-alt menu"></i><span class="a-menu"> 이용권관리</span></a>
			</li>
			<li>
				<a href="adminfree_auth.me" class = "nav-menu"><i class = "fas fa-dog menu"></i><span class="a-menu"> 책임분양</span></a>
			</li>
		</ul>
</div>
</header>

<div class = "main_content">
<!-- 메인컨텐트 -->
<div class = "content">
	
		<h3>책임분양 현황</h3>
			<table>
				<tr height="300px">
					<td width="770px">
						<div class="card mb-2 ml-2 mr-2 mt-2" style="max-width: 850px">
							<div class="row no-gutters">
								
								<%if (myfree_doc_confirm_detail.getConfirm_fdoc_img()==null||myfree_doc_confirm_detail.getConfirm_fdoc_img()=="") { %>
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
								<img src="/resource<%=myfree_doc_confirm_detail.getConfirm_fdoc_img() %>"
										class="card-img mt-1 ml-1 mx-1 my-1"/>
								</div>
								<%
								}
								%>
								
								
								<div class="col-md-4">
									<div class="card-body">
										<br>
										<br>
											<div class="row">
										<h4 class="card-title" style="font-size: 24px">품종</h4>
										<h4 class="card-title" style="font-size: 24px;margin-left: 55px;"><%=myfree_doc_confirm_detail.getConfirm_fdoc_kindof() %></h4>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;">분양코드</p>
										<p class="card-text" style="font-size:16px;margin-left: 43px;"><%=myfree_doc_confirm_detail.getConfirm_fdoc_code() %></p>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;">확정코드</p>
										<p class="card-text" style="font-size:16px;margin-left: 43px;"><%=myfree_doc_confirm_detail.getConfirm_no() %></p>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;">피분양자</p>
										<p class="card-text" style="font-size:16px;margin-left: 44px;"><%=myfree_doc_confirm_detail.getConfirm_fdoc_r_email() %></p>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;">분양자</p>
										<p class="card-text" style="font-size:16px;margin-left: 59px;"><%=myfree_doc_confirm_detail.getConfirm_fdoc_s_email() %></p>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;">책임비</p>
										<p class="card-text" style="font-size:16px;margin-left: 59px;"><%=myfree_doc_confirm_detail.getConfirm_fdoc_price() %></p>
											</div>
											<div class="row">
										<p class="card-text" style="font-size:16px;">환급 계좌번호</p>
										<%if (myfree_doc_confirm_detail.getConfirm_account()==null||myfree_doc_confirm_detail.getConfirm_account()=="") { %>
										<p class="card-text" style="font-size:16px;margin-left: 10px;">미입력</p>
										<%} else { %>
										<p class="card-text" style="font-size:16px;margin-left: 10px;"><%=myfree_doc_confirm_detail.getConfirm_account() %></p>
											<%} %>
											</div>
									</div>
								</div>
							</div>
						</div>
					</td>
			</table>
			<br>
			
			<span id="location"></span>
			<h3>책임분양 인증현황</h3>
						<table  align="center">
							<tr height="100px">
								<td width="870px">
										<div class="row auth-date">
										<div class="s-date-label ">책임시작일</div>
										<div class="expiry-label">책임기간</div>
										<div class="e-date-label">책임만료일</div>
									</div>
									<div class="row auth-date">
										<div class="s-date"><%=myfree_doc_confirm_detail.getConfirm_s_date() %></div>
										<div class="expiry"><%=myfree_doc_confirm_detail.getConfirm_fdoc_expiry() %> 개월</div>
										<div class="e-date"><%=myfree_doc_confirm_detail.getConfirm_e_date() %></div>
									</div>
									<%
										double checknum = 0;
									
									for (int i=0; i < myfree_auth_detail.size(); i++) {
										Myfree_authVO auth_detail = (Myfree_authVO)myfree_auth_detail.get(i);
										
										if ( myfree_doc_confirm_detail.getConfirm_no().equals(auth_detail.getFadoc_confirm_no()))
										{
											if (auth_detail.getFadoc_check().equals("인증완료"))
											{
												++checknum;
											}
										}
									}
									%>
									<div class="progress ml-2 mr-2" style= "height: 25px;">
										<div class="progress-bar" role="progressbar"
											style="width: <%=(checknum / myfree_doc_confirm_detail.getConfirm_fdoc_expiry())*100%>%" 
											aria-valuenow="<%=(checknum / myfree_doc_confirm_detail.getConfirm_fdoc_expiry())*100%>" aria-valuemin="0"
											aria-valuemax="100"><%=(int)checknum%>/<%=myfree_doc_confirm_detail.getConfirm_fdoc_expiry()%></div>
									</div>
									<br>
								</td>
							</tr>
						</table>
						<br>
				
					<h3>책임분양 인증글 신청현황</h3>


					<table>
						<tr>
							<table class="table table-sm">
								<thead>
									<tr>
										<th scope="col" class="text-center" width=500>제목</th>
										<th scope="col" class="text-center" width=150>작성일</th>
										<th scope="col" class="text-center" width=200>상태</th>
									</tr>
								</thead>
								<tbody>
								<%
									for (int j=0; j < myfree_auth_detail.size(); j++) {
										Myfree_authVO auth_list  = (Myfree_authVO)myfree_auth_detail.get(j);
									if (auth_list.getFadoc_check().equals("검토중")) {
								%>
									<tr>
										<td><a href="free_auth_view.me?doc_no=<%=auth_list.getDoc_no() %>"
											onclick="window.open(this.href, '_blanck', 'height='+popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY); return false">
											&nbsp;&nbsp;&nbsp;<%=auth_list.getFadoc_subject() %></a></td>
										<td class="text-center"><%=auth_list.getFadoc_date() %></td>
										<td class="text-center">
										<button type="button" class="btn btn-primary btn-sm" id="free_auth_ok">
											<a href="free_auth_detail_ok.me?doc_no=<%=auth_list.getDoc_no()%>#location">인증</a></button>
										<button type="button" class="btn btn-danger btn-sm" id="free_auth_no">
											<a href="free_auth_detail_no.me?doc_no=<%=auth_list.getDoc_no()%>#location">반려</a></button>
										</td>
									</tr>
								<%
									}
									else if (auth_list.getFadoc_check().equals("인증실패")) {
								%>
									<tr>
										<td><a href="free_auth_view.me?doc_no=<%=auth_list.getDoc_no() %>"
											onclick="window.open(this.href, '_blanck', 'height='+popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY); return false">
											&nbsp;&nbsp;&nbsp;<%=auth_list.getFadoc_subject() %></a></td>
										<td class="text-center"><%=auth_list.getFadoc_date() %></td>
										<td class="text-center"><%=auth_list.getFadoc_check() %>
											<button type="button" class="btn btn-warning btn-sm" id="free_auth_re">
										<a href="free_auth_detail_re.me?doc_no=<%=auth_list.getDoc_no()%>#location">재검토</a></button>
										</td>
									</tr>
								<%
									}
								}
								
								%>	
									
								</tbody>
							</table>
							</td>
					</table> 
					
					<br>
				<br>
					<h3>인증완료 내역</h3>
					<table class="table table-sm">
						<thead>
							<tr>
								<th scope="col" class="text-center" width=500>제목</th>
								<th scope="col" class="text-center" width=150>작성일</th>
								<th scope="col" class="text-center" width=200>상태</th>
							</tr>
						</thead>
						<tbody>
							<%
							for(int k=0; k < myfree_auth_detail.size(); k++)	{
								Myfree_authVO free_auth_list = (Myfree_authVO)myfree_auth_detail.get(k);
								
								if (free_auth_list.getFadoc_check().equals("인증완료")) {
							%>
								<tr>
									<td><a href="free_auth_view.me?doc_no=<%=free_auth_list.getDoc_no() %>"
										onclick="window.open(this.href, '_blanck', 'height='+popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY); return false">
										&nbsp;&nbsp;&nbsp;<%=free_auth_list.getFadoc_subject() %></a></td>
									<td class="text-center"><%=free_auth_list.getFadoc_date() %></td>
									<td class="text-center"><%=free_auth_list.getFadoc_check() %>
									<button type="button" class="btn btn-danger btn-sm" id="free_auth_re">
										<a href="free_auth_detail_re.me?doc_no=<%=free_auth_list.getDoc_no()%>#location">인증취소</a></button>
									</td>
								</tr>
							<%
							}
								}
							%>
						</tbody>
					</table>



</div>			
</div><!-- 메인컨텐트 -->

<!-- right-sidebar -->
<div class="right-container">
<!-- 달력 --> 
<widget class="no-drag">
  <table id="calendar">
    <thead>
      <tr height="35px">
        <td><label onclick="prev()" style="color: #ccc;"><</label></td>
        <td colspan="5" id="monthTable"></td>
        <td><label onclick="next()" style="color: #ccc;">></label></td>
      </tr>
      <tr id="dateHead">
        <td>S</td>
        <td>M</td>
        <td>T</td>
        <td>W</td>
        <td>T</td>
        <td>F</td>
        <td>S</td>
      </tr>
    </thead>
    <tbody></tbody>
  </table>
  <script>
    makeArray();
  </script>
</widget>
<!-- 투두리스트 -->
	<!-- 입력 -->
	<div class = "todolist">
      <input type="text" placeholder="Add A Task" class ="txt"> 
    <!-- to do list -->
     <div class="notdone">
        <h3 style="margin-left: 15px;">To Do List</h3>
      </div>
	<!-- done list -->      
      <div class="done">
        <h3 style="margin-left: 15px;">Done</h3>
      </div>
     </div>

<!-- pageup button -->
<div class ="back-to-top">
<a href="#" class ="back-to-top" style="display: inline;">
	<i class = "fas fa-angle-up"></i>
</a>
</div>
</div><!-- right-sidebar -->
</div><!-- 바디컨텐트 -->



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
</body>
</html>