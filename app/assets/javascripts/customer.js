$(document).ready(function() {
  $('body').on("click", ".manufacturer-link", function(event){
    event.preventDefault()
    $('.manufacturer-details').remove()
    var id = $(this).attr('href').replace(/manufacturers/, '')
    var $this = $(this).parent()
    $.ajax({
      url: '/manufacturers/' + id,
      type: 'get',
    }).done(function(data){
      $this.append(data)
    })
  })
})
