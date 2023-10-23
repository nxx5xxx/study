<%@ include file ="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<link rel="stylesheet" href="common.css" >
</head>
<body>
<jsp:include page="header.jsp"/>
<section class="content">
<h2 class="content_title">투표하기</h2>
	<form id="frm" action="./sub2_suc.jsp">
		<table class="content_tb">
			<tr>
				<td>주민번호</td>
				<td class="sub2_td"><input type="text" name="jumin" id="jumin"> 예 : 8906153154726</td>
			</tr>
			<tr>
				<td>성명</td>
				<td class="sub2_td"><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>투표번호</td>
				<td class="sub2_td">
				<select name="mno" id="mno">
				<option selected="selected"></option>
				<option value="1">[1]김후보</option>
				<option value="2">[2]이후보</option>
				<option value="3">[3]박후보</option>
				<option value="4">[4]조후보</option>
				<option value="5">[5]최후보</option>
				</select></td>
			</tr>
			<tr>
				<td>투표시간</td>
				<td class="sub2_td"><input type="text" name="time" id="time"></td>
			</tr>
			<tr>
				<td>투표장소</td>
				<td class="sub2_td"><input type="text" name="place" id="place"></td>
			</tr>
			<tr>
				<td>유권자확인</td>
				<td class="sub2_td"><input type="radio" name="vote" id="yes" value="Y"><label for="yes">확인</label>
				<input type="radio" name="vote" id="no" value="N"><label for="no" >미확인</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="테스트">
				<input type="button" value="투표하기" onclick="frm_submit()">
				<input type="button" value="다시하기" onclick="frm_reset()"></td>
			</tr>
		</table>
	</form>
</section>
<script>
function frm_submit(){
	let frm = document.getElementById('frm');
	if(frm.jumin.value.length==0){
		alert('주민번호가 입력되지 않았습니다!')
		jumin.focus();
		return false;
	}
	if(frm.name.value==''){
		alert('성명이 입력되지 않았습니다!');
		name.focus();
		return false;
	}
	if(frm.mno.value==''){
		alert('후보번호가 선택되지 않았습니다!');
		mno.focus();
		return false;
	}
	if(frm.time.value==''){
		alert('투표시간이 입력되지 않았습니다!');
		time.focus();
		return false;
	}
	if(frm.place.value==''){
		alert('투표장소가 입력되지 않았습니다!')
		place.focus();
		return false;
	}
	if(frm.place.value!='제1투표장'&&frm.place.value!='제2투표장'){
		alert('투표장소가 잘못 입력되었습니다');
		place.focus();
		return false;
	}
	if(frm.vote.value==''){
		alert('유권자확인이 선택되지 않았습니다!');
		vote.focus();
		return false;
	}
	frm.submit();
}

function frm_reset(){
	let frm = document.getElementById('frm');
	alert('정보를 지우고 처음부터 다시합니다!')
	frm.reset();
	jumin.focus();
}
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>