require('summernote/dist/summernote-bs4')
require('summernote/dist/summernote-bs4.css')
require('summernote/dist/lang/summernote-ja-JP')

const sendFile = (file, toSummernote) => {
  const data = new FormData
  let note_image_ids = $('.note_image_ids').val();
  data.append('note_image[image]', file)
  $.ajax({
    data: data,
    type: 'POST',
    url: '/note_images',
    cache: false,
    contentType: false,
    processData: false,
    success: (data) => {
      if (!note_image_ids) {
        $('.note_image_ids').val(`${data.id}`)
      } else {
        $('.note_image_ids').val(`${note_image_ids},${data.id}`)
      }
      img = document.createElement('IMG')
      img.src = data.url
      console.log(data)
      img.setAttribute('id', `sn-image-${data.id}`)
      toSummernote.summernote('insertNode', img)
    }
  });
}

const deleteFile = (file_id) => {
  $.ajax({
    type: 'DELETE',
    url: `/note_images/${file_id}`,
    cahce: false,
    contentType: false,
    processData: false
  });
}

$(document).on('ready turbolinks:load', function(){
  $('#summernote').summernote({
    lang: 'ja-Jp',
    height: 300,
    fontNames: [
      "YuGothic","Yu Gothic","Hiragino Kaku Gothic Pro","Meiryo",
      "sans-serif", "Arial","Arial Black","Comic Sans MS","Courier New",
      "Helvetica Neue","Helvetica","Impact","Lucida Grande","Tahoma","Times New Roman","Verdana"],
    toolbar: [
      // [groupName, [list of button]]
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['strikethrough', 'superscript', 'subscript', 'fontname']],
      ['fontsize', ['fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['height', ['height']],
      ['insert', ['picture', 'video', 'link', 'hr']],
      ['misc', ['undo', 'redo', 'fullscreen', 'codeview']]
    ],
    callbacks: {
      onImageUpload: function(file){
        console.log(file[0])
        sendFile(file[0], $(this))
      },
      onMediaDelete: function(target, editor, editable){
        upload_id = target[0].id.split('-').slice(-1)[0]
        console.log(target[0])
        console.log(upload_id)
        if (upload_id) {
          deleteFile(upload_id)
        }
        target.remove()
      }
    }
  });
});