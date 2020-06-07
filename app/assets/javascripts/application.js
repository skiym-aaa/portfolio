// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require activestorage

//= require bootstrap-sprockets
//= require_tree .
//= require moment
//= require fullcalendar
//= require jquery.raty
//= require bxslider
//= require dropzone
//= require toastr

// カレンダー機能
$(function () {
    if ($('#calendar').length) {

        //events: '/events.json', 以下に追加
        $('#calendar').fullCalendar({
            // 各controllerのアクションで取得した'gon'をカレンダーに表示
            events: gon.events,
            //カレンダー上部を年月で表示させる
            titleFormat: 'YYYY年 M月',
            //曜日を日本語表示
            dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
            //ボタンのレイアウト
            header: {
                left: '',
                center: 'title',
                right: 'today prev,next'
            },
            //終了時刻がないイベントの表示間隔
            defaultTimedEventDuration: '03:00:00',
            buttonText: {
                prev: '前',
                next: '次',
                prevYear: '前年',
                nextYear: '翌年',
                today: '今日',
                month: '月',
                week: '週',
                day: '日'
            },
            // Drag & Drop & Resize
            editable: true,
            //イベントの時間表示を２４時間に
            timeFormat: "HH:mm",
            //イベントの色を変える
            eventColor: '#87cefa',
            //イベントの文字色を変える
            eventTextColor: '#000000',
            eventRender: function(event, element) {
                element.css("font-size", "0.8em");
                element.css("padding", "5px");
            },
            eventMouseover: function(event, jsEvent, view) {
                $('#modalInfo').html(`${event.start.format('YYYY/MM/DD-HH:mm')}　${event.title}`);
                $('#modalDetail').html(`<p>イベント詳細：　<a href=${event.url}>${event.url}</a></p>`);
                $('#calendarEventModal').modal('show');
            },
        });
    }
});

// ハンバーガーメニュー
$(function() {

  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    // boxsliderのボタン消す
    $('.bx-prev').fadeToggle();
    $('.bx-next').fadeToggle();
    return false;
  });

  $('.menu a').on('click', function() {
    $('.menu-trigger').toggleClass('active');
    $('#sp-menu').fadeToggle();
  });

  // トップに戻るボタン
  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 800);
      return false;
  });
});

// トップに戻るボタン
$(function() {

  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 800);
      return false;
  });
});