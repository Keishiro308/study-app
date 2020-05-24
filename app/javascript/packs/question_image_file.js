// /questions/newで画像を登録したときにフォームの色を変える
$(document).on('turbolinks:load', function(){
  $('input[type=file]').on('change', function(){
    $(this).next().text('画像が選択されました').removeClass('uk-button-default').addClass('uk-button-secondary');
  });
});