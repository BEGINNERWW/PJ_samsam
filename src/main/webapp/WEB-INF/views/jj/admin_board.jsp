<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.project.samsam.member.MemberVO"%>
<%@ page import="com.project.samsam.board.JJABoardVOto"%> 
<%@ page import="com.project.samsam.board.JJABoardVO"%>

<% 
String email = (String) session.getAttribute("email");

/*
if (session.getAttribute("email") == null){
	out.println("<script>");
	out.println("location.href='loginForm.me'");
	out.println("</script>");
s
*/
HashMap<Object, Object> map = (HashMap<Object, Object>)request.getAttribute("map");


//	클래스 변수이름 = (클래스)request.getAttribute("모델로 저장한 이름");
//	int b_no = 변수이름.getB_no();

	//email.toUpperCase();
	//<%= email.toUpperCase() 
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
<!-- 어드민페이지 -->
<link href="resources/css/admin_sidebar.css" rel="stylesheet">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>


<link href="resources/css/modal.css" rel="stylesheet" /> 
<script src="resources/js/admin_sidebar.js"></script>

<!-- 달력 -->
<link href="resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="resources/js/datepicker.js" charset="UTF-8"></script> <!-- Air datepicker js -->
<script type="text/javascript" src="resources/js/datepicker.ko.js" charset="UTF-8"></script> <!-- Air datepicker js -->
<!-- 스윗얼럿 -->
<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$("#startDate").datepicker({
});

$("#endDate").datepicker({
});
</script>
<script type="text/javascript">

function btn_disable()  {
	  const find_data = document.getElementById('find_data');
	  if($('.category').val() == '' || $('.category').val() == null ){
		  find_data.disabled = true;
		  console.log("카테고리"+ $('.category').val() )
	  }
	  else{
		  find_data.disabled = false;
	  }
}//btn_disable 끝 

	$(document).ready(function(){
		
		btn_disable();
			//검색 시작
			$("#find_data").click(function(event) {
				
				var startDate = $('#startDate').val();
				var endDate = $('#endDate').val();
				
				console.log(startDate);
				console.log(endDate);
				console.log($('.category').val());
				
				var params = $('#find_form').serialize(); //단순 확인용
				var kind_str = $('[name=kind]:checked').val();
			
				var data = {
					"startDate" : startDate,
					"endDate" : endDate,
					"keyword" : $('#keyword').val(),
					"category" : $('.category').val(),
					"kind" :  kind_str
							}
				
				console.log("params :"+params)
				console.log("kind_str : "+kind_str);
				console.log("date :" + data)
			
				if ( kind_str != "writing") {  //신고

					console.log("엘스")
					$.ajax({url : '/samsam/boardWFind.do', //게시글 신고
								type : 'POST',
								data : JSON.stringify(data),
								contentType : 'application/json;charset=utf-8',
								dataType : 'json',

								success : function(list) {
									console.log("신고")
									$('#output').empty();
									var b_count = 0
									$.each(list,function(index,item) {
										
										var category = $('.category').val();
										console.log("에이젝스 카테고리 : " +$('.category').val())
										var output = '';
										output += '<tr class ="wc_board">';
										output += '<td>'+ item.num+ '</td>';
										output += '<td>'+ item.subject+'</td>';
										output += '<td>'+ item.nick+ '</td>';
										output += '<td>'+ item.c_date+ '</td>';
										output += '<td>'+ item.readcount+ '</td>';
										output += '<td><button type="button" id="location_open_btn" number='+item.num+' category='+category+' onclick="location_change(this);"  value="상세보기">상세보기</button></td>';
										output += '</tr>';
										console.log("output:"+ output);
										$('#output').append(output);
										
										b_count += 1
									});
								
									$(".wc_board").slice(2).hide();

									console.log("글갯수 : " + b_count)
									var app = "<tr><td class='tb-bottom' colspan = 4><input type='button' class ='before-btn' value = '이전'></td>" + "<td class='pagenum'></td><td class='tb-bottom'><input type='button' class = 'after-btn' value = '다음'></td></tr>"
									$("#output").append(app);
									var page = 0
									var b = 0;
									for(var i = 1; i <= b_count ; i++){
										console.log("반복문")
										b += i;
										if(b%2 == 0){
											page += 1	
											console.log("page수 :" + page)
											$('.pagenum').html($('.pagenum').html()+'<a href="javascript:void(0);" onclick="page_detail(this);" value = "'+ page +'">'+ page + '</a>')
										}else if(b <= 2){
											page += 1	
											console.log("page값 :" + $('.pagenum').val())

											$('.pagenum').html($('.pagenum').html()+'<a href="javascript:void(0);" onclick="page_detail(this);" value = "'+ page +'">'+ page + '</a>')
										}
									}
									sessionStorage.setItem("pagenum", 1);
									console.log("세션"+ sessionStorage.getItem("pagenum"))
								},
								error : function(request, error) {

									alert("fail");

									// error 발생 이유를 알려준다.

								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

								}

							});
					event.preventDefault();
				} else {  //게시글
					
					$.ajax({
						url : '/samsam/boardFind.do',
						type : 'POST',
						data : JSON.stringify(data),
						contentType : 'application/json;charset=utf-8',
						dataType : 'json',

						success : function(list) {
							console.log("게시글")
							$('#output').empty();
						$.each(list,function(index, item){
							var category = $('.category').val();
						
								var output = '';
								output += '<tr>';
								output += '<td>'+ item.num+ '</td>';
								output += '<a href="#"><td>'+ item.subject+'</td></a>';
								output += '<td>'+ item.nick+ '</td>';
								output += '<td>'+ item.c_date+ '</td>';
								output += '<td>'+ item.readcount+ '</td>';
								output += '<td><button type="button" id="location_open_btn" number='+item.num+' category='+category+' onclick="location_change(this);"  value="상세보기">상세보기</button></td>';
								output += '</tr>';
								console.log("output:"+ output);
								$('#output').append(output);
								
								$("#output").slice(10).hide();
						});  //		each
					}, //성공
						error : function(error) {
							alert("통신실패"+ error);
						}
					}); //  if 에이젝스
			event.preventDefault();

				}//else
				
				
			}); //find_data
	})	//ready
	
function page_detail(obj){
	console.log("page"+sessionStorage.getItem("pagenum"));

	$(".wc_board").hide();
	var page = $(obj).attr('value');
	console.log(page)
	var start = (page-1)*2;
	var end = page*2;
	$(".wc_board").slice(start, end).show();
	sessionStorage.setItem("pagenum", page);
	console.log("page"+sessionStorage.getItem("pagenum"));
}//page event


	$(document).on("click", ".before-btn",function(event) {
		$(".wc_board").hide();

		page = sessionStorage.getItem("pagenum")
		console.log("page"+sessionStorage.getItem("pagenum"));

		if(page <= 1){
			swal("","첫 페이지 입니다.","info")
		}
		var start = (page-2)*2;
		var end = (page-1)*2;

		$(".wc_board").slice(start, end).show();
		sessionStorage.setItem("pagenum", Number(page)-1)
	});

	$(document).on("click", ".after-btn",function(event) {
		$(".wc_board").hide();
		console.log($(".wc_board").length)

		if($(".wc_board").length <= (Number(page)+1)*2){
			swal("","마지막 페이지 입니다.","info")
		}
		page = sessionStorage.getItem("pagenum")

		console.log("page"+sessionStorage.getItem("pagenum"));
		var start = page*2;
		var end = start+2;
		
		$(".wc_board").slice(start, end).show();
		sessionStorage.setItem("pagenum",Number(page)+1)

	});

//
	function checkOnlyOne(element) {
		  
		  const checkboxes = document.getElementsByName("kind");
		  console.log("체크박스 " + checkboxes)
		  checkboxes.forEach(function(cb) {
		    cb.checked = false;
		  })
		  element.checked = true;
	}
	//분류 체크박스 선택값 radio 함수
	
	function location_change(obj){
		var number = $(obj).attr('number');
		var category = $(obj).attr('category');
		console.log("함수 : " +$(obj).attr('category'))
		console.log("ㅇㅇㅇ"+number);	
		location.href="/samsam/ad_boardDetail.do?number="+ number +"&category="+ category;
	}

</script>	
<style>
<style>
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
    margin-left: 50px;
}

.btn {
    border-style: solid;
    border-width: 0 1px 4px 1px;
    text-transform: uppercase;
}
.btn:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.btn:not(.disabled):hover {
    margin-top: 1px;
    border-bottom-width: 3px;
}
/* 인증 버튼 */
.btn-primary {
    border-color: #127ba3;
}
.btn-primary {
    color: #fff;
    background-color: #158cba;
}
.btn-primary:hover {
    color: #fff;
    background-color: #117298;
    border-color: #106a8c;
}
/* 반려, 인증취소 버튼 */
.btn-danger {
    border-color: #ff291d;
}
.btn-danger {
    color: #fff;
    background-color: #ff4136;
}
.btn-danger:hover {
    color: #fff;
    background-color: #ff1d10;
    border-color: #ff1103;
}
/* 재검토 버튼 */
.btn-warning {
    border-color: #ff7702;
}
.btn-warning {
    color: #fff;
    background-color: #ff851b;
}
.btn-warning:hover {
    color: #fff;
    background-color: #f47100;
    border-color: #e76b00;
}


</style>

</style>
</head>
<body>
<div class ="body_content">

<header id = "header">
	<div class="d-flex flex-column">
		<div class ="profile">
			<h1 class ="text-light">
				<a href ="#" class = "onMember">  </a>
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

<div class = "main_content"> <!-- 메인컨텐트 -->
	<div class="container">
		<div class="search_bar">
			<form method="post" id="find_form">
				<div class="search_area1">
					<div class="search_item1">
						<label for="date">기간 :</label>
						&nbsp;&nbsp; 
						<input id="startDate" type="text"autocomplete="off">&nbsp; - &nbsp; <input id="endDate" type="text"autocomplete="off">
					</div>
					<div class="search_item2">
						<div class="search_item2 1">
							
							분류 <input type='radio' name='kind' class='kind' value='writing' checked />게시글     
								<input type='radio' name='kind'class='kind' value='warning' /> 신고
							 
						</div>
					</div>
							
                           </div>
					<div class="search_item2 2"> 
						카테고리 : <select class="category" onchange="btn_disable();">
										<option value="">선택하세요</option>
										<option value="adopt_list">분양게시판</option>
										<option value="community" checked>커뮤니티</option>
								</select>
					</div>
			
					<div class="search_item3">
						검색어 : <input type="text" id="keyword" name="keyword" value="">
					</div>
					
					<div class="search_are2">
						<input type="button" id="find_data" value="조회">
					</div>
			</form>
		</div>
		
		
			<div class="search_lists">
				<table class="table table-lg">
					 <thead>
		               <tr>
		                  <th scope="col" class="text-center" width="10%">#</th>
		                  <th scope="col" class="text-center" width="45%">제목</th>
		                  <th scope="col" class="text-center" width="15%">닉네임</th>
		                  <th scope="col" class="text-center" width="15%">작성일</th>
		                  <th scope="col" class="text-center" width="15%">조회수</th>
		               </tr>
		            </thead>
		            <tbody id="output">
		            
		            </tbody>
					
				</table>
			</div>
	</div><!--container  -->

</div><!-- 메인컨텐트 끝 -->

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
        <h3>To Do List</h3>
      </div>
	<!-- done list -->      
      <div class="done">
        <h3>Done</h3>
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
</body>
</html>