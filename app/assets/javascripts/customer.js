$(document).ready(function() {
  $('body').on("click", ".robot-buy-link", function(event){
    event.preventDefault()
    $('.robot-buy-details').remove()
    var id = $(this).attr('href').replace(/robots/, '')
    var $this = $(this).parent()
    $.ajax({
      url: '/robots/' + id,
      type: 'get',
    }).done(function(data){
      $this.append($(data).filter('.robot-buy-details'))
    })
  })

  $('body').on("click", ".manufacturer-link", function(event){
    event.preventDefault()
    $('.manufacturer-details').remove()
    var id = $(this).attr('href').replace(/\/manufacturers\//, '')
    var $this = $(this).parent()
    $.ajax({
      url: '/manufacturers/' + id,
      type: 'get',
    }).done(function(data){
      $this.append(data)
    })
  })
})
