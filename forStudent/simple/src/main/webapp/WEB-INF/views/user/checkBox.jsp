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
<h1>서비스에서 순회하여 하는방식</h1>
<form action="${path }/user/listEdit" method="post">
	<table>
		<tr>
			<th>체크박스</th>
			<th>순번</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<c:forEach items="${userList}" var="userDTO" varStatus="cnt">
			<tr>
				<!-- 실제로 사용할 인덱스번호 -->
				<td><input type="checkbox" name="index" value="${cnt.index }"></td>
				<td><input type="hidden" name="no" value="${userDTO.no }">
				<span>${cnt.count }</span>
				</td>
				<td><input type="text" name="id" value="${userDTO.id }"></td>
				<td><input type="text" name="passwd"  value="${userDTO.passwd }"></td>
				<td><input type="text" name="name" value="${userDTO.name }"></td>
			</tr>
		</c:forEach>
	</table>
	<input type="submit" value="정보변경" >
</form>
<br>
<a href="${path }/">홈으로</a>
</body>
</html>