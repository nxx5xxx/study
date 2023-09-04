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
	<h3 class="title">후보조회</h3>
<table>
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
	try{
		sql = "select m_no,m_name,p_name,p_school,"
			+"m_jumin,m_city,p_tel1,p_tel2,p_tel3 "
			+"from tbl_member_202005 a , tbl_party_202005 b where a.p_code = b.p_code";
		pstmt =conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			//m_no,m_name,b.p_code,p_school,m_jumin,m_city,p_tel1,p_tel2,p_tel3
		%>
			<tr>
			<td><%=rs.getString("m_no") %></td>
			<td><%=rs.getString("m_name") %></td>
			
			<td><%=rs.getString("p_name") %></td>
			<td><%switch(rs.getString("p_school")){
			case "1":
				out.print("고졸");
				break;
			case "2":
				out.print("학사");
				break;
			case "3":
				out.print("석사");
				break;
			case "4":
				out.print("박사");
				break;
			}%></td>
			<td><%=rs.getString("m_jumin") %></td>
			<td><%=rs.getString("m_city") %></td>
			<td><%=rs.getString("p_tel1") %>-
				<%=rs.getString("p_tel2") %>-
			<%=rs.getString("p_tel3") %></td>
			
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
<jsp:include page="footer.jsp" />
</body>
</html>