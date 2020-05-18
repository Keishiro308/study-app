import Tagify from '@yaireo/tagify';
import '@yaireo/tagify/src/tagify.scss';
$(document).on('turbolinks:load', function(){
  let input = document.querySelector('.tag_form');
  new Tagify(input,{
    originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
  });
});