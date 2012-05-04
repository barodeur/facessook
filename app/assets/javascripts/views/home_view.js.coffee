class window.HomeView
  constructor: ->
    setTimeout @toggle, 3000

    $('a').click (e) =>
      e.preventDefault()

    $('form').submit (e) =>
      e.preventDefault()

    # toggle on click
    $('body').click =>
      @toggle()

  toggle: =>
    unless @toggled
      @toggled = true
      $('body').unbind('click')
      $('body').append JST['templates/warning']()
