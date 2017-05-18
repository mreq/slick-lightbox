test 'boilerplate', ->
  $wrap = create(['100/50', '200/100'])
  @equal $wrap.find('a').length, 2, '#create'
