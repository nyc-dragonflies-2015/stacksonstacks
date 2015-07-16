// Nice work
$(document).ready(function () {
  $('.questionvote').on('submit', function(event){
    event.preventDefault();
    var $data = $(event.target).serialize();
    var $voteCount = $(event.target).closest('.questionvote').find('#questionvotecount');
    $.ajax({
      // Url should probably be POST /votes
      url: '/questionvotes',
      method: 'POST',
      data: $data
    })
    .done(function (response) {
      $voteCount.html(response)
    })
    .fail(function () {
      console.log('not working');
    })
  })
  $('.answervote').on('submit', function(event) {
    event.preventDefault();
    var $data = $(event.target).serialize();
    var $voteCount = $(event.target).closest('.answeritem').find('#answervotecount');
    $.ajax({
      url: '/answervotes',
      method: 'POST',
      data: $data
    })
    .done(function (response) {
      $voteCount.html(response)
    })
    .fail(function () {
      console.log('not working');
    })
  })
})
