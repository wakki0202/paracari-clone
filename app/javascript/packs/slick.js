document.addEventListener("turbolinks:load", function () {
$(function () {
  $('.slider').slick({
    arrows: true,  //ボタン非表示
    dots: true, 
    autoplay: false, //自動再生
    autoplaySpeed: 4000, //再生スピード
  });
});
});