<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크박스변경하기</title>
</head>
<body>
<table>
	<tr>
		<th>체크박스</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
	</tr>
	<c:forEach items="${userList}" var="userDTO" varStatus="cnt">
		<tr>
			<td><input type="checkbox"></td>
			<td><input type="text" value="${userDTO.id }"></td>
			<td><input type="text" value="${userDTO.passwd }"></td>
			<td><input type="text" value="${userDTO.name }"></td>
		</tr>
	</c:forEach>
</table>
<input type="button" value="정보변경" >
<br>
<a href="${path }/">홈으로</a>
</body>
</html>