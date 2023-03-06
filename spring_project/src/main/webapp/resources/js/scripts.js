$(document).ready(function () {
  //모바일 메뉴
  $('.menu-trigger').each(function () {
    var $this = $(this);

    $this.on('click', function (e) {
      e.preventDefault();
      $(this).toggleClass('active');
    });
  });

  $('.menu-trigger').on('click', function () {
    if ($('.nav_area .inner ul').hasClass('active')) {
      $('.nav_area .inner ul').removeClass('active');
    } else {
      $('.nav_area .inner ul').addClass('active');
    }
  });

  // 주소
  $('.addr_btn').on('click', function () {
    new daum.Postcode({
      oncomplete: function (data) {
        console.log(data);
        var roadAddr = data.roadAddress;
        var jibunAddr = data.jibunAddress;
        $('#member_post').val(data.zonecode);
        if (roadAddr !== '') {
          $('#member_addr').val(roadAddr);
        } else if (jibunAddr !== '') {
          $('#member_addr').val(jibunAddr);
        }
      },
    }).open();
  });

  $('.radio_btn').on('click', function () {
    $('input[name="user_gender"]').val($(this).text());
    $('.radio_btn').removeClass('active');
    $(this).addClass('active');
  });
});
