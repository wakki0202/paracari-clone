// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require('jquery')
require("./slick")
import $ from 'jquery';
import "bootstrap"
import "../stylesheets/application"
import 'slick-carousel'


$(function () {
  $('.carousel').slick({
    arrows: true,
    infinite: false,
    dots: true,
  });
});

document.addEventListener("turbolinks:load", function () {
  $(function () {
    $(".slide").slick({
      arrows: false, //左右の矢印はなし
      autoplay: true, //自動的に動き出すか。初期値はfalse。
      autoplaySpeed: 50, //自動的に動き出す待ち時間。初期値は3000ですが今回の見せ方では0
      speed: 6900, //スライドのスピード。初期値は300。
      pauseOnHover: false, //オンマウスでスライドを一時停止させるかどうか。初期値はtrue。
      pauseOnFocus: false, //フォーカスした際にスライドを一時停止させるかどうか。初期値はtrue。
      cssEase: "linear", //動き方。初期値はeaseですが、スムースな動きで見せたいのでlinear
      slidesToShow: 4, //スライドを画面に4枚見せる
      slidesToScroll: 1, //1回のスライドで動かす要素数
      variableWidth: true,
    });
  });
});