<%@ include file ="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	try{
		sql = "insert into tbl_vote_202005 values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("jumin") );
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("mno"));
		pstmt.setString(4, request.getParameter("time"));
		pstmt.setString(5, request.getParameter("place"));
		pstmt.setString(6, request.getParameter("vote"));
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert('투표하기 정보가 정상적으로 등록 되었습니다!');
	location.href='./index.jsp';
</script>