rowLink = ->
  $('td[data-link').click ->
    window.location = $(this).data("link")
    return

@DataTables =
  init: ->
    $ ->
      rowLink()