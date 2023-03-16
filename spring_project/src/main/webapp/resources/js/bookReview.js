$(document).ready(function () {
  // 수정 클릭 시 수정창 나타남
  $('[id^="editReview_"]').click(function (event) {
    event.preventDefault();
    let revNum = this.id.split('_').pop();
    $('[id^=review_' + revNum + ']').removeClass('hide');
  });

  // 수정취소 시 수정창 숨김
  $('[id^="close_"]').click(function (event) {
    event.preventDefault();
    let revNum = this.id.split('_').pop();
    $('[id^=review_' + revNum + ']').addClass('hide');
  });

  // 후기 작성 Form submit시 발생
  $('#reviewForm').submit(function (event) {
    //후기 작성 시 입력값이 없다면 팝업창 띄움.
    if ($("textarea[name='reviewContents']").val() === '') {
      event.preventDefault();
      $('.popup>p').text('입력하신 내용이 없습니다.');
      $('.popup_back').addClass('on');
    }

    // 줄바꿈을 <br/>로 저장
    $(this)
      .find('[name=reviewContents]')
      .val(
        $(this).find('[name=reviewContents]').val().replace(/\n/gi, '<br/>')
      );
  });

  // 팝업창 닫기
  $('.popup>button').click(function () {
    console.log('closed');
    $('.popup_back').removeClass('on');
  });

  // 수정 제출 시 줄바꿈 처리, 수정된 사항을 POST하고 reload
  $('.updateReview').submit(function (event) {
    event.preventDefault(); // 제출 제한
    $(this)
      .find('[name=reviewContents]')
      .val(
        $(this).find('[name=reviewContents]').val().replace(/\n/gi, '<br/>')
      );

    let form = $(this);
    let formData = form.serialize(); // form 내부의 기능들을 text String에 담는다.
    let url = form.attr('action'); // form태그의 'action'값을 url에 담는다.
    console.log(url);

    $.ajax({
      type: 'POST',
      url: url,
      data: formData,
      success: function (response) {
        location.reload();
      },
      error: function (xhr, status, error) {
        alert('Error updating review');
      },
    });
  });

  $('[id^="deleteReview_"]').click(function (event) {
    event.preventDefault();
    let revNum = this.id.split('_').pop();
    console.log(revNum);
    $('[id^=EditDeleteFrm_' + revNum + ']')
      .attr('action', 'delete.do')
      .submit();
  });
});
