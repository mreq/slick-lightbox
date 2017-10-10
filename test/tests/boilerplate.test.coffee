test 'boilerplate', ->
  { $wrap } = create(['100/50', '200/100'])
  @equal $wrap.find('a').length, 2, 'creates anchors'
  @equal $wrap.find('img').first().prop('src'), 'http://placekitten.com/100/50', 'uses size'
