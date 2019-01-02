# slick-lightbox

[![CDNJS](https://img.shields.io/cdnjs/v/slick-lightbox.svg)](https://cdnjs.com/libraries/slick-lightbox)

A lightbox wrapper for Ken's amazing slick carousel. Credits go to [kenwheeler](https://github.com/kenwheeler) for doing the [hard work](https://github.com/kenwheeler/slick).

## Setup

### Bower

```
bower install -S slick-lightbox
```

### Ruby on Rails

Use the [slick-lightbox-rails](https://github.com/jwir3/slick-lightbox-rails) gem. Add to Gemfile.

```
gem 'slick-lightbox-rails', '>= 0.0.1'
```

Run bundler.

```
bundle install
```

## Usage

Make sure you include CSS for both slick and slick-lightbox. Example HTML:

```html
<!DOCTYPE html>
<html>
<head>
  <title>slick lightbox</title>
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" type="text/css" href="bower_components/slick-carousel/slick/slick.css">
  <link rel="stylesheet" type="text/css" href="bower_components/slick-carousel/slick/slick-theme.css">
  <link rel="stylesheet" type="text/css" href="styles/slick-lightbox.css">
</head>
<body>
  <div>
    <ul>
      <li><a href="http://placekitten.com/1600/1300" data-caption="Lorem ipsum 1600x1300">http://placekitten.com/1600/1300</a></li>
      <li><a href="http://placekitten.com/1630/1280" data-caption="Lorem ipsum 1630x1280">http://placekitten.com/1630/1280</a></li>
      <li><a href="http://placekitten.com/1500/1250" data-caption="Lorem ipsum 1500x1250">http://placekitten.com/1500/1250</a></li>
    </ul>
  </div>
  <script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
  <script type="text/javascript" src="bower_components/slick-carousel/slick/slick.min.js"></script>
  <script type="text/javascript" src="scripts/slick-lightbox.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $('ul').slickLightbox({
        itemSelector: '> li > a'
      });
    });
  </script>
</body>
</html>
```

## Options

Option               | Type     |  Default         | Description
------               | ----     |  -------         | -----------
background           | string   | `rgba(0,0,0,.8)` | Background for the lightbox. Is used directly as a CSS `background` statement so that color and/or an image can be used.
closeOnEscape        | boolean  | `true`           | Should the lightbox close upon pressing ESC?
closeOnBackdropClick | boolean  | `true`           | Should the lightbox close upon clicking on backdrop?
destroyTimeout       | number   | `500`            | How many ms should we wait before actually removing the lightbox from the DOM? The default is used so that a 0.5s opacity transition can take place.
itemSelector         | string   | `a`              | jQuery-like selector for the carousel-to-create items. The items should be anchors with `href` attribute aiming at the desired lightbox image. If that's not the case, you should specify the `src` option.
navigateByKeyboard   | boolean  | `true`           | Can you use keyboard arrows to navigate the carousel?
slick                | object   | `{}`             | Slick options to pass to the carousel.
caption              | various  | `false`          | Should the images be captioned? If `false`, no caption is created. You can pass your own **function** accepting the `element` and `info` attributes (e.g. `function(element, info) { return $(element).doSomething(); }`, with `info` being an `{ index: itemIndex, length: itemCount }` object) or a **string** with the name of the `data-attribute` to be fetched (`my-caption` will get the value of `data-my-caption` attribute).
src                  | various  | `false`          | How to get the image urls? If `false`, no src is taken as the `href` attribute. You can pass your own **function** accepting the element as an attribute (e.g. `function(element) { return $(element).doSomething(); }`) or a **string** with the name of the attribute to be fetched (`src` will get the value of `element.src` attribute).
captionPosition      | various  | `'dynamic'`      | Where should the caption be placed? When set to 'dynamic', the caption is displayed right under the image. When 'bottom', the caption is on the bottom of the screen independent to the image size.
images               | various  | `false`          | When passed an array, slick lightbox doesn't scan the elements for image URLs and uses array's values instead.
useHistoryApi        | boolean  | `false`          | When `true`, opening the lightbox does a `history.pushState`. The plugin then listens for the `popstate` event to close the lightbox.
layouts              | object   |                  | See [Layouts](#layouts)
shouldOpen           | function | `null`           | Given a function, checks the return value before opening. If the function returns a falsy value, the lightbox is not opened upon clicking on the items. Accepts three arguments - the slick lightbox instance as the first, the clicked element as the second and the click event as the last.
imageMaxHeight       | number   | `0.9`            | Maximum height of the lightbox images. Relative to the window height.
lazy                 | boolean  | `false`          | Should the images be lazyloaded? 
lazyPlaceholder      | string   | `null`           | Path to lazyloading placeholder. Defaults to a blank gif.

## Events

Events are triggered on the source element. Example:

```javascript
$(document).ready(function(){
  $('ul').slickLightbox().on({
    'show.slickLightbox': function(){ console.log('A `show.slickLightbox` event triggered.'); },1
    'shown.slickLightbox': function(){ console.log('A `shown.slickLightbox` event triggered.'); },
    'hide.slickLightbox': function(){ console.log('A `hide.slickLightbox` event triggered.'); },
    'hidden.slickLightbox': function(){ console.log('A `hidden.slickLightbox` event triggered.'); }
  });
});
```

Event                | Description
------               | ----
show.slickLightbox   | Triggered when the lightbox is opened.
shown.slickLightbox  | Triggered when the lightbox is opened, after the transitions took place.
hide.slickLightbox   | Triggered when the lightbox is closed.
hidden.slickLightbox | Triggered when the lightbox is closed, after the transitions took place.


## Layouts

The layout is customizable using the `layouts` option object.

- `layouts.closeButton`, which defaults to `<button type="button" class="slick-lightbox-close"></button>`

## Lightbox instance

You can access the lightbox instance through the bound element. It's assigned to `.slickLightbox`. Example:

```javascript
$('#my-element').slickLightbox()
console.log('My slickLightbox instance:', $('#my-element')[0].slickLightbox)
// once a lightbox is opened
console.log('My slick instance:', $('#my-element')[0].slickLightbox.slick)
```

## Demos

The [slick-lightbox demo page](https://mreq.github.io/slick-lightbox/demo/) contains various setups of slick lightbox.

## Contributing

Edit the coffee source please. Use gulp to build.
