<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rock All Host에 오신걸 환영합니다.</title>
<%@ include file="../include/header.jsp" %>

<link href="${path}/summernote/summernote.css" rel="stylesheet">
<script src="${path}/summernote/summernote.js"></script>
<script>
$(function() {
	$("#btnSave").click(function() {
		var writer = $("#writer");
		var subject = $("#subject");
		var content = $("#content");
		var re_position = $("#re_position");
		var r_area = $("#r_area");
		var id = $("#id");
		
		if(writer.val() == "") {
			alert("이름을 입력하세요");
			writer.focus();
			return;
		} if(subject.val() == "") {
			alert("제목을 입력하세요");
			email.focus();
			return;		
		} if(content.val() == "") {
			alert("내용을 입력하세요");
			content.focus();
			return;
		} if(re_position.val() == "0"){
			alert("포지션을 선택하세요");
			position.focus();
			return;
		} if(r_area.val() == "0"){
			alert("활동지역을 선택하세요");
			area.focus();
			return;
		}
		document.form1.submit();
	});
	
	$("#btnList").click(function(){
		location.href="${path}/seek/list.do";
	}); 
	$("#content").summernote({
		height : 150,
		width : 600
	});
});

</script>
<style type="text/css">
#seek_div_title{
background-color: black;
height: 145px;
color: white;
text-shadow: 1px 2px 1px gray;
text-align: center;
margin-top: 23px;
}

#seek_write select{
width: 400px;
height: 30px;
}
#seek_write_button{
text-align: center;
}

</style>
</head>
<body>
<%@ include file="../main/nav.jsp" %>
<br>
     <div id="seek_div_title" ><br>
     <h1>밴드 구직</h1>
     <h6>구직글 작성하기</h6>
     </div>
<form name="form1" method="post" action="${path}/seek/insert.do">
  <div id="seek_write"> 
<table border="1" style="width: 100%" class="table table-striped">
	<input type="hidden" name="id" id="id" value="${sessionScope.id}">
	<tr>
		<td style="width: 300px;">제목</td>
		<td><input name="subject" id="subject" size="200"></td>
	</tr>
	<tr>
		<td>기본정보</td>
		<td>
			<select name="re_position" id="re_position">
				<option value="0">-- 희망포지션 --</option>
				<option value="1">보컬</option>
				<option value="2">드럼</option>
				<option value="3">일렉기타</option>
				<option value="4">기타</option>
				<option value="5">베이스</option>
				<option value="6">키보드</option>
			</select><br>
			<select name="r_area" id="r_area">
				<option value="0">-- 활동지역 --</option>
				<option value="1">서울</option>
				<option value="2">경기</option>
				<option value="3">강원</option>
				<option value="4">충청북도</option>
				<option value="5">충청남도</option>
				<option value="6">전라북도</option>
			</select><br>
		</td>
	</tr>
	<tr>
		<td>본문</td>
		<td>
			<textarea rows="7" cols="199" name="content" id="content"></textarea>
		</td>
	</tr>
</table>
</div>
 		<div id="seek_write_button">
			<input type="hidden" name="type" value="2">
			<input type="button" value="확인" id="btnSave" class="btn">
			<input type="button" id="btnList" value="목록" class="btn">
	    </div>
</form>
</body>
</html>