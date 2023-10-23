<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
db테스트
<ul>
<%
	try{
		sql = "select * from test1";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
%>
	<li><%= rs.getString("id") %></li>
	<li><%= rs.getString("pw") %></li>
<%			
		}
	}catch(Exception e){
		
	}
%>
</ul>
</body>
</html>