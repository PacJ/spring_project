<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>내 정보</p>
<table>
	<thead>나의 정보</thead>
	<tr>
		<td>이름</td>
		<td>${user.dto.userDTO.userId }</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${user.dto.userDTO.userAge }</td>
	</tr>
</table>
<a href="../home.do">홈페이지</a>
</body>
</html>