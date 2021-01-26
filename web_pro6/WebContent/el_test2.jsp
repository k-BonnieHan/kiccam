<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
**EL의 연산자**<br>
\${3+4} -->${3+4 }<br>
\${3*4} -->${3*4 }<br>
\${5/4} -->${5/4 }, <%-- ${5 div 4}--%><br>
\${5/0} -->${5/0}<br>
\${5%4} -->${5%4 }, <%--${5 mod 4 } --%><br>
\${5>4} -->${5>4},${5 gt 4 }<br>
\${5<=4} -->${5<=4},${5 le 4 }<br>
\${5<=4 or 3>2} -->${5<=4 or 3>2 }<br>
\${5<=4 and 3>2} -->${5<=4 and 3>2 }<br>
<hr>
**EL의 내장객체**<br>
<%
request.setAttribute("aa", "air");
session.setAttribute("bb", "book");
application.setAttribute("cc", "cat");
//저장하고 불러오기 해보는 것이다.
%>

<% out.println(request.getAttribute("aa")); %>
<%= request.getAttribute("aa") %> ${requestScope.aa }<br>
<%= session.getAttribute("bb") %> ${sessionScope.bb }<br>
<%= application.getAttribute("cc") %> ${applicationScope.cc }<br>
<br>
jsp 내장 객체 header : <%=request.getHeader("host") %><br>
EL : ${header.host },${header["host"]} <br>
<%
ArrayList list = new ArrayList();
list.add("kor");
list.add("eng");
request.setAttribute("list", list);
%>
<%
list = (ArrayList)request.getAttribute("list");
out.println(list.get(0));
out.println(list.get(1));
%>
${list[0]}, ${list["1"]}
<br>
<p/>
html 문서로부터 자료 얻기 <br>
<a href="el_test2.html"> html call</a>
<br>
이름: ${param.irum }, ${param["irum"] }<br>
주소: ${paramValues.juso[0] } , ${paramValues.juso["1"]}
</body>
</html>