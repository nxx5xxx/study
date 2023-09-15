<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<jsp:include page="topmenu.jsp" />
<section class="content">
	<h3 class="title">투표검수조회</h3>
<table>
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
		sql ="select v_name,v_jumin,m_no,v_time,v_confirm from tbl_vote_202005";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			String jumin = rs.getString("v_jumin");
			%>
			<tr>
				<td><%=rs.getString("v_name") %></td>
				<td><%="19"+rs.getString("v_jumin").substring(0,2)+"년"+rs.getString("v_jumin").substring(2,4)+"월"+rs.getString("v_jumin").substring(4,6)+"일" %></td>
				<td><%="만"+(120-Integer.parseInt(rs.getString("v_jumin").substring(0,2)))+"세" %></td>
				<td><%if(jumin.substring(6,7).equals("1")||jumin.substring(6,7).equals("3")){
					out.print("남");
					}else{
						out.print("여");
					}
					%></td>
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("v_time").substring(0,2)+":"+rs.getString("v_time").substring(2) %></td>
				<td><%=rs.getString("v_confirm").equals("Y")? "확인":"미확인" %></td>
			</tr>
			 <%
		}
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println("sub3오류발생"+e);
	}
	%>
</table>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>