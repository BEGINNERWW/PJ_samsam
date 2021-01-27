<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<script>
	$(document).ready(function(){
		var maxNo = "<c:out value='${pageInfo.maxNo}' />";
		
		$('.pageNo').on('click', function() {
			var pageNo = $(this).text();
			
			// 유기동불 리스트 요청
			getAnimalInfo(pageNo);
		});
		
		$('.prev').on('click', function() {
			var pageNo = $(this).attr("data");
			
			if( pageNo < 1 ){
				alert("첫 번째 페이지 입니다.");
				return;
			}
			
			// 유기동불 리스트 요청
			getAnimalInfo(pageNo);
		});
		
		$('.next').on('click', function() {
			var pageNo = $(this).attr("data");
			
			if( pageNo > maxNo ){
				alert("마지막 페이지 입니다.")
				return;
			}
			
			// 유기동불 리스트 요청
			getAnimalInfo(pageNo);
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
    <c:if test="${fn:length(animalList) == 0}">
    	<div>
    		<span>데이터가 존재하지 않습니다.</span>
    	</div>
    </c:if>
	<c:forEach var="animal" items="${animalList}" varStatus="status">
		<div class="pet-box">
			<div class="pet-img" style="background-image:url(${animal.filename })">
			 <%--  <img src="${animal.filename }" alt="img" /> --%>
			</div>
			<div class="pet-content">
				<div class="animal-kindCd">
					<label class="animal-info">품종</label>
					<span>${animal.kindCd }</span>
				</div>
				<div class="animal-sexCd">
					<label class="animal-info">성별</label>
					<span>${animal.sexCd }</span>
				</div>
				<div class="animal-happenDt">
					<label class="animal-info">실종접수일</label>
					<fmt:parseDate var="parseRegDate" value="${animal.happenDt}" pattern="yyyyMMdd"/>
					<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy년 MM월 dd일"/>
					<span>${resultRegDt}</span>
				</div>
				<div class="animal-orgNm">
					<label class="animal-info">시군구</label>
					<span>${animal.orgNm }</span>
				</div>
				<div class="animal-happenPlace">
					<label class="animal-info">발견장소</label>
					<span>${animal.happenPlace }</span>
				</div>
			</div>
			<div class="pet-hidden" style="display: none;"> 
				<div class="animal-age">${animal.age }</div>
				<div class="animal-careAddr">${animal.careAddr }</div>
				<div class="animal-careNm">${animal.careNm }</div>
				<div class="animal-careTel">${animal.careTel }</div>
				<div class="animal-chargeNm">${animal.chargeNm }</div>
				<div class="animal-colorCd">${animal.colorCd }</div>
				<div class="animal-desertionNo">${animal.desertionNo }</div>
				<div class="animal-neuterYn">${animal.neuterYn }</div>
				<div class="animal-noticeEdt">${animal.noticeEdt }</div>
				<div class="animal-noticeNo">${animal.noticeNo }</div>
				<div class="animal-noticeSdt">${animal.noticeSdt }</div>
				<div class="animal-officetel">${animal.officetel }</div>
				<div class="animal-popfile">${animal.popfile }</div>
				<div class="animal-processState">${animal.processState }</div>
				<div class="animal-specialMark">${animal.specialMark }</div>
				<div class="animal-weight">${animal.weight }</div>
			</div>
		</div>
	</c:forEach>
	<c:if test="${ pageInfo != null }" >
		<div class="page-box">
			<span class="prev" data="${pageInfo.startNo-1}">◀</span>
			<c:forEach begin="${pageInfo.startNo}" end="${pageInfo.endNo}" varStatus="loop">
				<span class="pageNo">${loop.index}</span>
			</c:forEach>
			<span class="next" data="${pageInfo.endNo+1}">▶</span>
		</div>
	</c:if>
