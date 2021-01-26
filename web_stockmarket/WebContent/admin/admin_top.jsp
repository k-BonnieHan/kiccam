<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String adminId = (String)session.getAttribute("adminKey");
if(adminId == null){
	response.sendRedirect("adminlogin.jsp");
}
%>
<p>
<h3>
 <a href="../index.jsp">홈페이지</a> |
 <a href="adminlogout.jsp">로그아웃</a> |
 <a href="membermanager.jsp">회원관리</a> |
 <a href="productmanager.jsp">상품관리</a> |
 <a href="ordermanager.jsp">입찰관리</a>
</h3>
</p>