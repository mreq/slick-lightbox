test 'images as an array', ->
  { $wrap, slickLightbox, $modalElement } = create([], {
    images: ['http://placekitten.com/100/100', 'http://placekitten.com/200/200']
  })

  slickLightbox.init()

  @equal $modalElement().find('.slick-slide').not('.slick-cloned').length,
         2,
         'has correct slide count'

test 'images as a single-item array', ->
  { $wrap, slickLightbox, $modalElement } = create([], {
    images: ['http://placekitten.com/100/100']
  })

  slickLightbox.init()

  @equal $modalElement().find('.slick-slide').not('.slick-cloned').length,
         1,
         'has correct slide count'
