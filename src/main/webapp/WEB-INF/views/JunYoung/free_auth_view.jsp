<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page import="com.project.samsam.myfree.*" %>

<%
	Myfree_authVO auth_view = (Myfree_authVO)request.getAttribute("auth_view");
	Myfree_doc_confirmVO confirm_view = (Myfree_doc_confirmVO)request.getAttribute("confirm_view");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책임인증글</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

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
</style>
</head>
<body>
<br>
<table border="2" width="830px" align="center">
	<tr>
		<td>
			<table width="820px" align="center" cellspacing="10px">
				<tr><td height="5px"></td></tr>
				<tr>
					<th width="100px" class="text-center" height="15">제목</th>
					<td width="700px"><%=auth_view.getFadoc_subject() %></td>
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
		<button type="button" class="btn btn-outline-primary btn-lg"
		onclick="javascript:closePopup()">닫기</button>
	</center>
</body>
</html>