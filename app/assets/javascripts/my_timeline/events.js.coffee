$ ->
  $("a.event_expand").click (event) ->
    event.preventDefault()

    event_id = $(this).attr("id").replace /[A-Z_a-z$-]/g, ""
    div_id   = "div#event_" + event_id
    url      = $("span#event_url_" + event_id).text()

    if $(div_id).css('display') == 'none'
      $.ajax url,
        type: 'GET'
        dataType: 'html'
        error: (jqXHR, textStatus, errorThrown) ->
          $(div_id).html errorThrown
          $(div_id).toggle()

        success: (data, textStatus, jqXHR) ->
          $(div_id).html data
          $(div_id).toggle()
    else
      $(div_id).toggle()

