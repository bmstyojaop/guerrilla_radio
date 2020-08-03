$(function(){
  function buildHTML(comment){
    let html = `<div class="CommentDisplay--individual">
                  <span>
                    <strong>
                      @
                      <a href=/users/${comment.user_id}>${comment.user_name}</a>
                      ：
                    </strong>
                    ${comment.text}
                  </span>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.CommentDisplay').append(html);
      $('.textbox').val('');
      $('.commentSubmit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});