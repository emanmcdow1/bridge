document.addEventListener("DOMContentLoaded", function(event) {

aside = false;
var i = 0;
var j = 0;
var hvr = false;

//var outerPane = $details.find(".details-pane-outer"),
didScroll = false;

$(window).scroll(function() {
    didScroll = true;
});

var first = true;
var mobile = false;

  positionBLK = ($('.active').position().left)+(($('.active').width())/2)-($('.blk').width()/2);
  $('.blk').css('left', positionBLK);
  $('#suprise .active').slideUp('fast');
  $("#suprise a:not('.active')").css('display', 'none');

  setInterval(function() {

    $('.links').hover(function(){
      hvr = true
    });

    $('a').hover(function(){
      hvr = true
    });

    $('.blkbox').hover(function(){
      hvr = true
    });

    var scroll = $(window).scrollTop();


    if ( (didScroll || hvr)&& !mobile) {
        didScroll = false;
        //console.log(pACT);
        scroll = $(window).scrollTop();

        if(scroll < 25){
          $('.blkbox').stop().animate({backgroundColor: "rgba(0,0,0,0)"}, 600);
          $('#links').each(function(){
            $(this).stop().slideDown("fast");
          });
          $('.blk').stop().animate({left: positionBLK}, 1100);
          $('#suprise .active').stop().slideUp('fast');
        };
        if(scroll > 25 && hvr){
          $('.blkbox').stop().animate({backgroundColor: "rgba(0,0,0,.5)"}, 600);
          $('#links').each(function(){
            $(this).stop().slideDown("fast");
          });
          $('.blk').stop().animate({left: positionBLK}, 1100);
          $('#suprise .active').slideUp('fast');
          hvr = false;
        }else if(scroll > 25 && !hvr){
          $('.blkbox').stop().animate({backgroundColor: "rgba(0,0,0,0)"}, 600);
          $('#links').each(function(){
            $(this).stop().slideUp("fast");
          });
          $('.blk').stop().animate({left: "79.3vw"}, 1100);
          $('#suprise .active').stop().slideDown('fast');
        };

    };

  }, 700);

  if(($(window).width() < 700)&& first){
    $('#top').slideUp();
    first = false;
    mobile = true;
  };

  var down = false;
  $('#hamburg').click(function(){
    if(down){
      $('#hamburg').animate({
        top: "20vw"
      }, 400);
      down = false;
    }else{
      $('#hamburg').animate({
        top: "125vw"
      }, 400);
      down = true;
    }
    $('#top').slideToggle();
  });
});
