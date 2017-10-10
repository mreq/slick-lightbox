window.test = (caption, fn) ->
  QUnit.test caption, (assert) ->
    fn.call assert

window.create = (sizes, options = {}) ->
  html = $.map sizes, (size) ->
    """
      <a href="http://placekitten.com/#{size}">
        <img src="http://placekitten.com/#{size}">
      </a>
    """

  $wrap = $("<div>#{html}</div>")
  $('body').append($wrap)
  $wrap.slickLightbox(options)

  slickLightbox = $wrap[0].slickLightbox
  $modalElement = -> slickLightbox.$modalElement

  return {
    $wrap
    $modalElement
    slickLightbox
  }
