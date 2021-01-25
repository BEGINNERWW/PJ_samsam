<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.project.samsam.member.MemberVO"%>
<%@ page import="com.project.samsam.board.JJABoardVOto"%>
<%@ page import="com.project.samsam.board.JJABoardVO"%>
<%@ page import="com.project.samsam.board.JJWarningVO"%>
<%@ page import="com.project.samsam.board.JJCommentVO"%>

<% String email=(String) session.getAttribute("email"); 
/* 
  if (session.getAttribute("email")==null){
                    out.println("<script>");
                    out.println("location.href='loginForm.me'");
                    out.println("</script>");
                    
                    */
	  //board detail 페이지에 뿌려줄 객체들 (상세보기 등 버튼 클릭 후 )
      MemberVO vo = (MemberVO)request.getAttribute("vo");
      JJABoardVOto bvo = (JJABoardVOto)request.getAttribute("bvo");

      ArrayList<JJWarningVO> w_docList = (ArrayList<JJWarningVO>)request.getAttribute("w_docList");
      ArrayList<JJWarningVO> w_coList = (ArrayList<JJWarningVO>)request.getAttribute("w_coList");
      JJWarningVO wcount = (JJWarningVO)request.getAttribute("w_count");

      ArrayList<JJCommentVO> cList = (ArrayList<JJCommentVO>)request.getAttribute("cList");
      JJCommentVO c_count = (JJCommentVO)request.getAttribute("ccount");
	//어드민 게시글 뷰
	
	//어드민 게시글 뷰 모달

          // 클래스 변수이름 = (클래스)request.getAttribute("모델로 저장한 이름");
          // int b_no = 변수이름.getB_no();

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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap"
	rel="stylesheet">
<!-- 어드민페이지 -->
<link href="resources/css/admin_sidebar_jj.css" rel="stylesheet">
<link href="resources/css/ad_boardDetail3.css" rel="stylesheet" />
<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<!-- 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>

<!-- 모달 플러그인 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<!-- 달력 -->
<link href="resources/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
<script type="text/javascript" src="resources/js/datepicker.js"
	charset="UTF-8"></script>
<!-- Air datepicker js -->
<script type="text/javascript" src="resources/js/datepicker.ko.js"
	charset="UTF-8"></script>
<!-- Air datepicker js -->

<script >

	//
function war_detail(obj){
	var setData= {
			"number" : $(obj).attr('ww_no'),
	}
	
	console.log(setData.number)
	//모달
	$.ajax({
		url : '/samsam/ad_wm_detail.do',
		type : 'POST',
		data: JSON.stringify(setData),
		
		dataType: 'json',
		contentType : 'application/json;charset=utf-8',
		success : function(map){
			console.log(map);
			$('input').val("");
			//신고자
			$('#ww_no').val(map.wvo.w_no);
			$('#ww_email').val(map.wvo.w_email);
			$('#ww_date').val(map.wvo.w_date);
			$('#ww_reason').val(map.wvo.w_reason);  
			$('#ww_status').val(map.wvo.w_status);  
			
			
			//코멘트 작성자
			if(map.covo != null){
			$('#cc_comment').val(map.covo.doc_content);
			$('#cc_nick').val(map.covo.doc_nick);
			$('#cc_date').val(map.covo.doc_date);
			}else{
				$('.w_co_cont').hide();
			}
			
			},//success
		error:function(){
			console.log("ajax 통신 실패");
		}
	})	//ajax
	
	//기본 이벤트 제거
	event.preventDefault();		
}//war_detail
</script>
	
<script>
	
	//모달에서 신고 처리
	//w_status : 디폴트 1 = 대기
	//				   2 = 유지
	//				   3 = 숨김
$(document).on("click",'.auth_hide',function(event){
	var data ={
			w_no: $('#ww_no').val(),
			w_note: $('#ww_note').val(),
			w_status : $('.auth_hide').val()
	}
	console.log(data);
	alert("AAAAAAA");
	$.ajax({
		url : '/samsam/w_authOrder.do',
		type: 'POST',
		data : JSON.stringify(data),
		dataType : 'json',
		contentType : 'application/json;charset=utf-8',
		
		success : function(result) {
			alert("CCCCC");
		if(result.res == 1){
			$('#ww_status').val("숨김")
		}
		else{
			$('#ww_status').val("업데이트실패");	
		}
		
		}, //success
		error : function() {
			alert("ajax 통신 실패!!!");
		}
	});
	event.preventDefault();
})
	
$(document).on("click",'.auth_keep',function(event){
	var data ={
			w_no: $('#ww_no').val(),
			w_note: $('#ww_note').val(),
			w_status : $('.auth_keep').val()
	}
	$.ajax({
		url : '/samsam/w_authOrder.do',
		type: 'POST',
		data : JSON.stringfy(data),
		dataType : 'json',
		contentType : 'application/json;charset=utf-8',
		
		success : function(result) {
		if(result.res ==1){
			$('#ww_status').val("유지")
		}
		else{
			$('#ww_status').val("업데이트실패");	
		}
		}, //success
		error : function() {
			alert("ajax 통신 실패!!!");
	}
	});
	event.preventDefault();
	
})


</script>

</head>

<body>
	<div class="body_content">

		<header id="header">
			<div class="d-flex flex-column">
				<div class="profile">
				<img src = "resources/img/samsam2.png" alt class = "img-circle">
					<h1 class="text-light">
						<a href="#" class="onMember"> </a>
					</h1>
				</div>
				<div class="admin_inout">
					<button type="button" class="grade">ADMIN</button>
					<button type="button" class="grade"
						onclick="location.href='logout.me'">LOGOUT</button>
				</div>

				<ul>
					<li><a href="adminboard.do" class="nav-menu">
					<i class="far fa-clipboard menu"></i><span class="a-menu">
								게시물관리</span></a></li>
					<li><a href="admin_main.me" class="nav-menu">
					<i class="fas fa-users menu"></i><span class="a-menu"> 회원관리</span></a></li>
					<li><a href="admin_pay.me" class="nav-menu">
					<i class="fas fa-ticket-alt menu"></i><span class="a-menu"> 이용권관리</span></a></li>
					<li><a href="adminfree_auth.me" class="nav-menu">
					<i class="fas fa-dog menu"></i><span class="a-menu"> 책임분양</span></a></li>
				</ul>
			</div>
		</header>

		<div class="main_content">  <!-- 2 -->
			<!-- 메인컨텐트 -->
		
			<div id="container">
				<div class="content1">
					<!-- 글 -->
		
					<div class="navbar table">
						<h3>상세내용</h3>
							<div class="tableRow">
								<label>제목</label><span class="tableCell"><h4>${bvo.doc_subject}></h4></span>
							</div>
							<div class="tableRow">
								<label>카테고리</label><span class="tableCell">${bvo.category }</span>
								<label>이메일</label><span class="tableCell">${vo.email }</span>
								<label>닉네임</label><span class="tableCell">${vo.nick }</span>
							</div>
							<div class="tableRow">
								<label>글번호</label><span class="tableCell">${bvo.doc_no}</span>
								<label>작성일</label><span class="tableCell">${bvo.doc_date }</span>
								<label>조회수</label><span class="tableCell">${bvo.doc_readcount }</span>
							</div>
					</div>
					<!-- nav -->
							<h3>content</h3>
							<hr>
					<div class="board_content">${bvo.doc_content}</div>
					<!-- 내용 -->
					<hr>
					 
					<div class="comment_list">
						<div class="comment_sur">
							<h4>comment box  &nbsp;&nbsp; ${c_count.co_count}</h4>
						</div>
		
						<div class="comment_cont">
		                   <div class="co_tableRow">
		                   <c:forEach items ="${cList }" var ="colist">
		                       <div class="coCell"> ${colist.doc_content}</div>
		                       <span class="coCell">  ${colist.doc_nick} </span>
		                       <span class="coCell">   ${colist.doc_date} </span>
		                     </c:forEach>        
		                     </div>
		                </div>
		           </div><!-- comment_list  -->
		
		        
		        <!-- ad_board_content 1 끝 -->
		      </div> <!-- content1 끝 -->
		    </div><!-- container 끝 -->
		    
		</div>
	
<div class="right-container"><!-- 3 -->
	 <div class="content2">
           <!-- 신고목록 -->

	     <div class="w_navbar">
	      
	      	 <div class="warning_start">
	        	 <h3>신고리스트 &nbsp;&nbsp; ${wcount.w_count} </h3>
	       	</div>
	    </div>
	     <div class="w_btnlist">
	             
			<div id="ud_tab">
			
			  <input type="radio" name="ud_tabs" id="tab1" checked>
			  <label for="tab1">신고 글</label>
			
			  <input type="radio" name="ud_tabs" id="tab2">
			  <label for="tab2">신고 댓글</label>
			
			  <div id="ud_tab-content1" class="ud_content">
			  		<div class="divTable">
						<div class="divTableBody">
							<div class="divTableRow">
								<div class="divTableCell cell1">신고자</div>
								<div class="divTableCell cell2">신고사유</div>
								<div class="divTableCell cell3">신고일</div>
							</div>
							<% 
					    	if(w_docList != null){
					    		for(JJWarningVO doc_list : w_docList){
					   		 %>
							<div class="divTableRow board" onMouseOver="this.style.backgroundColor='#eceff1';" onMouseOut="this.style.backgroundColor=''">
								<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=doc_list.getW_no()%>'><%=doc_list.getW_email() %></a></div> 
					  			<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=doc_list.getW_no()%>'><%=doc_list.getW_reason() %></a></div> 
					  			<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=doc_list.getW_no()%>'><%=doc_list.getW_no()%></a></div> 
							</div>
					  		<% }}
					    	else{%>
							<div class="divTableRow">
					  			<div class="divTableCell"> 신고글이 없습니다 </div>
					  		</div>
					  		 <%} %>
							</div><!-- divTableBody -->
					</div>
			</div><!-- ud_tab-content1 -->
	 		 
			  <div id="ud_tab-content2" class="ud_content">
				  <div class="divTable">
						<div class="divTableBody">
							<div class="divTableRow">
								<div class="divTableCell">신고자</div>
								<div class="divTableCell">신고사유</div>
								<div class="divTableCell">신고일</div>
							</div>
							<% 
					  		if(w_coList != null){
					    		System.out.println(w_docList == null?true:false);
					    		for(JJWarningVO wc_list : w_coList){	
					  	  %>
							<div class="divTableRow comment" onMouseOver="this.style.backgroundColor='#eceff1';" onMouseOut="this.style.backgroundColor=''">
								<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=wc_list.getW_no()%>' w_co_category='<%=wc_list.getW_doc_no() %>'><%=wc_list.getW_email() %></a></div> 
					  			<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=wc_list.getW_no()%>'><%=wc_list.getW_reason() %></a></div> 
					  			<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=wc_list.getW_no()%>'><%=wc_list.getW_no()%></a></div> 
					  		</div>
					  		<% }}
					    	else{%>
							<div class="divTableRow">
					  			<div class="divTableCell">신고글이 없습니다 </div>
					  		</div>
					  		 <%} %>
						</div>
				  	</div><!-- divTable -->
			</div>
					   
		</div><!-- ud_tab -->
	               
	 </div><!-- w_btnlist -->
        </div> <!-- ad_detail_contents 2 끝 -->
   						<div class="authForm">
						       		<div class="w_info1">
						       			<div class="w_reason">
						       				<div><label>신고번호</label><input type="text" id ="ww_no" readonly ></div>
											<div><label>상태</label><input type="text" id ="ww_status" readonly></div>		
						       			</div>
						       			<div class="w_co_cont">
						       				<div><label>댓글내용</label><input type="text" id ="cc_comment" readonly> </div>
						       				<div><label>닉네임</label><input type="text" id ="cc_nick" readonly> </div>
						       				<div><label>작성일</label><input type="text" id ="cc_date" readonly> </div>
						       			</div>
						       		</div>
						       		<div class="w_info2">
						       			<div class="auth_write">
						       				<label>처리내용입력</label>
						       				<textarea type="text" class="ww_note" placeholder="처리 내용을 입력하세요"></textarea>
						       			</div>
						       			<div class="auth_btn2">
											<button class ="auth_hide" value="숨김">숨김</button> 
											<button class="auth_keep" value="유지">유지</button>
						       			</div>
						       		</div>
						       
						       </div><!-- authForm -->
</div><!-- right -->
</div><!-- body content  끝 -->
     
     

   </body>
   </html>