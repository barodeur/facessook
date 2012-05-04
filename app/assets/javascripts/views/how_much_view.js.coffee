class window.HowMuchView
  template: JST['templates/how_much']

  constructor: (options={}) ->
    @domain = options.domain || 'facebook'
    @domainPrice = options.domainPrice || 4.99
    @render()

  render: ->
    @compute()
    $('#content').html @template @
    $('form').submit (e) =>
      e.preventDefault()
      @domain = $('[name="domain"]').val()
      @domainPrice = parseFloat $('[name="domain_price"]').val()
      @render()

  compute: ->
    _gaq?.push(['_trackEvent', 'Compute', @domain, @domainPrice])
    @domains = @domain.split('').reduce (ary, c) =>
      r = new Array()
      for partialDomain in ary
        r.push "#{partialDomain}#{c}"
        if @squattingTable[c] then r.push "#{partialDomain}#{sc}" for sc in @squattingTable[c]
      r
    @price = @domains.length * @domainPrice
    @


  squattingTable:
    a: ['à', 'á', 'â', 'ã', 'ä', 'å', 'æ']
    b: ['ß']
    c: ['ç']
    e: ['è', 'é', 'ê', 'ë', 'œ']
    i: ['ì', 'í', 'î', 'ï']
    n: ['ñ']
    o: ['ò', 'ó', 'ô', 'õ', 'ö', 'œ']
    u: ['ù', 'ú', 'û', 'ü']
    y: ['ý', 'ÿ']
