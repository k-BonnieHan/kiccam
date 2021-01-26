<%@page import="web_pro6.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	전통 :
	<%=request.getAttribute("man")%>
	<br> EL : ${requestScope.man}, ${man}
	<p />

	존통:
	<%
		Person p = (Person) request.getAttribute("person");
	%>
	<%=p.getName()%>
	<br> el: ${person.name }
	<p />

	${animal[0] } ${animal[1] } ${animal["2"]}

	<br>
<c:if test="${list != null }">
	<c:forEach var="a" items="${list }">
		${a[0] }, ${a[1] }, ${a[2] }
	</c:forEach>
	</c:if>
<br>
<c:if test="${list != null }">
	<c:forEach var="a" items="${list }">
		<c:forEach var="b" items="${a }">
			${b }
		</c:forEach>
	</c:forEach>
	</c:if>	
<br>	
<c:choose>
	<c:when test="${list eq null }">
	자료가 없어요
	</c:when>
	<c:otherwise>
	자료가 있어요
	</c:otherwise>
</c:choose>

<hr>
try ~ except 처리 <br>
<c:catch var="myErr">
 <%
 	int a = 10/3;
 	//int a = 10/0;
	out.println(a);
 %>
</c:catch>
<c:if test="${myErr != null }">
	에러 발생 : ${myErr.message}

</c:if> 
<br>
작업 계속
<br><br>
다른 문서 포함<br>
include 지시어 : <%@include file="poham.jsp" %><br>
jsp action tag : <jsp:include page="poham.jsp" />
jstl : <c:import url="poham.jsp"/>
<br>
<c:set var="url" value="https://www.naver.com"/>
<c:import url="${url }" var="myu"></c:import>
<c:out value="${url }"/>
<br>
<c:out value="${myu }"/>
</body>
</html>