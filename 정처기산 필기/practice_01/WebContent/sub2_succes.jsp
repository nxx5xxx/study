<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; UTF-8");
	int sw = 0;
	try{
		sql="insert into tbl_vote_202005 values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("zumin"));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("numb"));
		pstmt.setString(4, request.getParameter("time"));
		pstmt.setString(5, request.getParameter("addr"));
		pstmt.setString(6, request.getParameter("chk"));
		sw = pstmt.executeUpdate();
		if(sw>0){
			System.out.println("sub2 정상삽입되었습니다");
		}
		pstmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println("sub2에서 에러발생"+e);
	}
response.sendRedirect("index.jsp"); %>
