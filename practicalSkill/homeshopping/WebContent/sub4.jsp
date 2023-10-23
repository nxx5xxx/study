<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
<link rel="stylesheet" href="common.css" >
</head>
<body>
<jsp:include page="./header.jsp"/>
<section class="content">
	<h2 class="content_title">후보조회</h2>
		<table class="content_tb">
			<tr>
				<td>후보자등수</td>
				<td>성명</td>
				<td>총투표건수</td>
			</tr>
				<%
				try{
				sql="select m.m_no,m.m_name,count(v.m_no)as count_no from tbl_vote_202005 v,tbl_member_202005 m where v.m_no=m.m_no and v.v_confirm!='N' group by v.m_no,m.m_no,m.m_name order by count_no desc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					%>
					<tr>
					<td><%=rs.getString("m_no") %></td>
					<td><%=rs.getString("m_name") %></td>
					<td><%=rs.getString("count_no") %></td>
					
					</tr>
					
					<%
				}
				
				rs.close();
				pstmt.close();
				conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
				%>
		</table>
</section>
<jsp:include page="./footer.jsp"/>
</body>
</html>