<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="pack.business.SangpumDto"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%
processDao.upData(bean); //mybatis에서 upData프로세스를 호출한당.
response.sendRedirect("list.jsp");
%>
