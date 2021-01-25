<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.samsam.hospital.*" %>



    <%
    	String email = (String)session.getAttribute("email");
    	String nick = (String)session.getAttribute("nick");
    	
    	List<Hospital_mapVO> hospital_mapVO = (List<Hospital_mapVO>)request.getAttribute("hospital_mapVO");
    	
    	String place_id = (String)request.getAttribute("place_id");
    	String place_name = (String)request.getAttribute("place_name");
    	String address_name = (String)request.getAttribute("address_name");
    	String place_phone = (String)request.getAttribute("place_phone");
    	String place_url = (String)request.getAttribute("place_url");
    	String place_email = (String)request.getAttribute("place_email");
    	
    	int listcount=((Integer)request.getAttribute("listcount")).intValue();
    	int nowpage=((Integer)request.getAttribute("page")).intValue();
    	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
    	int startpage=((Integer)request.getAttribute("startpage")).intValue();
    	int endpage=((Integer)request.getAttribute("endpage")).intValue();
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title><%=place_name %></title>

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
   overflow: hidden;
}


body {
   margin: 0;
   height: auto;
    box-sizing : content-box;
   line-height: 1.7;
    color: black;
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
.left-section {
    width: 375px;
    font-size: 18px;
    text-align: center;
    height: 200px;
    border-right-color: darkblue;
    border-right: 1px solid #efefef;
    padding: 0px 0px 0 0;
    margin-left: 0;
    position: relative;
    padding-top: 55px;
}
.right-section {
    width: 375px;
    height: 200px;
    left: 375px;
    padding-left: 10px;
    position: relative;
    line-height: 140px;
    top: -198px;
}
.row {
	width: fit-content;
	height: 30px;
    margin: 0;
    padding: 0;
    }
    
.review_section {
    position: relative;
    width: 730px;
    margin-left: 10px;
    background-color: #f8f8f8;
    height: fit-content;
    bottom: 190px;
}
.paging-section {
    position: sticky;
    bottom: 80px;
}
.wirte-review-section {
    position: absolute;
    bottom: 45px;
    margin-left: 10px;
}
 
 #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }    
    #star_grade span.on{
        color: red;
    }    

.btn-primary {
    background-color: #ff5656;
    color: #fff;
    border: 0;
    margin-left: 5px;
}

.btn-primary:hover {
    background-color: #ff5656;
    color: #fff;
    border: 0;
}
/* 페이징 버튼  */
div > a {
	color : black;
	text-decoration: none;
}
p {
    margin-top: 0;
    margin-bottom: 0rem;
}
input[type="text"] {
    width: 580px;
    margin-left: 5px;
}
.row.review_list {
    height: 22px;
}
.date {
    font-size: 12px;
    padding-top: 2px;
}
</style>

</head>
<body>

	<div class="content-wrap">
		
		<h4 style="text-align:center; margin-top:20px;">상세정보</h4>
		<hr style="width:748px; border:1px solid #efefef; margin: 20px 0 0 0; padding: 0">
		
		<div class="left-section">
			<div style="font-size: 25px;"><%=place_name %></div>
			<%
			if (hospital_mapVO.isEmpty()) {
				%>
				<div>0.0</div>
				<p id="star_grade" style="margin:0;">
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			<%} else {
			
			double star_rating_sum = 0;
    		double num = hospital_mapVO.size();
    		
			for (int i=0; i<hospital_mapVO.size(); i++) {
    		Hospital_mapVO review_list = (Hospital_mapVO)hospital_mapVO.get(i);
    		
    		star_rating_sum += review_list.getStar_rating();
    		
    		}
			double sum_num = star_rating_sum/num;
			double star_rating_avg = Math.round((sum_num)*100/(double)100);
			
			if (star_rating_avg == 5) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
				</p>
			<div><%=star_rating_avg %></div>
			
			
			<%} 
			else if (star_rating_avg >= 4) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span >★</span>
				</p>
			<div><%=star_rating_avg %></div>
			<%} 
			else if (star_rating_avg >= 3) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			<div><%=star_rating_avg %></div>
			<%} 
			else if (star_rating_avg >= 2) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			<div><%=star_rating_avg %></div>
			<%} 
			else if (star_rating_avg >= 1) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			<div><%=star_rating_avg %></div>
			<%} 
			else { %>
			<p id="star_grade" style="margin:0;">
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			<div><%=star_rating_avg %></div>
			
			<%	}
			}	%>
		</div>
	
		<div class="right-section">
		
			<div class="row">
			<div style="width:58px;">주소</div>
			<div><%=address_name %></div>
			</div>
			
			<div class="row">
			<div style="width:60px;">전화번호</div>
			<div><%=place_phone %></div>
			</div>
			
			<div class="row">
			<div style="width:60px;">홈페이지</div>
			<div><%=place_url %></div>
			</div>
		</div>
		
		<div class="review_section">
		
		
		<% for (int j=0; j<hospital_mapVO.size(); j++) {
			Hospital_mapVO review_list = (Hospital_mapVO)hospital_mapVO.get(j);
			%>
			<div class="row review_list">
			<div><%=review_list.getPlace_nick() %></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="date"><%=review_list.getPlace_date() %></div>
			</div>
			
			<%
			if (review_list.getStar_rating() == 5) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
				</p>
			       <%
			       if (review_list.getPlace_email().equals(email)) { %>
			        <a href="javascript:delete_review()" style="color:black;float: right;margin-right: 15px;margin-top: -24px;">삭제</a>
			        <%} %>
			
			
			<%} 
			else if (review_list.getStar_rating() >= 4) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span >★</span>
				</p>
			         <%
			       if (review_list.getPlace_email().equals(email)) { %>
			        <a href="javascript:delete_review()" style="color:black;float: right;margin-right: 15px;margin-top: -24px;">삭제</a>
			        <%} %>
			<%} 
			else if (review_list.getStar_rating() >= 3) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			        <%
			       if (review_list.getPlace_email().equals(email)) { %>
			        <a href="javascript:delete_review()" style="color:black;float: right;margin-right: 15px;margin-top: -24px;">삭제</a>
			        <%} %>
			<%} 
			else if (review_list.getPlace_email().equals(email)) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span class="on">★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			         <%
			       if (review_list.getPlace_email().equals(email)) { %>
			        <a href="javascript:delete_review()" style="color:black;float: right;margin-right: 15px;margin-top: -24px;">삭제</a>
			        <%} %>
			<%} 
			else if (review_list.getStar_rating() >= 1) { %>
			<p id="star_grade" style="margin:0;">
			        <span class="on">★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
				</p>
			         <%
			       if (review_list.getPlace_email().equals(email)) { %>
			        <a href="javascript:delete_review()" style="color:black;float: right;margin-right: 15px;margin-top: -24px;">삭제</a>
			        <%} %>
			<%} 
			else { %>
			<p id="star_grade" style="margin:0;">
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			        <span>★</span>
			</p>
			         <%
			       if (review_list.getPlace_email().equals(email)) { %>
			        <a href="javascript:delete_review()" style="color:black;float: right;margin-right: 15px;margin-top: -24px;">삭제</a>
			        <%} %>
			
		<% 
		}
			%>
			<form action="/" name = "delete_review" method="post">
			<input type="hidden" name="review_num" value="<%=review_list.getReview_num() %>">
			
			<div><%=review_list.getPlace_review() %></div>
			<hr style="width:728px; border:1px solid #efefef; margin: 0px 0 0 0; padding: 0">
			<%
	}
	%>	
	
	</div> <!-- review_section -->
	</div><!-- content-wrap -->
	<div class="paging-section">
	
	<br>
	<%if (hospital_mapVO.isEmpty()) {} else { %>
						
					<table style="margin: 0 auto">
						<tr align=center height="50px">
						<td class="paging">
						<div class="row">
						
							<%if(nowpage<=1){ %> <!-- 이전페이지가 존재하지 않을 때 --> [이전]&nbsp; <!-- 이전 버튼 비활성화 -->
							<%}else{ %> <!-- 이전페이지가 존재할 때 --> <a
							href="javascript:click_before()" >
							<!-- 이전 버튼 누를 때 -->
							<form action="/" name = "place_detail_before" method="post">
							<input type="hidden" name="place_id" value="<%=place_id %>">
							<input type="hidden" name="place_name" value="<%=place_name %>">
							<input type="hidden" name="address_name" value="<%=address_name %>">
							<input type="hidden" name="place_phone" value="<%=place_phone %>">
							<input type="hidden" name="place_url" value="<%=place_url %>">
							<input type="hidden" name="place_email" value="<%=email %>">
							<input type="hidden" name="nick" value="<%=nick %>">
							<input type="hidden" name="page" value="<%=nowpage-1 %>">
							</form>
							[이전]&nbsp;
							</a> <%} %>

							<%for(int a=startpage;a<=endpage;a++){
							if(a==nowpage){%> [<%=a %>] <%}else{ %> <!-- 현재 페이지가 nowpage가 아닐 때 -->
							<a href="javascript:click_now()">&nbsp;[<%=a %>]&nbsp;
							<!-- 페이지 숫자 누를 때 -->
							<form action="/" name = "place_detail_now" method="post">
							<input type="hidden" name="place_id" value="<%=place_id %>">
							<input type="hidden" name="place_name" value="<%=place_name %>">
							<input type="hidden" name="address_name" value="<%=address_name %>">
							<input type="hidden" name="place_phone" value="<%=place_phone %>">
							<input type="hidden" name="place_url" value="<%=place_url %>">
							<input type="hidden" name="place_email" value="<%=email %>">
							<input type="hidden" name="nick" value="<%=nick %>">
							<input type="hidden" name="page" value="<%=a %>">
							</form>
							</a> 
						
							<%} %> <%} %> <%if(nowpage>=maxpage){ %> [다음] <%}else{ %> <a
							href="javascript:click_next()">[다음]
							<!-- 다음 버튼 누를 때 -->
							<form action="/" name = "place_detail_next" method="post">
							<input type="hidden" name="place_id" value="<%=place_id %>">
							<input type="hidden" name="place_name" value="<%=place_name %>">
							<input type="hidden" name="address_name" value="<%=address_name %>">
							<input type="hidden" name="place_phone" value="<%=place_phone %>">
							<input type="hidden" name="place_url" value="<%=place_url %>">
							<input type="hidden" name="place_email" value="<%=email %>">
							<input type="hidden" name="nick" value="<%=nick %>">
							<input type="hidden" name="page" value="<%=nowpage+1 %>">
							</form>
							</a> <%} %>
							</div>
						</td>
					</tr>
					</table>
				<%} %>
		</div><!-- pagind-section -->
		
		
		
		
		<div class="wirte-review-section">
		
		<form action="write_review.bo" name = "place_review_form" method="post">
		<input type="hidden" name="sequence" value="<%=hospital_mapVO.size() %>">
		<input type="hidden" name="place_id" value="<%=place_id %>">
		<input type="hidden" name="place_name" value="<%=place_name %>">
		<input type="hidden" name="address_name" value="<%=address_name %>">
		<input type="hidden" name="place_phone" value="<%=place_phone %>">
		<input type="hidden" name="place_url" value="<%=place_url %>">
		<input type="hidden" name="place_email" value="<%=email %>">
		<input type="hidden" name="nick" value="<%=nick %>">
		
		
		<div class="row">
		<%int star_rating = 0; %>
		<p id="star_grade" style="padding-top: 5px">
	        <a href="#" id="star1">★</a>
	        <a href="#" id="star2">★</a>
	        <a href="#" id="star3">★</a>
	        <a href="#" id="star4">★</a>
	        <a href="#" id="star5">★</a>
		</p>
		<input type="hidden" id="star_rating" name="star_rating" value="<%=star_rating %>">
		
		<input type="text" name="place_review" id="place_review">
		</form>
		<button type="button" class="btn btn-primary btn-md"><a href="javascript:write_review()" style="color:white;">등록</a></button>
				</div><!-- write-review_section -->
			
	
	
<script>
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
        
        $('#star1').click(function(star_rating) {
        	document.getElementById("star_rating").value = 1;
        })
        
        $('#star2').click(function() {
        	document.getElementById("star_rating").value = 2;
        })
        
        $('#star3').click(function() {
        	document.getElementById("star_rating").value = 3;
        })
        
        $('#star4').click(function() {
        	document.getElementById("star_rating").value = 4;
        })
        
        $('#star5').click(function() {
        	document.getElementById("star_rating").value = 5;
        })
        
        function write_review() {
        	
        	
        	place_review_form.submit();
        }
        
        function click_before() {
        	var popupWidth = 750;
        	var popupHeight = 800;

        	var popupX = (window.screen.width / 2) - (popupWidth / 2);
        	var popupY= (window.screen.height / 2) - (popupHeight / 2);
        	
        	var popupfrm = window.open('about:blank', 'place_review', 'height=' + popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY );
        	var frm = document.place_detail_before;
        	frm.action = 'select_review.bo';
        	frm.target = 'place_review';
        	frm.method = "post";
        	
        	frm.submit();
        }
        function click_now() {
        	var popupWidth = 750;
        	var popupHeight = 800;

        	var popupX = (window.screen.width / 2) - (popupWidth / 2);
        	var popupY= (window.screen.height / 2) - (popupHeight / 2);
        	
        	var popupfrm = window.open('about:blank', 'place_review', 'height=' + popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY );
        	var frm = document.place_detail_now;
        	frm.action = 'select_review.bo';
        	frm.target = 'place_review';
        	frm.method = "post";
        	
        	frm.submit();
        }
        function click_next() {
        	var popupWidth = 750;
        	var popupHeight = 800;

        	var popupX = (window.screen.width / 2) - (popupWidth / 2);
        	var popupY= (window.screen.height / 2) - (popupHeight / 2);
        	
        	var popupfrm = window.open('about:blank', 'place_review', 'height=' + popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY );
        	var frm = document.place_detail_next;
        	frm.action = 'select_review.bo';
        	frm.target = 'place_review';
        	frm.method = "post";
        	
        	frm.submit();
        }
        function delete_review() {
        	var popupWidth = 750;
        	var popupHeight = 800;

        	var popupX = (window.screen.width / 2) - (popupWidth / 2);
        	var popupY= (window.screen.height / 2) - (popupHeight / 2);
        	
        	var popupfrm = window.open('about:blank', 'place_review', 'height=' + popupHeight + ',width=' + popupWidth + ',left=' + popupX + ',top=' + popupY );
        	var frm = document.delete_review;
        	frm.action = 'delete_review.bo';
        	frm.target = 'place_review';
        	frm.method = "post";
        	
        	frm.submit();
        }
        
        
        
        
</script>
	
	
</body>
</html>