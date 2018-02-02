document.addEventListener("DOMContentLoaded", function(event) {
//**************Carousel
$('.carousel').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 3000,
  prevArrow:"<div class='a-left control-c prev slick-prev hvr-grow' src='' id='leftb'></div>",
  nextArrow:"<div class='a-right control-c next slick-next hvr-grow' src='' id='rightb'></div>"

});
});
