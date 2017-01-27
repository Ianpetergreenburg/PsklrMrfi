$(document).ready(function() {
  $('ul.nav-tabs li').click(function(event){
    $('li').removeClass('active')
    $('div').removeClass('active')
    $(this).addClass('active')
    var id = $(this).children('a').prop('href').replace(/http\:\/\/localhost\:3000\/robots/, '')
    $('div' + id).addClass('active')
  })
})
