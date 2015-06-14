# slick-lightbox

A lightbox wrapper for Ken's amazing slick carousel. Credits go to [kenwheeler](https://github.com/kenwheeler) for doing the [hard work](https://github.com/kenwheeler/slick).

## Usage

Install via bower.

```
bower install -S slick-lightbox
```

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

Option               | Type    |  Default         | Description
------               | ----    |  -------         | -----------
background           | string  | `rgba(0,0,0,.8)` | Background for the lightbox. Is used directly as a CSS `background` statement so that color and/or an image can be used.
closeOnEscape        | boolean | `true`           | Should the lightbox close upon pressing ESC?
closeOnBackdropClick | boolean | `true`           | Should the lightbox close upon clicking on backdrop?
destroyTimeout       | integer | `500`            | How many ms should we wait before actually removing the lightbox from the DOM? The default is used so that a 0.5s opacity transition can take place.
itemSelector         | string  | `a`              | jQuery-like selector for the carousel-to-create items. The items should be anchors with `href` attribute aiming at the desired lightbox image. If that's not the case, you should specify the `src` option.
navigateByKeyboard   | boolean | `true`           | Can you use keyboard arrows to navigate the carousel?
slick                | object  | `{}`             | Slick options to pass to the carousel.
caption              | various | `false`          | Should the images be captioned? If `false`, no caption is created. You can pass your own **function** accepting the element as an attribute (e.g. `function(element) { return $(element).doSomething(); }`) or a **string** with the name of the `data-attribute` to be fetched (`my-caption` will get the value of `data-my-caption` attribute).
src                  | various | `false`          | How to get the image urls? If `false`, no src is taken as the `href` attribute. You can pass your own **function** accepting the element as an attribute (e.g. `function(element) { return $(element).doSomething(); }`) or a **string** with the name of the attribute to be fetched (`src` will get the value of `element.src` attribute).
captionPosition      | various | `'dynamic'`      | Where should the caption be placed? When set to 'dynamic', the caption is displayed right under the image. When 'bottom', the caption is on the bottom of the screen independent to the image size.
images               | various | `false`          | When passed an array, slick lightbox doesn't scan the elements for image URLs and uses array's values instead.

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