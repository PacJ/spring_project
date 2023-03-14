<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.star-rating-svg.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/star-rating-svg.css">

<script>
$(document).ready(function() {
	$('#back').click(function() {
		console.log('뒤로');
		/* $('#reviewForm').attr('action', 'book.do');
		$('#reviewForm').submit(); */
		history.go(-1);
	});
	
  	$('#save').click(function() {
		console.log('저장');
		$('[name=reviewContent]').val($('[name=reviewContent]').val().replace(/\n/gi, '<br/>'));	
		$('#reviewForm').attr('action', 'writeRev.do').submit();
	});  
  	
    $(".my-rating").starRating({
        starSize: 25,
        callback: function(currentRating, $el){
            // make a server call here
        }
    });
});
</script>


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
</form>
