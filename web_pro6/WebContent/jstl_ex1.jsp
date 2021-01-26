<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="만세"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	**변수처리**
	<br>
	<만세:set var="irum" value="신기해" scope="page"></만세:set>
	<만세:out value="${irum }"></만세:out>
	<br>
	<c:set var="irum" value="신기해" scope="page"></c:set>
	<c:out value="${irum }" />
	<br>
	<c:set var="ir" scope="session">
한국인
</c:set>
	<c:out value="${ir}" />
	<br>
	<c:set var="aa" value="${header['user-Agent'] }" scope="page" />
	aa 값은
	<c:out value="${aa }"></c:out>
	<br>
	<c:remove var="aa" scope="session" />
	aa 값은
	<c:out value="${aa }"></c:out>
	<%-- scope의 범위가 안맞아서 안지워짐! --%>
	<br>
	<c:remove var="aa" scope="page" />
	aa 값은
	<c:out value="${aa }"></c:out>

	<br>
	<c:set var="su1" value="10" />
	<c:set var="su2"> 20.3 </c:set>
	합은 ${su1+su2 }

	<br> **조건문 if**
	<br>
	<c:set var="bb" value="star" />

	<c:if test="${bb eq 'star'}">
조건이 참인 경우1 : <c:out value="${bb }" />
	</c:if>
	<br>
	<c:if test="${bb !='star'}">
조건이 참인 경우2 : <c:out value="${bb }" />
	</c:if>
	<br>
	<c:if test="${bb !=null}">
조건이 참인 경우 :3 <c:out value="${bb }" />
	</c:if>

	<p />
	**조건문 choose**
	<br>
	<c:choose>
		<c:when test="${bb eq 'moon' }">
	달이야
	</c:when>
		<c:when test="${bb eq 'star' }">
	별헤는 밤
	</c:when>
		<c:otherwise>기타</c:otherwise>
	</c:choose>

	<p />
	<c:choose>
		<c:when test="${empty param.name }">
			<%--param값이 비워져 잇으면 아래를 실행. --%>
			<form>
				이름: <input type="text" name="name"> <input type="submit"
					value="확인">
			</form>
		</c:when>
		<c:when test="${param.name == 'admin'}"> 
		아~ 관리자군요?!
	</c:when>
		<c:otherwise>
		환영합니다. 회원 <c:out value="${param.name }" /> 님.
	</c:otherwise>
	</c:choose>

	<p />
	**반복문 forEach
	<br>
	<c:forEach var="cc" begin="1" end="10" step="1">
		<c:out value="${cc }" />
	</c:forEach>
	<br> 구구단(3단)
	<br>
	<c:forEach var="i" begin="1" end="9">
3 * ${i } = ${3*i }<br>
	</c:forEach>
	<br> 다중 for로 header 정보 출력
	<br>
	<c:forEach var="h" items="${headerValues}">
	속성: <c:out value="${h.key }" /> &nbsp;&nbsp;
	<%-- 값: <c:out value="${h.value }"/>--%>
	값:
	<c:forEach var="v" items="${h.value }">
		${v }<br>
		</c:forEach>
		<hr>

	</c:forEach>

	<br>
	<br> **collection data/array 출력
	<br>
	<%
		HashMap map = new HashMap();
	map.put("name", "tom");
	map.put("today", new Date());
	%>
	<c:set var="arr" value="<%=new int[] { 1, 2, 3, 4, 5 }%>" />
	<c:set var="m" value="<%=map%>" />
	<br> *배열자료 출력
	<br>
	<c:forEach var="i" items="${arr }" begin="0" end="4" step="2">
${i }&nbsp;
</c:forEach>
	<br> *map 출력*
	<br>
	<c:forEach var="k" items="${m }">
	${k.key }의 값은 ${k.value } <br>
	</c:forEach>

	<br> **문자열 분할
	<br>
	<c:forTokens var="animal" items="말, 호랑이, 댕댕이, 사자, 고양이" delims=","
		varStatus="bunho">
동물 : <c:out value="${bunho.count }) ${animal }" />
		<br>
	</c:forTokens>

	<hr>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	**숫자 및 날자 서식
	<br> 숫자 :
	<fmt:formatNumber value="12345.678" type="number" />
	<br> 숫자 :
	<fmt:formatNumber value="12345.678" type="currency" />
	<br> 숫자 :
	<fmt:formatNumber value="12345.678" type="percent" />
	<br> 숫자 :
	<fmt:formatNumber value="12345.678" pattern="#,##0.0" />
	<br>
	<br>
	<c:set var="now" value="<%=new Date()%>" />
	<c:out value="${now }" />
	<br> 날짜 및 시간 :
	<fmt:formatDate value="${now }" type="date" />
	<br> 날짜 및 시간 :
	<fmt:formatDate value="${now }" type="time" />
	<br> 날짜 및 시간 :
	<fmt:formatDate value="${now }" type="both" />
	<br> 날짜 및 시간 :
	<fmt:formatDate value="${now }" type="both" dateStyle="full"
		pattern="yyyy년 MM월 dd일" />
	<br>








</body>
</html>