<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="pack.business.SangpumDto"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%
processDao.insData(bean); //insData에서 mybatis를 호출한당.
response.sendRedirect("list.jsp");
%>

