<%@ include file ="db.jsp" %>
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
<jsp:include page="header.jsp"/>
<section class="content">
	<h2 class="content_title">후보조회</h2>
		<table class="content_tb">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>소속정당</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>지역구</td>
				<td>대표전화</td>
			</tr>
			<%
				sql="select m_no,m_name,p_name,"+
					    "CASE WHEN p_school='1' then '고졸' " +
					    "WHEN p_school='2' then '학사' "+
					    "WHEN p_school='3' then '석사' "+
					    "WHEN p_school='4' then '박사' "+
					    "END as p_school, "+
					    "substr(m_jumin,0,6)||'-'||substr(m_jumin,6) as m_jumin,"+
					    "m_city,"+
					    "trim(p_tel1)||'-'||p_tel2||'-'||p_tel3 as p_tel "+
					    "from tbl_member_202005 m , tbl_party_202005 p  where m.p_code=p.p_code";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					%>
			<tr>
				<td><%= rs.getString("m_no") %></td>
				<td><%= rs.getString("m_name") %></td>
				<td><%= rs.getString("p_name") %></td>
				<td><%= rs.getString("p_school") %></td>
				<td><%= rs.getString("m_jumin") %></td>
				<td><%= rs.getString("m_city") %></td>
				<td><%= rs.getString("p_tel") %></td>
			</tr>					
					<%
				}
			%>
		</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>