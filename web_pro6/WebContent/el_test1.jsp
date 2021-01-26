<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
환영합니다<br>
<%
if(request.getParameter("name")==null){
%>
	<jsp:forward page="el_test1.html" />
<%	
}
%>

jsp 기능으로 출력 : <%=request.getParameter("name") %>
<br>
jsp 기능으로 출력 : <% out.println(request.getParameter("name")); %> <br>
EL 사용: ${ param.name}
</body>
</html>