<%@page import="pack.business.JikwonDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 직원자료 *</h2>
<table border="1">
	<tr>
		<th>사번</th><th>직원명</th><th>부서명</th><th>직급</th>
	</tr>
	<% 
	ArrayList<JikwonDto> jlist = (ArrayList)processDao.selectDataAll(); 
	%>
	<c:forEach var="j" items="<%=jlist %>">
	<tr>
		<td>${j.jikwon_no }</td>
		<td><a href='glist.jsp?jikwon_no=${j.jikwon_no}'>${j.jikwon_name }</a></td>
		<td>${j.buser_name }</td>
		<td>${j.jikwon_jik }</td>
	</tr>	
	</c:forEach>
</table>
</body>
</html>