<%@page import="pack.business.GogekDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="processDao" class="pack.business.ProcessDao" />    

<%
request.setCharacterEncoding("utf-8");
String jikwon_no = request.getParameter("jikwon_no");
%>

<% 
ArrayList<GogekDto> glist = (ArrayList)processDao.selectGogek(jikwon_no);
String count = (String)processDao.selCount(jikwon_no);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 고객 자료 *</h2>
<table border="1">
	<tr>
		<th>번호</th><th>고객명</th><th>고객전화</th>
	</tr>
	
	<c:forEach var="g" items="<%=glist %>">
	<tr>
		<td>${g.gogek_no }</td>
		<td>${g.gogek_name }</td>
		<td>${g.gogek_tel }</td>
	</tr>	
	</c:forEach>
	<tr><td colspan="3">총인원수 : <%=count %></td></tr>
</table>
</body>
</html>