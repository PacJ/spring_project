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
    
	<title><tiles:insertAttribute name = "title"/></title>
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
	<%-- <link href="<c:url value = "/resources/css/bootstrap.min.css"/> rel = "stylesheet" > --%> <!-- 다운 받아서 넣는 것을 추천! -->
</head>
<body>
	<tiles:insertAttribute name = "header" />
	<%-- <div class = "jumbotron" align = "center">
		<div class = "container">
			<h1 class = "display-3"><tiles:insertAttribute name = "heading"/></h1>
			<p><tiles:insertAttribute name = "subheading"/>
		</div>
	</div> --%>
	
	<div class = "container">
		<tiles:insertAttribute name = "content"/>
	</div>
	
	<div class = "footer">
		<tiles:insertAttribute name = "footer"/>
	</div>
</body>
</html>