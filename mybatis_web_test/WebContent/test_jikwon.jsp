<%@page import="pack.business.JikwonDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="processDaoTest" class="pack.business.ProcessDaoTest" />

<%
	ArrayList<JikwonDto> list = (ArrayList) processDaoTest.selectAll();
	ArrayList<JikwonDto> list2 = (ArrayList) processDaoTest.selectByJik();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	직원 자료
	<table border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직급</th>
			<th>성별</th>
			<th>급여</th>
		</tr>

		<c:forEach var="j" items="<%=list%>">
			<tr>
				<td>${j.jikwon_no }</td>
				<td>${j.jikwon_name }</td>
				<td>${j.jikwon_jik }</td>
				<td><c:if test="${j.jikwon_gen eq '남' }">M</c:if> <c:if
						test="${j.jikwon_gen eq '여' }">F</c:if></td>
				<td><fmt:formatNumber value="${j.jikwon_pay }" type="number" />
				</td>
			</tr>
		</c:forEach>
		<br>
		<c:set var="count" value="<%=list.size()%>" />
	</table>
	총인원수:
	<c:out value="${count }" />
	명

	<hr>

	<table border="1">
		<tr>
			<th>직급별</th>
			<th>인원수</th>
			<th>급여합</th>
			<th>급여평균</th>
		</tr>
	<c:forEach var="jik" items="<%=list2 %>">
		<tr>
			<td>${jik.jikwon_jik }</td>
			<td>${jik.count }</td>
			<td>${jik.sum }</td>
			<td><fmt:formatNumber value="${jik.avg }" pattern="#,###.0" /></td>
		</tr>		
	</c:forEach>
		
	</table>
</body>
</html>