<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- <select name="kind" id="kind" class="form-control"> -->
	<c:if test="${requestType == '01'}">
	  	<option value="">전체</option>
		<c:if test="${fn:length(animalkind) > 0}">
			<c:forEach var="kind" items="${animalkind}" varStatus="status">
			  <option value="${kind.kindCd}">${kind.kindNm}</option>
			</c:forEach>
		</c:if>
	</c:if>
	<c:if test="${requestType == '02'}">
	  	<option value="">전체</option>
		<c:if test="${fn:length(animalkind) > 0}">
			<c:forEach var="kind" items="${animalkind}" varStatus="status">
			  <option value="${kind.kindNm}">${kind.kindNm}</option>
			</c:forEach>
		</c:if>
	</c:if>
	${requestType}
<!-- </select> -->
 