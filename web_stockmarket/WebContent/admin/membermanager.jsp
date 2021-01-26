<%@page import="member.MemberDto"%>
<%@page import="member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="memberMgr" class="member.MemberMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-회원관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<h2>** 관리자 - 전체 회원관리 **</h2>
<div style="text-align: center;">
<%@ include file="admin_top.jsp" %>
</div>

<table style="width: 90%">
  <tr style="background-color: cyan">
  	<th>아이디</th><th>회원명</th><th>이메일</th><th>전화</th>
  </tr>
  <%
  ArrayList<MemberDto> list = memberMgr.getMemberAll(); 
  for(MemberDto m:list){
  %>
  <tr style="text-align: center;">
  	<td><%=m.getId() %></td>
  	<td><%=m.getName() %></td>
  	<td style="text-align: left;"><%=m.getEmail() %></td>
  	<td><%=m.getPhone() %></td>
  </tr>
  <%	  
  }
  %>
</table>
<br>
<div style="text-align:center;">
<a href="admin_index.jsp" >[메인으로]</a>
</div>
<%@ include file="admin_bottom.jsp" %>

</body>
</html>






