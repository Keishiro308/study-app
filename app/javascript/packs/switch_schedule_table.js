// /schedulesと/　で予定表と振り返りを切り替えるときに使う
$(document).on('turbolinks:load', function(){
  $('.review').hide();
  $(document).on('click', '.review_btn', function(){
    $(this).after("<button class='uk-button uk-button-primary return_schedule_btn'>予定一覧に戻る</button>")
    $(this).remove();
    $('.review').show();
    $('.schedule').hide();
  });

  $(document).on('click', '.return_schedule_btn', function(){
    $(this).after("<button class='uk-button uk-button-primary review_btn'>振り返りを見る</button>")
    $(this).remove();
    $('.review').hide();
    $('.schedule').show();
  });
});