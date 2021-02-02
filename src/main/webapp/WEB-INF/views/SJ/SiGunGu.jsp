<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${requestType == '01' or requestType == '02'}">
	<select name="siGunGu" id="siGunGu">
		<c:if test="${requestType == '01'}">
		  	<option value="">전체</option>
			<c:if test="${fn:length(sigungu) > 0}">
				<c:forEach var="sigungu" items="${sigungu}" varStatus="status">
				  <option value="${sigungu.sigunguCode}">${sigungu.sigunguNm}</option>
				</c:forEach>
			</c:if>
		</c:if>
		<c:if test="${requestType == '02'}">
			<c:if test="${fn:length(sigungu) > 0}">
				<c:forEach var="sigungu" items="${sigungu}" varStatus="status">
				  <option value="${sigungu.sigunguCode}">${sigungu.sigunguNm}</option>
				</c:forEach>
			</c:if>
		</c:if>
	</select>
</c:if>

<c:if test="${requestType == '03'}">
	<c:if test="${fn:length(sigungu) > 0}">
		<c:forEach var="sigungu" items="${sigungu}" varStatus="status">
		  <option value="${sigungu.sigunguCode}">${sigungu.sigunguNm}</option>
		</c:forEach>
	</c:if>
</c:if>

<c:if test="${requestType == '04'}">
  	<option value="">전체</option>
	<c:if test="${fn:length(sigungu) > 0}">
		<c:forEach var="sigungu" items="${sigungu}" varStatus="status">
		  <option value="${sigungu.sigunguCode}">${sigungu.sigunguNm}</option>
		</c:forEach>
	</c:if>
</c:if>