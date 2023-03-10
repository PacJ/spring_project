<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 아이폰 css format 제거 -->
    <meta name="format-detection" content="telephone=no" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.ico">
    <title>영원한 도서관 - eternal library</title>

    <!-- style -->
    <link href="${pageContext.request.contextPath}/resources/css/sign.css"
    rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/main.css"
    rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/common.css"
    rel="stylesheet">

    <!-- script -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer type="text/javascript" src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
	<title><tiles:insertAttribute name = "title"/></title>
</head>
<body>
	<tiles:insertAttribute name = "header" />
	
	<div class = "container">
		<tiles:insertAttribute name = "content"/>
	</div>
	
	<div class = "footer">
		<tiles:insertAttribute name = "footer"/>
	</div>
</body>
</html>