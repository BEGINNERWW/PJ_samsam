<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.project.samsam.board.*" %>
<%
 	adopt_homeVO adoptvo = (adopt_homeVO)request.getAttribute("adopt");  
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<meta charset="UTF-8">
<script type ="text/javascript" src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>	
<style>
	
	
	hr{
		width:650px;
	}
	
	.content_bar{
		border:solid 1px #ebecef;
	}
	
	.menubar{height:70px;}
	
	.Dbody{
		
		width:1000px;
		margin:0 auto;
		height:1000px;
	}
	
	.content{
		border:solid 1px #ebecef;
		width:700px;
		margin:0 auto;
		
	}
	
	.viewsubjectdiv{
		width:700px;
		margin:0 auto;
		height:100px;
	}
	
	.text_item{
		margin:0px 0px 0px 5px;
	}
	
	#write_content{
		
	}
	
	#content_wrap{padding:29px 29px 0;}
	
	
</style>

<script>
	function reply(){
		$('.reply_write_box').empty();
		jQuery.ajax({
			 url : 'adopt_reply_write.bo',
	         type : 'POST',
	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	         dataType : 'json',
	         success : function (data) {
	        	 var di = '';
	        	 di += '<div class>번호 </th>'
	        	
	         	 
	         	 $('.reply_write_area').append(di);
	        	 $.each(data, function(index, item){
	        		var di = '';
	        		
	        		di += '<ul class = reply_list>'
	        		di += '<li id = "">'
	        		di += '<div id = "reply_area">'
	        		di += '<div id = nick_area>'
	        		di += '<닉네임>'
	        		di += '</div>'
	        		di += '<div id ="reply_content">'
	        		di += '<댓글 내용>'
	        		di += '</div>'
	        		di += '</div>'//reply_area end
	        		di += '</li>'
	        		
	        		di += '</ul>' //reply_list end
	        	 });
			}
		});
	};
</script>

</head>
<body>
	<div class = "menubar">
	menu
	</div>
	<div class = "Dbody">
		<div class = "content">
			<div id = "content_wrap">
				<div id="btn_area">
					<p><b>가정분양 게시판</b></p>
					<button type = "button" class="btn btn-default">목록</button>
					
				</div>		
				<div id = "subject_area">
					<h4 class ="subject">제목:<%=adoptvo.getHome_subject()%></h4>
				</div>
				
				<div id = "wirete_info">
					<span class = "text_item"><b><%=adoptvo.getHome_nick()%></b></span>
					<span class = "text_item"><small>조회 <%=adoptvo.getHome_readcount()%></small></span>
					<span class = "text_item"><small><%=adoptvo.getHome_date()%></small></span>
					
				</div>
				<hr>
				
				
				<div id = "write_content">
					<%=adoptvo.getHome_content()%>
				</div>
				
				
				<jsp:include page = "./adopt_replyview.jsp">
					<jsp:param name = "home_no" value="<%=adoptvo.getHome_no() %>"/>
				</jsp:include>
				
				
			</div>
		</div>
	</div>
</body>
</html>