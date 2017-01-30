$(document).ready(function() {
  $('body').on("click", ".robot-buy-link", function(event){
    event.preventDefault()

    var current = ($.contains($(this).parent()[0], $('.robot-buy-details')[0]))
    $('.robot-buy-details').remove()

    if (current) {} else {

      var id = $(this).attr('href').replace(/robots/, '')
      var $this = $(this).parent()

      $.ajax({
        url: '/robots/' + id,
        type: 'get',
      }).done(function(data){
        $this.append($(data).filter('.robot-buy-details'))
      })
    }
  })

  $('body').on("click", ".manufacturer-link", function(event){
    event.preventDefault()
    var current = ($.contains($(this).parent()[0], $('.manufacturer-details')[0]))
    $('.manufacturer-details').remove()

    if (current) {} else {

      var id = $(this).attr('href').replace(/\/manufacturers\//, '')
      var $this = $(this).parent()

      $.ajax({
        url: '/manufacturers/' + id,
        type: 'get',
      }).done(function(data){
        $this.append(data)
      })
    }
  })
})
