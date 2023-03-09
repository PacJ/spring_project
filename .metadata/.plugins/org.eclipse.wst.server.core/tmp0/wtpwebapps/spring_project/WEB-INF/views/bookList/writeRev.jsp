<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영원한 도서관</title>
<script>
$(document).ready(function() {
	$('#back').click(function() {
		console.log('뒤로');
		/* $('#reviewForm').attr('action', 'book.do');
		$('#reviewForm').submit(); */
		history.go(-1);
	});
	
/*  	$('#save').click(function() {
		console.log('저장');
	 	$('#contentInput').val($('[name=reviewContents]').val()); 
		$('#reviewForm').attr('action', 'writeRev.do').submit();
	});  */
});
</script>
</head>


<form name="frm" id="reviewForm" action="writeRev.do" method="post" >
	<table>
		<tr>
			<td>작성자</td>
			<td>
			<input type="hidden" name="userId" value="${sessionScope.authInfo.userId }" />
			<input type="text" readonly="readonly" name="userName" value="${sessionScope.authInfo.userName }" />
			</td>
		</tr>
		
		
		<tr>
			<td>별점 남기기</td>
			<!-- <input type="hidden" name=starNum /> -->
		</tr>
		
		<tr>
			<td>내용</td>
		<!-- 	<td><textarea rows="13" style="width:100%" name="reviewContents"></textarea></td>
			<input type="hidden" name = "revContent" id="contentInput" /> -->
		</tr>
		
		<div>
			<input type="button" id="back" value="뒤로" />
			<input type="submit" id="save" value="저장" />
		</div>
	</table>
</form>