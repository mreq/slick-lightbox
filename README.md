# slick-lightbox

**a work in progress**

Credits go to [kenwheeler](https://github.com/kenwheeler) for doing the [hard work](https://github.com/kenwheeler/slick).

## Usage

Make sure you include CSS for both slick and slick-lightbox. Example HTML:

```html
<ul>
  <li><a href="http://placekitten.com/600/300">I like kittens.</a></li>
  <li><a href="http://placekitten.com/630/280">Do you like kittens?</a></li>
  <li><a href="http://placekitten.com/500/250">Thank you placekitten.com.</a></li>
</ul>

<script type="text/javascript" src="path/to/jquery.js"></script>
<script type="text/javascript" src="path/to/slick.js"></script>
<script type="text/javascript" src="path/to/slick-lightbox.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('ul').slickLightbox({
      itemSelector: '> li > a'
    });
  });
</script>
```

## Options

Option              | Type    | Default        | Description
------              | ----    | -------        | -----------
background          | string  | rgba(0,0,0,.8) | Background for the lightbox. Is used directly as a CSS `background` statement so that color and/or an image can be used.
closeOnEscape       | boolean | true           | Should the lightbox close upon pressing ESC?
destroyTimeout      | integer | 500            | How many ms should we wait before actually removing the lightbox from the DOM? The default is used so that a 0.5s opacity transition can take place.
itemSelector        | string  | a              | jQuery-like selector for the carousel-to-create items. The items should be anchors with `href` attribute aiming at the desired lightbox image.
navigateByKeyboard  | boolean | true           | Can you use keyboard arrows to navigate the carousel?
slick               | object  | {}             | Slick options to pass to the carousel.
caption             | various | false          | Should the images be captioned? If `false`, no caption is created. You can pass your own **function** accepting the anchor element as an attribute (e.g. `function(element) { return $(element).doSomething(); }`) or a **string** with the name of the `data-attribute` to be fetched (`my-caption` will get the value of `data-my-caption` attribute).
captionPosition     | various | 'dynamic'      | Where should the caption be placed? When set to 'dynamic', the caption is displayed right under the image. When 'bottom', the caption is on the bottom of the screen independent from the image size.
images              | various | false          | When passed an array, slick lightbox doesn't scan the elements for image URLs and uses array's values instead.
