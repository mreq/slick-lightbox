test 'captions via data-attr', ->
  { $wrap, $modalElement } = create(['100/50', '200/100'], {
    caption: 'caption'
  })

  $wrap.find('a').each (i, el) ->
    $(el).attr('data-caption', "Caption ##{i + 1}")

  $wrap.find('a').first().click()

  @equal $modalElement().find('.slick-lightbox-slick-caption').length,
         $modalElement().find('.slick-slide').length,
         'creates captions'

test 'captions via function', ->
  { $wrap, $modalElement } = create(['100/50', '200/100'], {
    caption: (el, info) ->
      "#{$(el).data('caption')} #{info.index + 1}/#{info.length}"
  })

  $wrap.find('a').attr('data-caption', 'caption base')
  $wrap.find('a').first().click()

  @equal $modalElement().find('.slick-lightbox-slick-caption').length,
         $modalElement().find('.slick-slide').length,
         'creates captions'

  $slides = $modalElement().find('.slick-slide').not('.slick-cloned')

  @equal $slides.first().find('.slick-lightbox-slick-caption').text(),
         'caption base 1/2',
         'uses info object for captions'

  @equal $slides.last().find('.slick-lightbox-slick-caption').text(),
         'caption base 2/2',
         'uses info object for captions'
