<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.samsam.myfree.*" %>

<%

	//String email = (String) session.getAttribute("email");
	//email.toUpperCase();
	List<Myfree_authVO> authlist = (List<Myfree_authVO>)request.getAttribute("authlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();

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

body::-webkit-scrollbar { 

    display: none; 

}

body {
	overflow:auto;
}

ul {
    list-style-type: none;
}
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 1rem;
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
    padding-top: 5px;
    padding-bottom: 5px;
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
h1 > a:hover {
    color: #A8A9B4;
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
.tb-bottom{
   display : flex;
   justify-content: center;
}
.pagenum{
   display : flex;
}
.pageA{
   margin-top: 10px;
    padding-top: 2px;
    padding-right: 10px;
    padding-left: 10px;
    color: black;
    display: flex;
}
.now{
   width : 30px;
   height : 30px;
   background-color : #eeeeee;
    border-radius : 5px;
   color:black;
   text-align: center;
    padding-top: 2px;
    margin-top: 10px;
}

/* 이전 / 다음 버튼 */
.before-btn, .after-btn{
   margin: 10px;
    width:60px;
    height : 30px;
    background-color: #eeeeee;
    color : black;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    border-radius : 5px; 
    border-color: #eeeeee;
    border-width: 0px;
}

</style>
</head>
<body>
<div class ="body_content">

<header id = "header">
	<div class="d-flex flex-column">
		<div class ="profile">
			<img src = "resources/img/samsam2.png" class = "img-circle">
			<h1 class ="text-light" style="margin-top: 14px;margin-bottom: 19px;">
				<a href ="#" class = "onMember"> ADMIN  </a>
			</h1>
		</div>
		<div class ="admin_inout">
			<button type="button" class ="grade" onclick="location.href='home.me'" style="font:400 13.3333px Arial;padding-top: 4px;">HOME</button>
			<button type="button" class ="grade" onclick="location.href='logout.me'" style="font:400 13.3333px Arial;padding-top: 4px;">LOGOUT</button>
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

			
			<h3>책임분양 인증글 > </h3>
			<br>
			<table class="table table-lg">
				<thead>
					<tr>
						<th scope="col" class="text-center" width="221px">확정번호</th>
						<th scope="col" class="text-center" width="293px">제목</th>
						<th scope="col" class="text-center" width="182px">피분양자</th>
						<th scope="col" class="text-center" width="134px">작성일</th>
						<th scope="col" class="text-center" width="142px">상태</th>
						<th scope="col" class="text-center" width="88px">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<%
					int num = listcount - ((nowpage - 1) * 10);
					for(int i=0; i<authlist.size(); i++) {
						Myfree_authVO auth_list = (Myfree_authVO)authlist.get(i);
				%>
					<tr>
						<td class="text-center"><a
							href="free_auth_datail.me?doc_no=<%=auth_list.getDoc_no() %>">
								<%=auth_list.getFadoc_confirm_no() %></a></td>
						<td><a
							href="free_auth_view.me?doc_no=<%=auth_list.getDoc_no() %>"
							onclick="window.open(this.href, '_blanck', 'height='+popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY); return false">
								&nbsp;&nbsp;&nbsp;<%=auth_list.getFadoc_subject() %></a></td>
						<td class="text-center"><%=auth_list.getFadoc_r_email() %></td>
						<td class="text-center"><%=auth_list.getFadoc_date() %></td>


						<%if (auth_list.getFadoc_check().equals("인증완료")) { %>
						<td class="text-center"><%=auth_list.getFadoc_check() %>
							<button type="button" class="btn btn-danger btn-sm"
								id="free_auth_re">
								<a href="free_auth_re.me?doc_no=<%=auth_list.getDoc_no()%>">인증취소</a>
							</button></td>
						<%
							}
						else if(auth_list.getFadoc_check().equals("인증실패")) {
						%>
						<td class="text-center"><%=auth_list.getFadoc_check() %>
							<button type="button" class="btn btn-warning btn-sm"
								id="free_auth_re">
								<a href="free_auth_re.me?doc_no=<%=auth_list.getDoc_no()%>">재검토</a>
							</button></td>
						<%
						}
						else {
						%>
						<td class="text-center">
							<button type="button" class="btn btn-primary btn-sm"
								id="free_auth_ok">
								<a href="free_auth_ok.me?doc_no=<%=auth_list.getDoc_no()%>">인증</a>
							</button>
							<button type="button" class="btn btn-danger btn-sm"
								id="free_auth_no">
								<a href="free_auth_no.me?doc_no=<%=auth_list.getDoc_no()%>">반려</a>
							</button>
						</td>
						<%
						}
						
						if (auth_list.getFadoc_check().equals("인증완료")) {	%>
						<td class="text-center" style="border-bottom:1px solid #dee2e6;">
							<a href="./fadocdetail.bo?doc_no=<%=auth_list.getDoc_no()%>" target="_blank">원문보기</a></td>
						<%} else { %>
						<td class="text-center" style="border-bottom:1px solid #dee2e6;">&nbsp;</td>
					</tr>
					<% 
					}
				}
					%>
				</tbody>
			</table>
							<div class="tb-bottom">
							<%if(nowpage<=1){ %> <!-- 이전페이지가 존재하지 않을 때 --> <input type="button" class="before-btn" value="이전">&nbsp;&nbsp; <!-- 이전 버튼 비활성화 -->
							<%}else{ %> <!-- 이전페이지가 존재할 때 --> 
							<input type="button" class="before-btn" value="이전" onclick="location.href='./adminfree_auth.me?page=<%=nowpage-1 %>'">&nbsp;&nbsp; <%} %>

							<span class="pagenum">
							<%for(int a=startpage;a<=endpage;a++){
							if(a==nowpage){%> <font class="now"><%=a %></font>&nbsp;&nbsp; <%}else{ %> <!-- 현재 페이지가 nowpage가 아닐 때 -->
							<a href="./adminfree_auth.me?page=<%=a %>" class="pageA"><%=a %>&nbsp;&nbsp;</a>
							</span>
							
							
						 <%} %> <%} %> <%if(nowpage>=maxpage){ %> 
						<input type="button" class="after-btn" value="다음"> 
						<%}else{ %> 
						<input type="button" class="after-btn" value="다음" onclick="location.href='./adminfree_auth.me?page=<%=nowpage+1 %>'"> <%} %>
							</div>




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