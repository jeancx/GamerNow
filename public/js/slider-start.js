jQuery(document).ready(function($) {
  $('#full-width-slider').royalSlider({
    arrowsNav: false,
    loop: true,
    keyboardNavEnabled: true,
    controlsInside: false,
    imageScaleMode: 'fill',
    arrowsNavAutoHide: false,
    autoScaleSlider: true, 
    autoScaleSliderWidth: 1600,
    autoScaleSliderHeight: 550,
    controlNavigation: 'none',
	arrowsNavAutoHide: true,
    thumbsFitInViewport: false,
    navigateByClick: true,
    startSlideId: 0,
    autoPlay: {
      enabled: true,
      pauseOnHover: false,
      delay: 5000
    },
    transitionType:'move',
    globalCaption: false,
    deeplinking: {
      enabled: true,
      change: false
    },
    /* size of all images http://help.dimsemenov.com/kb/royalslider-jquery-plugin-faq/adding-width-and-height-properties-to-images */
    imgWidth: 1600,
    imgHeight: 550
  });
});