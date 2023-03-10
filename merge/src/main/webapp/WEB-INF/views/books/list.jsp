<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 통합도서조회 -->
<section class="subpage_wrap">
	<div class="inner">
		<h2>통합도서조회</h2>
		<div class="contents">
		
		<c:set var="index" value="${1}" />
		
			<button class="btn1" onclick="<c:set var="index" value="${1}" />">11111</button>
			<button class="btn2" onclick="<c:set var="index" value="${2}" />">22222</button>


<div class="tab1 on">
				<%
				out.flush();
				RequestDispatcher dispatcher = request.getRequestDispatcher("new.jsp");
				dispatcher.include(request, response);
				%>
			</div>

			<div class="tab2">
				<%
				out.flush();
				RequestDispatcher dispatcher2 = request.getRequestDispatcher("popular.jsp");
				dispatcher2.include(request, response);
				%>
			</div>

		</div>
	</div>
</section>

<script>
	$('.btn1').on('click', function() {
		if (!$('.tab1').hasClass('on')) {
			$('.tab1').addClass('on')
			$('.tab2').removeClass('on')
		}
	});

	$('.btn2').on('click', function() {
		if (!$('.tab2').hasClass('on')) {
			$('.tab2').addClass('on')
			$('.tab1').removeClass('on')
		}
	});
</script>