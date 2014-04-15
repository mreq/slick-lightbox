# slick-lightbox

**a work in progress**

Credits go to [kenwheeler](https://github.com/kenwheeler) for doing the [hard work](https://github.com/kenwheeler/slick).

## Options

Option              | Type    | Default          | Description
------              | ----    | -------          | -----------
background          | string  | 'rgba(0,0,0,.8)' | Should the lightbox close upon pressing ESC?
closeOnEscape       | boolean | true             | Should the lightbox close upon pressing ESC?
destroyTimeout      | integer | 500              | How many ms should we wait before actually removing the lightbox from the DOM? The default is used so that a 0.5s opacity transition can take place.
navigateByKeyboard  | boolean | true             | Can you use keyboard arrows to navigate the carousel?
slick               | object  | {}               | Slick options to pass to the carousel.
