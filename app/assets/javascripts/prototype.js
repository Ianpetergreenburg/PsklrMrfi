$(document).ready(function() {
  $('body').on("click", ".prototype-link", function(event){
    event.preventDefault()
    $('.prototype-details').remove()
    var id = $(this).prop('id').replace(/prototype-info-link-/, '')
    var $this = $(this).parent()
    console.log($(this))
    $.ajax({
      url: '/prototypes/' + id,
      type: 'get',
    }).done(function(data){
      $this.append(data)
    })
  })
})
