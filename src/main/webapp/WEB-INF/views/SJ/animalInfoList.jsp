<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		
	});
	
</script> 
 
 
<c:if test="${ animalList == null }" >
	<div class="pet-empty">
		<div> 조회된 데이터가 없습니다. </div>
	</div>
</c:if>

<c:forEach var="animal" items="${animalList}" varStatus="status">
	<div class="pet-box">
		<div class="pet-img">
		  <img src="${animal.filename }" alt="img" />
		</div>
		<div class="pet-content">
			<span class="animal-kindCd">${animal.kindCd }</span>
			<span class="animal-sexCd">${animal.sexCd }</span>
			<span class="animal-happenDt">${animal.happenDt }</span>
			<span class="animal-orgNm">${animal.orgNm }</span>
			<span class="animal-happenPlace">${animal.happenPlace }</span>
		</div>
		<div class="pet-hidden" style="display: none;"> 
			<span class="animal-age">${animal.age }</span>
			<span class="animal-careAddr">${animal.careAddr }</span>
			<span class="animal-careNm">${animal.careNm }</span>
			<span class="animal-careTel">${animal.careTel }</span>
			<span class="animal-chargeNm">${animal.chargeNm }</span>
			<span class="animal-colorCd">${animal.colorCd }</span>
			<span class="animal-desertionNo">${animal.desertionNo }</span>
			<span class="animal-neuterYn">${animal.neuterYn }</span>
			<span class="animal-noticeEdt">${animal.noticeEdt }</span>
			<span class="animal-noticeNo">${animal.noticeNo }</span>
			<span class="animal-noticeSdt">${animal.noticeSdt }</span>
			<span class="animal-officetel">${animal.officetel }</span>
			<span class="animal-popfile">${animal.popfile }</span>
			<span class="animal-processState">${animal.processState }</span>
			<span class="animal-specialMark">${animal.specialMark }</span>
			<span class="animal-weight">${animal.weight }</span>
		</div>
	</div>
</c:forEach>