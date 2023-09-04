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
	<h3 class="title">투표하기</h3>
	<form action="sub2_succes.jsp" method="post" id="formT">
		<table>
			<tr>
				<td><label for="zumin">주민번호</label></td><td><input type="text" name="zumin" id="zumin"> 예 : 8906153154726</td>
			</tr>
			<tr>
				<td><label for="name">성명</label></td><td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td><label for="numb">투표번호</label></td><td>
				<select name="numb" id="numb">
					<option disabled selected></option>
					<option value="1" >[1]김후보</option>
					<option value="2" >[2]이후보</option>
					<option value="3" >[3]박후보</option>
					<option value="4" >[4]조후보</option>
					<option value="5" >[5]최후보</option>
				</select>
			</tr>
			<tr>
				<td><label for="time">투표시간</label></td><td><input type="text" name="time" id="time"></td>
			</tr>
			<tr>
				<td><label for="addr">투표장소</label></td><td><input type="text" name="addr" id="addr"></td>
			</tr>
			<tr>
				<td>유권자확인</td><td><input type="radio" name="chk" id="chk1" value="Y"><label for="chk1">확인</label>
				<input type="radio" name="chk" id="chk2" value="N"><label for="chk2" >미확인</label>
				</td>
			</tr>
			<tr>
			<td colspan="2"><input type="button" value="투표하기" style="margin-right:10px" onclick="sub2()"><input type="reset" value="다시하기"></td>
			</tr>
		</table>
		<script>
		function sub2(){
			//주민번호비어있을시
			if(document.getElementById('zumin').value.length==0){
				alert('주빈번호가 입력되지 않았습니다!');
				return ;
			}
			if(document.getElementById('name').value.length==0){
				alert('성명이 입력되지 않았습니다!');
				return ;
			}
			if(document.getElementById('numb').value==''){
				alert('후보번호가 선택되지 않았습니다!');
				return;
			}
			if(document.getElementById('time').value.length==0){
				alert('투표시간이 입력되지 않았습니다!');
				return;
			}
			if(document.getElementById('addr').value.length==0){
				alert('투표장소가 입력되지 않았습니다!');
				return;
			}
			if(document.querySelector('input[name="chk"]:checked')==null){
				alert('유권자확인이 선택되지 않았습니다!');	
				return;
			}
			document.getElementById('formT').submit();
		}
		</script>
	</form>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>