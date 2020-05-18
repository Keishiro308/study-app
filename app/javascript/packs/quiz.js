$(document).on('turbolinks:load', function(){
  $('.practice_wrapper').first().addClass('active');
  $('.answer_container').hide();
  let correct_num = 0;

  //答えを見るボタンを押すと答えが表示される
  $('.check_ans_btn').on('click', function(){
    $(this).parent('.body_container').next('.answer_container').show();
    $(this).parent('.body_container').hide();
  });

  //覚えている,または覚えていないボタンを押すと次の問題が表示され、ajaxで正誤の記録が作られる。
  $('.result_btn').on('click', function(){
    const correctness = $(this).html();
    if (correctness === '覚えている') {
      correct_num++;
    }
    $(this).parent().parent('.practice_wrapper').removeClass('active');
    $('.score').find('span').html(correct_num);
    $(this).parent().parent('.practice_wrapper').next('').addClass('active');
  });
});
