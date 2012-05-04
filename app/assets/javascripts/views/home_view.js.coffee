class window.HomeView
  constructor: ->
    setTimeout @toggle, 3000

    # toggle on click
    $('body').click =>
      @toggle()

  toggle: =>
    unless @toggled
      @toggled = true
      $('body').unbind('click')
      $('body').append JST['templates/warning']()
