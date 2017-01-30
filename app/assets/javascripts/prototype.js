$(document).ready(function() {
  $(".prototype-link").on("click", function(event){
    event.preventDefault()

    var current = ($.contains($(this).parent()[0], $('section.prototype-details')[0]))
    $('.prototype-details').remove()

    if (current) {} else {
      var id = $(this).prop('id').replace(/prototype-info-link-/, '')
      var $this = $(this).parent()

      $.ajax({
        url: '/prototypes/' + id,
        type: 'get',
      }).done(function(data){
        $this.append(data)
      })

    }
  })
})
