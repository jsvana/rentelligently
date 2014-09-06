$ ->
  $(document).on('click', '.issues_container .thumbnail', (e) ->
    $(this).parent().children('.thumbnail').toggleClass('hide')
  )

  $(document).on('click', '.issues_container .thumbnail span', (e) ->
    $(this).parent().parent().children('.thumbnail').removeClass('carrot').addClass('nephritis').parent().children('.thumbnail').toggleClass('hide')
    $(this).remove()
  )
