<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/books.css">
<style type="text/css">
.hide {
	display: none;
}
</style>
<script>
	$(document).ready(function() {
		// 수정 클릭 시 수정창 나타남
		$('[id^="editReview_"]').click(function(event) {
		    event.preventDefault();
		    let revNum = this.id.split("_").pop();
		    $("[id^=review_" + revNum + "]").removeClass("hide");
		});

		// 수정취소 시 수정창 숨김
	    $('[id^="close_"]').click(function(event) {
	    	event.preventDefault();
	    	let revNum = this.id.split("_").pop();
	    	$("[id^=review_" + revNum + "]").addClass("hide");
	    });
	    
	    // 후기 작성 Form submit시 발생
	  	$("#reviewForm").submit(function(event) {
	  		//후기 작성 시 입력값이 없다면 팝업창 띄움.
	  	    if ($("textarea[name='reviewContents']").val() === '') {
		  	    event.preventDefault(); 
	  	        $(".popup>p").text("입력하신 내용이 없습니다.");
	  	        $(".popup_back").addClass("on");
	  	    }
	  		
	  		// 줄바꿈을 <br/>로 저장
	  	  $(this).find('[name=reviewContents]').val($(this).find('[name=reviewContents]').val().replace(/\n/gi, '<br/>'));
	  	});
	    
		// 팝업창 닫기
		$(".popup>button").click(function() {
		    console.log("closed");
		    $(".popup_back").removeClass("on");
		});
	    
	    // 수정 제출 시 줄바꿈 처리, 수정된 사항을 POST하고 reload
	  	$(".updateReview").submit(function(event) {
	  	  event.preventDefault(); // 제출 제한
	  	$(this).find('[name=reviewContents]').val($(this).find('[name=reviewContents]').val().replace(/\n/gi, '<br/>'));

	  	  let form = $(this);
	  	  let formData = form.serialize(); // form 내부의 기능들을 text String에 담는다.
	  	  let url = form.attr('action'); // form태그의 'action'값을 url에 담는다.
	  	  console.log(url);

	  	  $.ajax({
	  	    type: 'POST',
	  	    url: url,
	  	    data: formData,
	  	    success: function(response) {
	  	      location.reload();
	  	    },
	  	    error: function(xhr, status, error) {
	  	      alert('Error updating review');
	  	    }
	  	  });
	  	});
	    
	  	$('[id^="deleteReview_"]').click(function(event) {
	  		event.preventDefault();
			let revNum = this.id.split("_").pop();
			console.log(revNum);
			$("[id^=EditDeleteFrm_" + revNum +"]").attr('action', "delete").submit();
		});
    });
</script>
               <h4 class="book_title">${bldto.title }</h4>
                    <p class="book_sub">${bldto.author }<span></span>${bldto.publisher }</p>
                    <div class="book_info_area">
                        <img src="${bldto.thumbnail }" alt="책 표지" />
                        <p class="book_info_text">
                            ISBN : <span>${bldto.isbn }</span><br />
                            분류기호 : <span>${bldto.book_category }</span><br />
                            KDC 분류 : <span>문학</span><br />
                            출판일자 : <span>${bldto.pub_date }</span><br />
                            등록일자 : <span>${bldto.receive_date }</span>
                        </p>
                        <div class="book_state_area">
                            <p class="book_star star_4">
                                <span>${dto.starNum } (${pv.totalCount })</span>
                                <img src="./assets/images/star-full.svg" alt="star_full" />
                                <img src="./assets/images/star-full.svg" alt="star_full" />
                                <img src="./assets/images/star-full.svg" alt="star_full" />
                                <img src="./assets/images/star-full.svg" alt="star_full" />
                                <img src="./assets/images/star-full.svg" alt="star_full" />
                                <img src="./assets/images/star-none.svg" alt="star_none" />
                                <img src="./assets/images/star-none.svg" alt="star_none" />
                                <img src="./assets/images/star-none.svg" alt="star_none" />
                                <img src="./assets/images/star-none.svg" alt="star_none" />
                            </p>
                            <p class="book_state">
                                대출 : <span>${bldto.loan_state}</span>
                                예약 : <span>${bldto.borrow_state}</span>
                            </p>
                            <button>대출하기</button>
                            <!-- <button>예약하기</button>
                            <button disabled>대출/예약 불가</button> -->
                        </div>
                    </div>

                    <div class="book_info_cont">
                        <p>${bldto.contents }</p>
                    </div>  


<c:set var = "contextPath" value = "${pageContext.request.contextPath}"/>


		<!-- 후기 작성 -->
<div class="review_area">

	<form name="frm" id="reviewForm" action="writeRev" method="post">
	    <ul>
	        <li>
	            <h4>리뷰 작성</h4>
	            ${sessionScope.authInfo.user_id}
	            ${sessionScope.authInfo.user_name}
	            ${bldto.isbn }
	            
	            <input type="hidden" name="user_id" value="${sessionScope.authInfo.user_id}" />
				<input type="hidden" name="user_name" value="${sessionScope.authInfo.user_name}" />
				<!-- ISBN값 -->
				<input type = "hidden" name="isbn" value="${bldto.isbn }" />
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
	             <textarea id = "reviewText" class="review_input" name="review_contents" placeholder="리뷰를 작성해주세요."></textarea>
	             <button type="submit">등록</button>
	         </li>
	     </ul>
	</form>
</div>

	<!-- 후기 리스트 -->
<div class="review_area">
	<h4 class="review_title">도서 리뷰 <span>(${pv.totalCount }건)</span></h4>
	
		<!-- Controller에서 페이지를 GET할 때 pv로 PageDTO 객체를 넘겨주고, revList로 bookReviewDTO들의 List를 넘겨준다. -->
		<!-- revList에 있는 값마다 반복문을 돌려준다. var="dto"로 각 항목에 접근할 수 있게 한다. -->
		<c:forEach items = "${revList}" var = "dto">
			<c:url var = "path" value = "review">
				<c:param name = "currentPage" value= "${pv.currentPage}"/>
				<c:param name = "num" value = "${dto.reviewKeynum}"/>
			</c:url>
	                   <div class="review_box">
	                       <p class="book_star star_${dto.starNum}" >${dto.starNum}</p>
	                       <p class="review_text">
	                      	 ${dto.reviewContents}
	                           <br />
	                           <span>작성자: ${dto.userId}&nbsp;&nbsp;·&nbsp;&nbsp;${dto.reviewDate }</span>
	                           <c:if test="${sessionScope.authInfo != null && sessionScope.authInfo.userId == dto.userId }">
	                           <form id="EditDeleteFrm_${dto.reviewKeynum }" method = "POST" action = "/bookList/delete">
		                           <span>&nbsp;&nbsp;·&nbsp;&nbsp;<a href="" id="editReview_${dto.reviewKeynum }">수정</a></span>
		                           <input type="hidden" name="reviewKeynum" value="${dto.reviewKeynum }" />
		                           <span>&nbsp;&nbsp;·&nbsp;&nbsp;<a href="" id="deleteReview_${dto.reviewKeynum }">삭제</a></span>
		                           <!-- <button type="submit">삭제</button> -->
	                           </form>
	                           </c:if>
	                       </p>
                		</div>
	                   
			<!-- 수정 -->
			<c:if test="${sessionScope.authInfo != null && sessionScope.authInfo.userId == dto.userId }">
				<form id = "review_${dto.reviewKeynum}" class="hide updateReview" method = "POST" action = "update">
			                    <div class="review_box">
			                        <ul>
						                <li>
						                    <h4>리뷰 수정
						                    	<span class="review_mod_back">
						                    	<button type="button" id="close_${dto.reviewKeynum}">[수정 취소]</button>
						                    	</span>
						                    </h4>
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
						                    <textarea class="review_input" placeholder="리뷰를 작성해주세요." name="reviewContents">${dto.reviewContents}</textarea>
						                    <input type="hidden" name="reviewKeynum" value=${dto.reviewKeynum } />
						                    <button type="submit">수정</button>
						                </li>
				            		</ul>
			                    </div>
				</form>
			</c:if>
	</c:forEach>
</div>


		 <div class="pagination_area">
				<ul class="pagination">
					<!-- 처음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.startPage >1}">
							<li class="page-item disabled">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book?currentPage=1" >
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
				</ul>
			</div>
					<!-- 처음 출력 끝 -->				

					<!-- 이전 출력 시작 -->
					<c:choose>
						<c:when test="${pv.startPage >1}">
							<li class="page-item disabled">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book?currentPage=${pv.startPage-pv.blockPage}">
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
									<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book?currentPage=${i}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book?currentPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 페이지번호 출력 끝 -->

					<!-- 다음 출력 시작 -->
					<c:choose>
						<c:when test="${pv.endPage < pv.totalPage}">
							<li class="page-item">
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book?currentPage=${pv.startPage + pv.blockPage}">
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
								<a class="page-link" style="cursor: pointer;" href="${contextPath }/bookList/book?currentPage=${pv.totalPage}">
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

