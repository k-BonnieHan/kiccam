<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String memid = (String)session.getAttribute("idKey");
String log = "";

if(memid == null)
	log = "<a href='../member/login.jsp'>로그인</a>";
else
	log = "<a href='../member/logout.jsp'>로그아웃</a>";

String mem = "";
if(memid == null)
	mem = "<a href='../member/register.jsp'>회원가입</a>";
else
	mem = "<a href='../member/mypage.jsp'>마이 페이지</a>";
%>
<p>
  	<%=log %> | 
  	<%=mem %> | 
  	<a href="productlist.jsp">주식 상품</a> | 
  	<a href="orderlist.jsp">입찰 내역</a>
</p>  	