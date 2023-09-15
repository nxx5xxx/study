<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<jsp:include page="topmenu.jsp" />
<section class="content">
	<h3 class="title">투표검수조회</h3>
	<table>
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>총투표건수</td>
		</tr>
	<%
	try{
		sql ="select b.m_no , b.m_name, count(*) as total from tbl_vote_202005 a , tbl_member_202005 b where a.m_no=b.m_no and a.v_confirm='Y'  group by a.m_no,b.m_no,b.m_name order by total desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			%> 
			<tr>
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("m_name") %></td>
				<td><%=rs.getString("total") %></td>
			
			</tr>
			<%
		}
		
	}catch(Exception e){
		System.out.println("서브4에러발생"+e);
	}
	
	
	%>
	</table>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>