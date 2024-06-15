<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	db연결테스트  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<br>
<ul>
	<li><a href="${path }/user/test?id=test1">getUserTest</a></li>
	<li>testOk</li>
	
</ul>
</body>
</html>
