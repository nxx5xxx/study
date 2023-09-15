<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test1테이블</title>
</head>
<body>
	<h2>테이블</h2>
	<table>
		<tr>
			<th>ID</th><th>NAME</th><th>PW</th>
		</tr>
		<c:forEach items="${list }" var="list" varStatus="cnt">
		<tr>
			<td>${list.id }</td><td>${list.name }</td><td>${list.pw }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>