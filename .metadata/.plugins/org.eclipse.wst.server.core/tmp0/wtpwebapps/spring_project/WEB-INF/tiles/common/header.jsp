<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 아이폰 css format 제거 -->
    <meta name="format-detection" content="telephone=no" />
    <link rel="shortcut icon" href="../../../resources/assets/images/favicon.ico">
    <title>영원한 도서관 - eternal library</title>

    <!-- style -->
    <link rel="stylesheet" href="../../../resources/css/common.css" />
    <link rel="stylesheet" href="../../../resources/css/main.css" />
    <link rel="stylesheet" href="../../../resources/css/sign.css" />

    <!-- script -->
    <script type="text/javascript" src="./js/jquery-3.6.3.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer type="text/javascript" src="./js/scripts.js"></script>
</head>

<body>
    <div class="wrap">
        <!-- header -->
        <section class="sign_area_pc">
            <p>
                <!-- <a href="">로그인</a>
                <span>|</span>
                <a href="">회원가입</a> -->
                김누구(abd***)님 환영합니다.
                <span>|</span>
                <a href="">로그아웃</a>
            </p>
        </section>
	
        <nav class="nav_area">
            <article class="inner">
                <a href="#">
                    <img class="logo" src="./assets/images/el_logo.png" alt="영원한 도서관 Logo" />
                </a>
			</article>
                <div class="menu-trigger">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>

                <ul>
                    <li><a href="#">도서관 소식</a></li>
                    <li><a class="active" href="#">이용안내</a></li>
                    <li><a href="#">통합도서조회</a></li>
                    <li><a href="#">희망도서신청</a></li>
                    <li><a href="#">나의 도서관</a></li>

                    <li class="sign_area_mob">
                        <p>
                            <!-- <a href="">로그인</a>
                            <span>·</span>
                            <a href="">회원가입</a> -->
                            김누구(abd***)님
                            <span>·</span>
                            <a href="">로그아웃</a>
                        </p>
                    </li>
                </ul>
    		</nav>



