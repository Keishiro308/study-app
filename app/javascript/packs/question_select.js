$(document).on('turbolinks:load', function(){
  $('#select_submit').prop('disabled', true);
  $('#random').on('change', function(){
    if ($(this).prop('checked')) {
      $('input[name="question[tag_ids][]"]').prop('disabled', true);
      $('input[name="question[tag_ids][]"]').prop('checked', false);
      $('#recent_mistake').prop('disabled', true);
      $('#recent_mistake').prop('checked', false);
    } else{
      $('input[name="question[tag_ids][]"]').prop('disabled', false);
      $('#recent_mistake').prop('disabled', false);
    }
  });
  $('#recent_mistake').on('change', function(){
    if ($(this).prop('checked')) {
      $('input[name="question[tag_ids][]"]').prop('disabled', true);
      $('input[name="question[tag_ids][]"]').prop('checked', false);
      $('#random').prop('disabled', true);
      $('#random').prop('checked', false);
    } else{
      $('input[name="question[tag_ids][]"]').prop('disabled', false);
      $('#random').prop('disabled', false);
    }
  })
  $('input[type="checkbox"]').on('change', function(){
    //一つ以上選択されている場合はボタンが押せるようになる。
    if ($('input[type="checkbox"]:checked').length >= 1) {
      $('#select_submit').prop('disabled', false);
    } else{
      $('#select_submit').prop('disabled', true);
    }
  });
});