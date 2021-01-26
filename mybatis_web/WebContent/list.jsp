<%@page import="pack.business.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>

<%
ArrayList<SangpumDto> list = (ArrayList)processDao.selectAll(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	**상품자료 마이 바티스!**
	<p/>
	<a href="ins.html">상품추가</a>
	<br>
	<span style="color: red"><b>코드를 클릭하면 삭제, 품명을 클릭하면 수정 작업!</b></span>
	<br>
	<table border="1">
		<tr>
			<th>코드</th>
			<th>품명</th>
			<th>수량</th>
			<th>단가</th>
		</tr>
	<c:forEach var="s" items="<%=list %>">
	<tr>
		<td><a href='delete.jsp?code=${s.code}'>${s.code}</a></td>
		<td><a href='update.jsp?code=${s.code}'>${s.sang}</a></td>		
		<td>${s.su}</td>
		<td>${s.dan}</td>
	</tr>		
	</c:forEach>		
	</table>
</body>
</html>