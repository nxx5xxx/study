<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="${root }select">리스트조회_다오 , 서비스 없이 컨트롤러에서 깡으로</a><br>
<a href="${root }selectDAO">리스트조회_맵퍼 없이 다오, 서비스 , 모델을 사용하여</a>
</body>
</html>
