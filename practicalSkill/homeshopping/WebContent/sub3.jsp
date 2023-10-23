<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
<link rel="stylesheet" href="common.css" >
</head>
<body>
<jsp:include page="./header.jsp"/>
<section class="content">
	<h2 class="content_title">투표검수조회</h2>
		<table class="content_tb">
			<tr>
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<%
			try{
			sql="select v_name,19||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일생' as v_jumin,"+
				    "'만 '||to_char(120-substr(v_jumin,0,2))||'세' as age, CASE WHEN substr(v_jumin,7,1)='1' THEN '남' ELSE '여' END as sex,m_no,"+
				    "substr(v_time,0,2)||':'||substr(v_time,3,2) as time, CASE WHEN v_confirm='Y' THEN '확인' ELSE '미확인' END as vote"+
				     " from tbl_vote_202005 where v_area='제1투표장'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				%>
			<tr>
				<td><%=rs.getString("v_name")%></td>	
				<td><%=rs.getString("v_jumin")%></td>	
				<td><%=rs.getString("age")%></td>	
				<td><%=rs.getString("sex")%></td>	
				<td><%=rs.getString("m_no")%></td>	
				<td><%=rs.getString("time")%></td>	
				<td><%=rs.getString("vote")%></td>
			</tr>
				<%
			}
			rs.close();
			pstmt.close();
			conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}%>				
		</table>
</section>
<jsp:include page="./footer.jsp"/>
</body>
</html>