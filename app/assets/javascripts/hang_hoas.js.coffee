getIdFromUrl = ->
  urlArray = window.location.href.split('/')
  return urlArray[4]

getRecommendIds = ->
  $.get 'http://127.0.0.1:5000/?item_id=' + getIdFromUrl ->
    $.ajax(
      url: '/recommend'
      type: 'POST'
      data:
        recommend_ids: JSON.stringify(data.recommend_ids)
        ).done (data) ->
      console.log(data)
      return

@Product =
  run: ->
    $ ->
      getRecommendIds()
