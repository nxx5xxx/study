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
<%
	try{
		sql = "select * from test1";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			%>
			<h5><%= rs.getString("id") %></h5>
			<h5><%= rs.getString("pw") %></h5>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>