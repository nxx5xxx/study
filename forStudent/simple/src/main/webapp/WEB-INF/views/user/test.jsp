<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디한개 갖고오기 테스트</title>
</head>
<body>
일단테스트
<ul>
	<li>${user.id }</li>
	<li>${user.passwd }</li>
	<li>${user.name} </li>
</ul>
<a href="${path }/">홈으로</a>
</body>
</html>