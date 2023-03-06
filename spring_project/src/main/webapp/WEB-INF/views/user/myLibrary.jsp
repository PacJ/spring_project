<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 도서관</title>
</head>
<body>
	<p>My Library!</p>
	<a href="../home.do">홈페이지로</a>
	<p>${sessionScope.authInfo.userName}</p>
	<p>${sessionScope.UserDTO.userAge }</p>
	<p>${userDTO.userAge }</p>
	
	
</body>
</html>