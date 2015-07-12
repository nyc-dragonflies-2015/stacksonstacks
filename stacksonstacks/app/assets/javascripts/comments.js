$('document').ready(function(){
  $('.comment_for_answer').on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      url:/comments/new
      data:
    })
  })
})
