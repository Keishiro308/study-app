// /schedules/new のプラスボタンを押してフォームを追加するときに使う
$(document).on('turbolinks:load ready', function(){
  let $add_btn = $('.schedule_add_btn');
  let $remove_btn = $('.schedule_remove_btn');
  let $tb = $('.addable_form_tbody');
  let count = $('tbody tr').length;

  $add_btn.on('click', function(){
    count++;
    if (count >= 7) {
      $('.uk-alert-danger').remove();
      $('.uk-navbar-container').after(
        `<div class="uk-alert-danger" uk-alert>
          <a class="uk-alert-close" uk-close></a>
          <p>これ以上予定を追加できません</p>
        </div>`
      )
    } else {
      $tb.append(
        `<tr>\
          <td><input step='1' class='uk-input uk-form-width-xsmall' type='number' name='schedule[schedule][schedule_${count}][priority]' \
          id='schedule_priority_${count}'></td>\
          <td><input class='uk-input uk-form-width-medium' placeholder='内容を入力してください' type='text' name='schedule[schedule][schedule_${count}][body]' id='schedule_body_${count}'></td>\
          <td><input step='0.5' class='uk-input uk-form-width-xsmall' placeholder='半角数字を入力してください' type='number' name='schedule[schedule][schedule_${count}][predicted_time]' \
          id='schedule_predicted_time_${count}'>分</td>\
          <td><div class='schedule_remove_btn'><i class='fas fa-times'></i></div></td>\
        </tr>`
      );
    }
  });

  $(document).on('click', '.schedule_remove_btn', function(){
    let $tr = $(this).parents('tr');
    count--;
    $tr.remove();
    $('.uk-alert-danger').remove();
    if (count == 1) {
      $remove_btn.remove();
    }
  });

  if (count == 1) {
    $remove_btn.remove();
  }
});
