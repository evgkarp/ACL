$ ->
  $("select.permission").select2(theme: "bootstrap")

  $(".my-articles").click (e) ->
    e.preventDefault()
    $(".article").hide()
    $(".author").show()

  $(".editable-articles").click (e) ->
    e.preventDefault()
    $(".article").hide()
    $(".editable").show()
