<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.star-rating-svg.js" ></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/star-rating-svg.css">

<script>
	$(document).ready(function() {
		$("#update").click(function() {
			console.log("hello world");
		});
		
	    $(".my-rating").starRating({
	        starSize: 25,
	        callback: function(currentRating, $el){
	        }
	    });
	    
		$('#back').click(function() {
			/* $('#reviewForm').attr('action', 'book.do');
			$('#reviewForm').submit(); */
			history.go(-1);
		});
		
	  	$('#save').click(function() {
			$('[name=reviewContent]').val($('[name=reviewContent]').val().replace(/\n/gi, '<br/>'));	
			$('#reviewForm').attr('action', 'writeRev.do').submit();
		});  
	  	
	    $(".my-rating").starRating({
	        starSize: 25,
	        callback: function(currentRating, $el){
	            // make a server call here
	        }
	    });
	    
	    $("#reviewForm").submit(function() {
	    	console.log("submitted");
	    });
	    
	    $("#deleteReview").click(function() {
	    	
	    	console.log("deleted");
	    });
    });
</script>

<c:set var = "contextPath" value = "${pageContext.request.contextPath}"/>

<!-- ISBN값 -->
<input type = "hidden" name = "isbn" value="isbn" />

	<!-- 후기 리스트 -->
<!-- <table>
	<tr>
		<th>NO.</th>
		<th>별점</th>
		<th>작성자</th>
		<th>내용</th>
	</tr> -->
	
	<c:forEach items = "${revList}" var = "dto">
<%-- 		<tr>
			<td>${dto.reviewKeynum}</td> --%>
			<c:url var = "path" value = "review.do">
				<c:param name = "currentPage" value= "${pv.currentPage}"/>
				<c:param name = "num" value = "${dto.reviewKeynum}"/>
			</c:url>
				<p>리뷰번호 ${dto.reviewKeynum }</p>
<%-- 			<td class="my-rating">${dto.starNum}</td>
			<td>${dto.userId}</td>
			<td>${dto.reviewContents}</td> --%>
		<!-- 	<td> -->
	           	<div class="review_area">
	                   <h4 class="review_title">도서 리뷰 <span>(000건)</span></h4>
	                   <div class="review_box">
	                       <p class="book_star star_5">
	                       ${dto.starNum}
	                       </p>
	                       <p class="review_text">
	                      	 ${dto.reviewContents}
	                           <!-- 대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다. 모든 국민은 인간으로서의 존엄과 가치를 가지며, 행복을 추구할 권리를 가진다. 국가는 개인이 가지는
	                           불가침의 기본적 인권을 확인하고 이를 보장할 의무를 진다. -->
	                           <br />
	                           <span>작성자: ${dto.userId}&nbsp;&nbsp;·&nbsp;&nbsp;${dto.reviewDate }</span>
	                           <c:if test="${sessionScope.authInfo != null && sessionScope.authInfo.userId == dto.userId }">
	                           <form method = "get" action = "delete.do">
		                           <span>&nbsp;&nbsp;·&nbsp;&nbsp;<a href="" id="editReview">수정</a></span>
		                           <span>&nbsp;&nbsp;·&nbsp;&nbsp;
		                           <input type="hidden" name="reviewKeynum" value="${dto.reviewKeynum }" />
		                           <button type="submit">삭제</button>
		                           <!-- <a href="delete.do" name="reviewKeynum" id="deleteReview">삭제</a></span> -->
	                           </form>
	                           </c:if>
	                       </p>
	                   </div>
                 </div>
          <!--    </td> -->
			<td>
			<!-- 수정 -->
			<c:if test="${sessionScope.authInfo != null && sessionScope.authInfo.userId == dto.userId }">
				<form id = "updateForm" method = "post" action = "update.do">
                        <div class="review_box">
                                <ul>
                                    <li>
                                        <h4>리뷰 수정<span class="review_mod_back">[수정 취소]</span></h4>
                                    </li>
                                    <li>
                                        <select>
                                            <option value="5">⭐⭐⭐⭐⭐</option>
                                            <option value="4">⭐⭐⭐⭐</option>
                                            <option value="3">⭐⭐⭐</option>
                                            <option value="2">⭐⭐</option>
                                            <option value="1">⭐</option>
                                        </select>
                                    </li>
                                    <li>
                                        <!-- cols="50" rows="3" -->
                                        <textarea class="review_input" placeholder="리뷰를 작성해주세요."></textarea>
                                        <button type="submit">수정</button>
                                    </li>
                                </ul>
                        </div>
				</form>
			</c:if>
	</c:forEach>
<!-- </table> -->
		
		<!-- 후기 작성 -->
<form name="frm" id="reviewForm" action="writeRev.do" method="post">
    <ul>
        <li>
            <h4>리뷰 작성</h4>
            <input type="hidden" name="userId" value="${sessionScope.authInfo.userId }" />
			<input type="hidden" name="userName" value="${sessionScope.authInfo.userName }" />
        </li>
        <li>
            <select name="starNum">
                <option value="5">⭐⭐⭐⭐⭐</option>
                <option value="4">⭐⭐⭐⭐</option>
                <option value="3">⭐⭐⭐</option>
                <option value="2">⭐⭐</option>
                <option value="1">⭐</option>
            </select>
        </li>
        <li>
            <!-- cols="50" rows="3" -->
             <textarea class="review_input" name="reviewContents" placeholder="리뷰를 작성해주세요."></textarea>
             <button type="submit">등록</button>
         </li>
     </ul>
</form>
<%-- <form name="frm" id="reviewForm" action="writeRev.do" method="post" >
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
			<td>
				<div class="my-rating">
					<select name="starNum">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> 
				</div>
			</td>
		</tr>
		
		<tr>
			<td>내용</td>
		 	<td><textarea rows="13" style="width:100%" name="reviewContents"></textarea></td>
		</tr>
		
		<tr>
			<td>
				<div>
					<input type="button" id="back" value="뒤로" />
					<input type="submit" id="save" value="저장" />
				</div>
			</td>
		</tr>
	</table>
</form> --%>
				<!-- 최종 html -->
<!-- 		<div class="pagination_area">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" style="cursor:no-drop">
                                    <img style="opacity: .2;" src="./assets/images/first.svg">
                                    <span>first</span>
                                </a>
                            </li>
                            <li class="page-item disabled">
                                <a class="page-link" style="cursor:no-drop">
                                    <img style="opacity: .2;" src="./assets/images/prev.svg">
                                    <span>prev</span>
                                </a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" style="cursor:pointer;">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" style="cursor:pointer;">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" style="cursor:pointer;">
                                    <img style="opacity: .5;" src="./assets/images/next.svg">
                                    <span>next</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" style="cursor:pointer;">
                                    <img style="opacity: .5;" src="./assets/images/last.svg">
                                    <span>last</span>
                                </a>
                            </li>
                      </ul>
                </div> -->
			 <div class="pagination_area">
				<ul class="pagination">
					<!-- 처음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.startPage >1}">
							<li class="page-item disabled">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=1" >
									<img style="opacity: .5;" src="/myapp/resources/assets/images/first.svg">
									<span>first</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<a class="page-link" style="cursor: no-drop">
									<img style="opacity: .2;" src="/myapp/resources/assets/images/first.svg">
									<span>first</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose> 
				</div>
					<!-- 처음 출력 끝 -->				

					<!-- 이전 출력 시작 -->
					<c:choose>
						<c:when test="${pv.startPage >1}">
							<li class="page-item disabled">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${pv.startPage-pv.blockPage}">
									<img style="opacity: .5;" src="/myapp/resources/assets/images/prev.svg">
									<span>prev</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<a class="page-link" style="cursor: no-drop">
									<img style="opacity: .2;" src="/myapp/resources/assets/images/prev.svg">
									<span>prev</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<!-- 이전 출력 끝 -->

					<!-- 페이지번호 출력 시작 -->
					<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
						<c:choose>
							<c:when test="${i==pv.currentPage}">
								<li class="page-item active">
									<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${i}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 페이지번호 출력 끝 -->

					<!-- 다음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.endPage < pv.totalPage}">
							<li class="page-item">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${pv.startPage + pv.blockPage}">
									<img style="opacity: .5;" src="/myapp/resources/assets/images/next.svg">
									<span>next</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" style="cursor: no-drop">
									<img style="opacity: .2;" src="/myapp/resources/assets/images/next.svg">
									<span>next</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<!-- 다음 출력 끝 -->
		
					<!-- 마지막 출력 시작 -->
					<c:choose>
						<c:when test="${pv.endPage < pv.totalPage}">
							<li class="page-item">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book.do?currentPage=${pv.totalPage}">
								<img style="opacity: .5;" src="/myapp/resources/assets/images/last.svg">
								<span>last</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" style="cursor: no-drop">
								<img style="opacity: .2;" src="/myapp/resources/assets/images/last.svg">
								<span>last</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<!-- 마지막 출력 끝 -->

