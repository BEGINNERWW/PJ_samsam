<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>

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
		
		$('.pet-box').on('click', function() {
			var box = $(this);
			var content = box.children(".pet-content");
			var hidden = box.children(".pet-hidden");
			
			console.log(content);
			console.log(hidden);
			
			kindCd = content.children(".animal-kindCd").text() ;
			sexCd = content.children(".animal-sexCd").text() ;
			happenDt = content.children(".animal-happenDt").text() ;
			orgNm = content.children(".animal-orgNm").text() ;
			happenPlace = content.children(".animal-happenPlace").text() ;
			
			
			age = hidden.children(".animal-age").text() ;
			careAddr = hidden.children(".animal-careAddr").text() ;
			careNm = hidden.children(".animal-careNm").text() ;
			careTel = hidden.children(".animal-careTel").text() ;
			chargeNm = hidden.children(".animal-chargeNm").text() ;
			colorCd = hidden.children(".animal-colorCd").text() ;
			desertionNo = hidden.children(".animal-desertionNo").text() ;
			neuterYn = hidden.children(".animal-neuterYn").text() ;
			noticeEdt = hidden.children(".animal-noticeEdt").text() ;
			noticeNo = hidden.children(".animal-noticeNo").text() ;
			noticeSdt = hidden.children(".animal-noticeSdt").text() ;
			officetel = hidden.children(".animal-officetel").text() ;
			popfile = hidden.children(".animal-popfile").text() ;
			processState = hidden.children(".animal-processState").text() ;
			specialMark = hidden.children(".animal-specialMark").text() ;
			weight = hidden.children(".animal-weight").text() ;
			
			kindCd = kindCd.replace("[", "");
			kindCd = kindCd.replace("]", "");
			
			location.href = "/samsam/SJ/pet_detail?"
					+ "kindCd=" + kindCd
					+ "&happenPlace=" + happenPlace
					+ "&sexCd=" + sexCd
					+ "&happenDt=" + happenDt
					+ "&orgNm=" + orgNm
					+ "&age=" + age
					+ "&careAddr=" + careAddr
					+ "&careNm=" + careNm
					+ "&careTel=" + careTel
					+ "&chargeNm=" + chargeNm
					+ "&colorCd=" + colorCd
					+ "&desertionNo=" + desertionNo
					+ "&neuterYn=" + neuterYn
					+ "&noticeEdt=" + noticeEdt
					+ "&noticeNo=" + noticeNo
					+ "&noticeSdt=" + noticeSdt
					+ "&officetel=" + officetel
					+ "&popfile=" + popfile
					+ "&processState=" + processState
					+ "&specialMark=" + specialMark
					+ "&weight=" + weight;
			
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
	<c:if test="${ pageInfo != null }" >
		<div class="page-box">
			<span class="prev" data="${pageInfo.startNo-1}">◀</span>
			<c:forEach begin="${pageInfo.startNo}" end="${pageInfo.endNo}" varStatus="loop">
				<span class="pageNo">${loop.index}</span>
			</c:forEach>
			<span class="next" data="${pageInfo.endNo+1}">▶</span>
		</div>
	</c:if>
