$ ->
  $('.thumbnail').on('click', (e) ->
    $(this).parent().children('.thumbnail').toggleClass('hide')
  )

  $('.thumbnail span').on('click', (e) ->
    $(this).parent().parent().children('.thumbnail').removeClass('carrot').addClass('nephritis').parent().children('.thumbnail').toggleClass('hide')
    $(this).remove()
  )
