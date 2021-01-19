<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		var maxNo = "<c:out value='${pageInfo.maxNo}' />";
		
		$('.pageNo').on('click', function() {
			var pageNo = $(this).text();
			
			// 보호소 상세정보 리스트 요청
			getShelterInfo(pageNo);
		});
		
		$('.prev').on('click', function() {
			var pageNo = $(this).attr("data");
			
			if( pageNo < 1 ){
				alert("첫 번째 페이지 입니다.");
				return;
			}
			
			// 보호소 상세정보 리스트 요청
			getShelterInfo(pageNo);
		});
		
		$('.next').on('click', function() {
			var pageNo = $(this).attr("data");
			
			if( pageNo > maxNo ){
				alert("마지막 페이지 입니다.")
				return;
			}
			
			// 보호소 상세정보 리스트 요청
			getShelterInfo(pageNo);
		});
		
		
	});
	
</script> 
 
<style>
	.page-box {
		margin: 10px;
		text-align: center;
	}
	
	.page-box span {
		padding: 5px;
		cursor: pointer;
		
	}
	
	.page-box span:hover {
		color: blue;
		
	}
</style>
    
<table border="1">
	<tr>
		<th>분류</th>
		<th>보호소명</th>
		<th>주소</th>
		<th>전화번호</th>
	</tr>
	<c:forEach var="shelter" items="${shelterList}" varStatus="status">
		<tr>
			<td>${shelter.divisionNm }</td>
			<td>${shelter.careNm }</td>
			<td>${shelter.careAddr }</td>
			<td>${shelter.careTel }</td>
		</tr>
		<%--
		<div class="shelter-box">
			<div class="shelter-content">
				<span></span>
				<span>${shelter.careNm }</span>
				<span>${shelter.careAddr }</span>
				<span>${shelter.careTel }</span>
				<span>${shelter.dataStdDt }</span>
				<span>${shelter.divisionNm }</span>
				<span>${shelter.jibunAddr }</span>
				<span>${shelter.orgNm }</span>
			</div>
		</div>
		 --%>
	</c:forEach>
</table>

<c:if test="${ pageInfo != null }" >
	<div class="page-box">
		<span class="prev" data="${pageInfo.startNo-1}">◀</span>
		<c:forEach begin="${pageInfo.startNo}" end="${pageInfo.endNo}" varStatus="loop">
			<span class="pageNo">${loop.index}</span>
		</c:forEach>
		<span class="next" data="${pageInfo.endNo+1}">▶</span>
	</div>
</c:if>
