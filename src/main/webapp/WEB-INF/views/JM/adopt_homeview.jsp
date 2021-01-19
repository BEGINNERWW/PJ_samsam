<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.project.samsam.board.*" %>
<%
 	adopt_homeVO adoptvo = (adopt_homeVO)request.getAttribute("adopt");  
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>

<style>
	
	img{
	max-width:100%;
	}
	
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

</script>

	<!-- 부트스트랩 4.0 js -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

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
</head>
<body>

	<div class = "Dbody">
		<div class = "content">
			<div id = "content_wrap">
				<div id="btn_area">
					<p><b>가정분양 게시판</b></p>
					<button type = "button" class="btn btn-default">목록</button>
					<a href = "writeupdateview.bo">수정</a>
					
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