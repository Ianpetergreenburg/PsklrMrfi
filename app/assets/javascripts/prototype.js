$(document).ready(function() {
  $('body').on("click", ".prototype-link", function(event){
    event.preventDefault()
    $('.prototype-details').remove()
    var id = $(this).attr('id')
    var $this = $(this).parent()
    $.ajax({
      url: '/prototypes/' + id,
      type: 'get',
    }).done(function(data){
      $this.append(data)
    })
  })
})
