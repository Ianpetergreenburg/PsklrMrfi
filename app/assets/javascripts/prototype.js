$(document).ready(function() {
  $(".prototype-link").click(function(event){
    event.preventDefault()
    $('.prototype-details').remove()
    var id = $(this).prop('id').replace(/prototype-info-link-/, '')
    var $this = $(this).parent()
    $.ajax({
      url: '/prototypes/' + id,
      type: 'get',
    }).done(function(data){
      $this.append(data)
    })
  })
})
