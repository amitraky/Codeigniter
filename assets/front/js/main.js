(function($) {

	"use strict";

    // Preloader
    $(window).load(function(){
      $('#preloader').fadeOut('slow',function(){$(this).remove();});
    });


    // Navbar Scroll To Fixed
    $('.fixed-header').scrollToFixed();


    // Pogo Slider
    $('#pogo-slider').pogoSlider({
        autoplay: true,
        autoplayTimeout: 5000,
        displayProgess: true,
        targetWidth: 1920,
        targetHeight: 750,
        responsive: true,
        pauseOnHover: false,
    }).data('plugin_pogoSlider');


    // slick-carousel for testimonial
    $(".testimonial-carousel").slick({
            dots: true,
            arrows: false,
            infinite: true,
            fade: true,
            autoplay: true,
            speed: 800,
            autoplaySpeed: 3000,
            responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true,
              }
            },
            {
              breakpoint: 991,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true,
              }
            },
            {
              breakpoint: 750,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1
              }
            },
            {
              breakpoint: 600,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1
              }
            }
            
          ]

      });



    // slick-carousel for testimonial two
    $(".testimonial-carousel-two").slick({
            dots: true,
            arrows: false,
            margin: 30,
            infinite: true,
            autoplay: true,
            speed: 800,
            autoplaySpeed: 3000,
            responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1,
                infinite: true,
              }
            },
            {
              breakpoint: 991,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1,
                infinite: true,
              }
            },
            {
              breakpoint: 600,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true,
              }
            },
            
          ]

      });

    
    // slick-carousel for brand
    $(".brand-carousel").slick({
            dots: false,
            arrows: false,
            infinite: true,
            autoplay: true,
            speed: 800,
            autoplaySpeed: 3000,
            responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 4,
                slidesToScroll: 1,
                infinite: true,
                dots: false
              }
            },
            {
              breakpoint: 750,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 1
              }
            },
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1
              }
            }
            
          ]

      });


    // Light box - Portfolio Gallery
    $('.gallery').featherlightGallery({
      gallery: {
          fadeIn: 300,
          fadeOut: 300
      },
      openSpeed: 300,
      closeSpeed: 300
    });
    $('.gallery2').featherlightGallery({
        gallery: {
            next: 'next Â»',
            previous: 'Â« previous'
        },
        variant: 'featherlight-gallery2'
    });



    // Light box - flickr photos gallery
    $('.flickr-gallery').featherlightGallery({
      gallery: {
          fadeIn: 300,
          fadeOut: 300
      },
      openSpeed: 300,
      closeSpeed: 300
    });
    $('.gallery2').featherlightGallery({
        gallery: {
            next: 'next Â»',
            previous: 'Â« previous'
        },
        variant: 'featherlight-gallery2'
    });



    //Scroll-Up
    dyscrollup.init({
        showafter : 500,
        scrolldelay : 1000,
        position : 'right',
        shape : 'squre',
        width : "20",
        height : "20"
    });

    // Video popup jquery
    jQuery("a.demo").YouTubePopUp();

    // Parallax background
    $('.jarallax').jarallax({
            speed: 0.5
    })

    // CounterUp
    $('.numbar-counter').countUp();

    // Filtering
    var filterizd = $('.filtr-container').filterizr({
       //options object
    });
    


})(window.jQuery);