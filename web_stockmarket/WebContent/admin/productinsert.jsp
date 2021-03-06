<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:상품추가</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body style="margin-top: 20px">
<%@include file="admin_top.jsp" %>

<form action="productproc.jsp?flag=insert" 
		enctype="multipart/form-data" method="post">
<table style="width: 90%">
  <tr>
  	<th colspan="2">** 상품 등록 **</th>
  </tr>
  <tr>
  	<td>상품명</td>
  	<td><input type="text" name="name"></td>
  </tr>
  <tr>
  	<td>시작가</td>
  	<td><input type="text" name="price"></td>
  </tr>
  <tr>
  	<td>설 명</td>
  	<td><textarea rows="5" cols="60" name="detail"></textarea> </td>
  </tr>
  <tr>
  	<td>재고량</td>
  	<td><input type="text" name="stocks"></td>
  </tr>
  <tr>
  	<td>이미지</td>
  	<td><input type="file" name="image" size="40"></td>
  </tr>
  <tr>
  	<td colspan="2" style="text-align: center;">
  	    <br><br>
  		<input type="submit" value="상품 등록">
  		<input type="reset" value="새로 입력">
  		<input type="button" value="이전으로" onclick="history.back()">
  	</td>
  </tr>
</table>
</form>

<%@include file="admin_bottom.jsp" %>
</body>
</html>