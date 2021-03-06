$(document).ready(function(){
  $('.bxslider').bxSlider({
    auto: true,           // 自動スライド
    speed: 1000,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 3000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
    slideWidth: 500,      // 各スライドの幅
    randomStart: true,    // 最初に表示するスライドをランダムに設定
    autoHover: true,      // ホバー時に自動スライドを停止
    captions: true,  　　　// キャプション追加
    touchEnabled:false    // ドラッグ操作
  });
});