test 'works correctly with slick clones', ->
  # https://github.com/mreq/slick-lightbox/issues/57
  { $wrap, $modalElement } = create(['100/50', '200/100', '50/50'])
  $wrap.slick()

  $first = $wrap.find('.slick-active').first()
  $first.click()

  @equal $modalElement().find('.slick-active img').attr('src'),
         $first.attr('href'),
         'Uses the correct index initially'

test 'works correctly with slidesToShow', ->
  # https://github.com/mreq/slick-lightbox/issues/57
  { $wrap, $modalElement } = create(['100/50', '200/100', '300/100', '400/200'])
  $wrap.slick({ slidesToShow: 3 })
  $prev = $wrap.find('.slick-prev')

  $first = $wrap.find('.slick-active').first()
  $first.click()

  @equal $modalElement().find('.slick-active img').attr('src'),
         $first.attr('href'),
         'Uses the correct index initially'

  $prev.click()

  $first = $wrap.find('.slick-active').first()
  $first.click()

  @equal $modalElement().find('.slick-active img').attr('src'),
         $first.attr('href'),
         'Uses the correct index after slick looping'
