$(document).on('turbolinks:load', function(){
  $('.chart_tab').on('click', function(){
    let index = $(this).index() + 1;
    console.log(index)
    $('li.uk-active').removeClass('uk-active');
    $(this).addClass('uk-active');
    $(`.chart_container li:nth-child(${index})`).addClass('uk-active');
  });
});