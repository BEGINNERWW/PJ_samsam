<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.project.samsam.myfree.*" %>

<%
	//String email = (String)session.getAttribute("email");
	//email.toUpperCase();
	Myfree_authVO auth_view = (Myfree_authVO)request.getAttribute("auth_view");
	Myfree_doc_confirmVO confirm_view = (Myfree_doc_confirmVO)request.getAttribute("confirm_view");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

function closePopup() {
    window.opener.location.reload();
    window.close();
}

</script>
<style>
hr {
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: 0;
    border-top: 1px solid black;
}

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
hr {
	border: 1px solid rgba(0,0,0,.125);
}
</style>
</head>
<body>
<br>
<table style="border: 1px solid rgba(0,0,0,.125);;" width="830px" align="center">
	<tr>
		<td>
			<table width="820px" align="center" cellspacing="10px">
				<tr><td height="5px"></td></tr>
				<tr>
					<th width="100px" class="text-center" height="15">제목</th>
					<td width="700px"><%=auth_view.getFadoc_subject() %></td>
				</tr>
				<tr>
					<th width="100px" class="text-center" height="15">작성일</th>
					<td width="700px"><%=auth_view.getFadoc_date() %></td>
				</tr>
				<tr>
					<th width="100px" class="text-center">분양코드</th>
					<td><%=confirm_view.getConfirm_fdoc_code() %></td>
				</tr>
				<tr><td width="820px" colspan="2"><hr></td></tr>
				
				<tr>
					<td width="820px" height="650px" colspan="2" align=left valign=top style= padding:10px;>
  						<%=auth_view.getFadoc_content() %>
					</td>
				</tr>
			</table>		
		</td>
	</tr>
</table>
<br>
	<center>
		<button type="button" class="btn btn-danger btn-md"
		onclick="javascript:closePopup()">닫기</button>
	</center>
	
	
<!-- 부트스트랩 4.0 js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>