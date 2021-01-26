<%@page import="member.MemberDto"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="memberMgr" class="member.MemberMgr" />

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");

MemberDto dto = memberMgr.getMember(id);

if(dto == null) {
	response.sendRedirect("../guest/guest_index.jsp");
	return; 
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	
	document.getElementById("btnHome").addEventListener("click", funcHome, false);
}


function funcHome(){
	location.href="../guest/guest_index.jsp";
}
</script>
</head>
<body>
<table "width:90%">
  <tr style="background-color: navy;">
  	<td colspan="2" style="color: white">
  		<b><%=dto.getName() %></b> 회원님의 정보를 확인합니다.
  	</td>
  </tr>
  <tr>
  	<td>아이디</td>
  	<td><%=dto.getId() %></td>
  </tr>
  <tr>
  	<td>비밀번호</td>
  	<td>
  		<%=dto.getPasswd()%>
  	</td>
  </tr>
  <tr>
  	<td>회원명</td>
  	<td>
  		<%=dto.getName()%>
  	</td>
  </tr>
  <tr>
  	<td>이메일</td>
  	<td>
  		<%=dto.getEmail()%>
  	</td>
  </tr>
  <tr>
  	<td>전화번호</td>
  	<td>
  		<%=dto.getPhone()%>
  	</td>
  </tr>
  
  <tr>
  	<td>직업</td>
  	<td>
  		<%=dto.getJob()%>
  		  	</td>
  </tr>
  <tr>
  	<td colspan="2" style="text-align: center;">
  		
  		<input type="button" value="메인으로" id="btnHome">
  	</td>
  </tr>
</table>
</body>
</html>





