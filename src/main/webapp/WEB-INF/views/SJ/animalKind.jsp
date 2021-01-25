<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<select name="kind" id="kind">
  	<option value="">전체</option>
	<c:if test="${fn:length(animalkind) > 0}">
		<c:forEach var="kind" items="${animalkind}" varStatus="status">
		  <option value="${kind.kindCd}">${kind.kindNm}</option>
		</c:forEach>
	</c:if>
</select>
