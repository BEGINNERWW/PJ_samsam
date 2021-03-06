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
<!-- 강조 -->
 
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
<!-- 스윗얼럿 -->
<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.comment_cont{
    height: 200px;
   }

</style>
<style type="text/css">
        mark {
            background: orange;
            color: black;
        }
        body::-webkit-scrollbar { 
    display: none; 
}
        
    </style>
<script >
	function fieldsetDisable()  {
		  const keep_btn = document.getElementsByClassName('auth_keep');
		  const hide_btn = document.getElementsByClassName('auth_hide');
		  console.log("실행한다")
		  if($('#ww_status').val() == "숨김" || $('#ww_status').val() == "유지" ){
			  keep_btn[0].disabled = true;
			  hide_btn[0].disabled = true;
		  }else{
			  console.log("flase")
  
			  keep_btn[0].disabled = false;
			  hide_btn[0].disabled = false; 
		  }
	}
	//
function war_detail(obj){
	event.preventDefault();	
	var w_co_no = $(obj).attr('w_co_no');

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
			$('#ww_note').val(map.wvo.w_note);  
			var category = map.wvo.w_category;
			console.log("category : "+category);
			
			if(category == '인증'){
				//코멘트 작성자
				if(map.covo != null){
				$('#cc_content').val(map.covo.doc_content);
				$('#cc_nick').val(map.covo.doc_nick);
				$('#cc_email').val(map.covo.doc_email);
				$('#cc_date').val(map.covo.doc_date);
				
				$('.w_co_cont').show();
				
				}else{
					
					
					$('.w_co_cont').hide();
				}
				
			}else{
				//코멘트 작성자
				if(map.covo != null){
				
				$('#cc_content').val(map.covo.doc_content);
				$('#cc_nick').val(map.covo.doc_nick);
				$('#cc_email').val(map.covo.doc_email);
				$('#cc_date').val(map.covo.doc_date);
				
				$('.w_co_cont').show();
				
				}else{
					
					
					$('.w_co_cont').hide();
				}
			}
			fieldsetDisable()
	
			},//success
		error:function(){
			console.log("ajax 통신 실패");
		}
	})	//ajax
	find_comment(w_co_no);
	//기본 이벤트 제거
	event.preventDefault();		
}//war_detail

function find_comment(w_co_no){
	
		console.log("find_comment")
		console.log(w_co_no)
	  if($('.find_comment').hasClass('now')){
	    $('.find_comment').removeClass('now')
	  }
	  console.log("w_co_no")
	  console.log($('.find_comment:nth-child(n)').attr('doc_cno'))
	  for(var i=0; i <= $('.find_comment').length; i++){
	    var nowcomment = $('.find_comment:nth-child('+ i +')').attr('doc_cno');
	    console.log("지금 코멘트 번호 :" +nowcomment)
	    if(nowcomment == w_co_no){
	      $('.find_comment:nth-child('+ i +')').addClass("now");
	      break;
	    }
	  }
	}
</script>

<script>
	$(document).ready(function(){
		function fieldsetDisable()  {
			  const keep_btn = document.getElementsByClassName('auth_keep');
			  const hide_btn = document.getElementsByClassName('auth_hide');
			  console.log("실행한다")
			  if($('#ww_status').val() == "숨김" || $('#ww_status').val() == "유지"){
				  keep_btn[0].disabled = true;
				  hide_btn[0].disabled = true;
			  }else{
				  keep_btn[0].disabled = false;
				  hide_btn[0].disabled = false; 
			  }
		}
	 fieldsetDisable()
	 
	 $('.divTableRow > divTableCell > a').on('click', function(){
		 fieldsetDisable()
	 })
	 
	/*isEmpty Setting*/
	 var isEmpty = function(val) {
        if (val === "" || val === null || val === undefined
          || (val !== null && typeof val === "object" && !Object.keys(val).length)
        ){
          return true
        } else {
          return false
        }
      };
	
		//모달에서 신고 처리
		//w_status : 디폴트 1 = 대기
		//				   2 = 유지
		//				   3 = 숨김
	$(document).on("click",'.auth_hide',function(event){
		if(isEmpty($('.ww_note').val())){
			$('.ww_note').focus();
		}
		else{
		console.log("처리내용 : " + $('.ww_note').val())
				var category =null;
				var data ={
						w_no: $('#ww_no').val(),
						w_note: $('.ww_note').val(),
						w_status : $('.auth_hide').val(),
						w_email: $('#ww_email').val()
				}
				console.log(data);
				$.ajax({
					url : '/samsam/w_authOrder.do',
					type: 'POST',
					data : JSON.stringify(data),
					dataType : 'json',
					contentType : 'application/json;charset=utf-8',
					success : function(map) {
							if(map.HCauth == "ok"){
								$('#ww_status').val("숨김")
								swal("","신고된 댓글이 삭제되었습니다.","info")
								fieldsetDisable() 
							}
							else if(map.HBauth == "ok"){
								$('#ww_status').val("숨김")
								swal("","신고된 글이 삭제되었습니다.","info")
								history.back();
							}
							else{
								$('#ww_status').val("업데이트실패");	
								swal("","이미 삭제된 댓글입니다.","info")
								fieldsetDisable() 

							}
							
							}, //success
					error : function() {
						alert("ajax 통신 실패!!!");
					}
				});//ajax
				event.preventDefault();
		}
	})//auth_hide
		
	$(document).on("click",'.auth_keep',function(event){
		
		if(isEmpty($('.ww_note').val())){
			$('.ww_note').focus();
		}
		else{
		var data ={
				w_no: $('#ww_no').val(),
				w_note: $('.ww_note').val(),
				w_status : $('.auth_keep').val()
		}
		$.ajax({
			url : '/samsam/w_authOrder.do',
			type: 'POST',
			data : JSON.stringify(data),
			dataType : 'json',
			contentType : 'application/json;charset=utf-8',
			
			success : function(map) {
					if(map.KBauth == "ok"){
						$('#ww_status').val("유지")
						swal("","신고된 글이 유지되었습니다.","info")
						fieldsetDisable() 
					}
					else if(map.KCauth == "ok"){
						$('#ww_status').val("유지")
						swal("","신고된 댓글이 유지되었습니다.","info")
						fieldsetDisable() 
					}
					else{
						$('#ww_status').val("업데이트실패");	
						swal("","이미 삭제된 댓글입니다.","info")
						fieldsetDisable() 

					}
					}, //success
			error : function() {
				alert("ajax 통신 실패!!!");
		}
		});//ajax
		event.preventDefault();
		}
	})//auth_keep

	})
	
	

</script>
<style type="text/css">
    body {
        overflow-x: hidden;
    }
</style>
</head>

<body>
	<div class="body_content">

		<header id="header">
			<div class="d-flex flex-column">
				<div class="profile">
				<img src = "resources/img/samsam2.png" alt class = "img-circle">
					<h1 class ="text-light">
				<a href ="#" class = "onMember"> ADMIN  </a>
			</h1>
		</div>
		<div class ="admin_inout">
			<button type="button" class ="grade" onclick="location.href='home.me'">HOME</button>
			<button type="button" class ="grade" onclick="location.href='logout.me'">LOGOUT</button>
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
					<% if(bvo.getCategory().equals("책임인증게시판")){ %>
					<h3>상세내용</h3>
							<div class="tableRow">
								<label>제목</label><span class="tableCell"><h4>${bvo.fadoc_subject}</h4></span>
							</div>
							<div class="tableRow">
								<label>카테고리</label><span class="tableCell">${bvo.category }</span>
								<label>이메일</label><span class="tableCell">${vo.email }</span>
								<label>닉네임</label><span class="tableCell">${vo.nick }</span>
							</div>
							<div class="tableRow">
								<label>글번호</label><span class="tableCell">${bvo.doc_no}</span>
								<label>작성일</label><span class="tableCell">${bvo.fadoc_date }</span>
								<label>조회수</label><span class="tableCell">${bvo.fadoc_readcount }</span>
							</div>
					</div>
					<!-- nav -->
							<h4>content</h4>
							<hr>
					<div class="board_content">${bvo.fadoc_content}</div>
					
				   <%} else{%>
						<h3>상세내용</h3>
							<div class="tableRow">
								<label>제목</label><span class="tableCell"><h4>${bvo.doc_subject}</h4></span>
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
							<h4>content</h4>
							<hr>
					
					
					<div class="board_content">${bvo.doc_content}</div>
					<%} %>
					
					<!-- 내용 -->
					<hr>
					 
					<div class="comment_list">
						<div class="comment_sur">
							<h4 class="comment_sur item" >comment box  &nbsp;&nbsp; ${c_count.co_count}</h4>
						</div>
		
						<div class="comment_cont" style="overflow-y: scroll;">
		                   <div class="co_tableRow" >
		                   <c:forEach items ="${cList }" var ="colist">
		                   	   <div class = "find_comment" doc_cno = "${colist.doc_cno}" >
		                       		<div class="coCell item" style="padding: 0px; font-size: 13px; font-weight: unset;  border-top: 1px solid #efefef;"> ${colist.doc_content}</div>
		                       		<span class="coCell" style="color:#aeaeae;">  ${colist.doc_nick} </span>&nbsp;&nbsp;
		                       		<span class="coCell" style="color:#aeaeae; padding-bottom:border 1px solid black;">   ${colist.doc_date} </span>
							   </div>
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
					  			<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=doc_list.getW_no()%>'><%=doc_list.getW_date()%></a></div> 
							</div>
					  		<% }}
					    	else{%>
							<div class="divTableRow">
					  			<div class="divTableCell"></div>
					  		</div>
					  		 <%} %>
							</div><!-- divTableBody -->
					</div>
			</div><!-- ud_tab-content1 -->
	 		 
			  <div id="ud_tab-content2" class="ud_content">
				  <div class="divTable">
						<div class="divTableBody">
							<div class="divTableRow">
								<div class="divTableCell cell1">신고자</div>
								<div class="divTableCell cell2">신고사유</div>
								<div class="divTableCell cell3">신고일</div>
							</div>
							<% 
					  		if(w_coList != null){
					    		System.out.println(w_docList == null?true:false);
					    		for(JJWarningVO wc_list : w_coList){	
					  	  %>
							<div class="divTableRow comment" onMouseOver="this.style.backgroundColor='#eceff1';" onMouseOut="this.style.backgroundColor=''">
								<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=wc_list.getW_no()%>'  w_co_no = '<%=wc_list.getW_co_no()%>' w_co_category='<%=wc_list.getW_doc_no() %>'><%=wc_list.getW_email() %></a></div> 
					  			<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=wc_list.getW_no()%>'  w_co_no = '<%=wc_list.getW_co_no()%>'><%=wc_list.getW_reason() %></a></div> 
					  			<div class="divTableCell"><a href="javascript:void(0);" onclick="war_detail(this);" ww_no ='<%=wc_list.getW_no()%>'  w_co_no = '<%=wc_list.getW_co_no()%>'><%=wc_list.getW_date()%></a></div> 
					  		</div>
					  		<% }}
					    	else{%>
							<div class="divTableRow">
					  			<div class="divTableCell"></div>
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
											<div style="display:none;"><label>상태</label><input type="text" id ="ww_email" readonly></div>		
						       			</div>
						       			<div class="w_co_cont">
						       				<div><label>작성자</label><input type="text" id ="cc_email" readonly> </div>
						       				<div><label>닉네임</label><input type="text" id ="cc_nick" readonly> </div>
						       				<div><label>작성일</label><input type="text" id ="cc_date" readonly> </div>
						       				<div><label>댓글내용</label><input type="text" id ="cc_content" readonly> </div>
						       			</div>
						       		</div>
						       		<div class="w_info2">
						       			<div class="auth_write">
						       				<label>처리내용입력</label>
						       				<textarea type="text" class="ww_note" placeholder="처리 내용을 입력하세요"></textarea>
						       			</div>
						       			<div class="auth_btn2">
											<button class ="auth_hide" value="숨김" disabled="false">숨김</button> 
											<button class="auth_keep" value="유지" disabled="false">유지</button>
											<button class="back" value="뒤로가기" onclick="history.back()">뒤로가기</button>
						       			</div>
						       		</div>
						       
						       </div><!-- authForm -->
</div><!-- right -->
</div><!-- body content  끝 -->
     <script type="text/javascript">
   
</script>
     

   </body>
   </html>