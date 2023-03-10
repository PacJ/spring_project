<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#list').click(function() {
			$('#frm').attr('action', 'notice').submit();
		});
	});
</script>
</head>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- /myapp 현재프로젝트 경로 리턴 -->

<body>
	<div class="container">
		<table class="table  table-bordered">
			<tr>
				<th width="20%">작성자</th>
				<td>${dto.adminname}</td>
				<th width="20%">조회수</th>
				<td>${dto.readcount}</td>
			</tr>

			<tr>
				<th>작성일</th>
				<td colspan="3">${dto.regdate}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3">${dto.subject}</td>
			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3">
					<div>
						<img alt="" src=${srcImg}>
					</div>
					${dto.content}</a>
				</td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<c:if test="${!empty dto.upload_file}">
						<a href="contentdownload?num=${dto.num}">${fn:substringAfter(dto.upload_file,"_")} </a>
					</c:if>
					<c:if test="${empty dto.upload_file }">
						<c:out value="첨부파일 없음" />
					</c:if>
				</td>
			</tr>
		</table>
		<div class="text-center mt-5 mb-5">
			<form name="frm" id="frm" method="get">
				<input type="hidden" name="num" value="${dto.num}" />
				<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
				<input type="button" id="list" value="리스트" />
			</form>
		</div>
		
		<table>
			<tr>
				<th>다음글</th>
				<td colspan="3">
					<c:choose>
						<c:when test="${pn.nextnum==0}">
							<p>다음글이 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:url var="path" value="info">
								<c:param name="currentPage" value="${pv.currentPage}" />
								<c:param name="num" value="${pn.nextnum}" />
							</c:url>	
							<a href="${path}"> ${pn.nextsub}</a>		
						</c:otherwise>
					</c:choose>				
				</td>
			</tr>		
			<tr>
				<th>이전글</th>
				<td colspan="3">
					<c:choose>
						<c:when test="${pn.prenum==0}">
							<p>이전글이 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:url var="path" value="info">
								<c:param name="currentPage" value="${pv.currentPage}" />
								<c:param name="num" value="${pn.prenum}" />
							</c:url>
							<a href="${path}"> ${pn.presub}</a>		
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	
	</div>
