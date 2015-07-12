$('document').ready(function(){
  $('.comment_for_answer').on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      // url:/comments/new
      // data:
    })
    .done(function(){
      console.log("success");
    })
    .fail(function(){
      console.log("error");
    })
  })
})
