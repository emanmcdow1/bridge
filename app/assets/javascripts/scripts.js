$( document ).ready(function() {

  aside = false;
  var i = 0;
  var j = 0;
  var hvr = false;
  var first = true;
  var mobile = false;
  let moving = false;

  //var outerPane = $details.find(".details-pane-outer"),
  didScroll = false;

  $(window).scroll(function() {
      didScroll = true;
  });

  positionBLK = ($('.active').position().left)+(($('.active').width())/2)-($('.blk').width()/2);
  $('.blk').css('left', positionBLK);
  $('#suprise .active').slideUp('fast');
  $("#suprise a:not('.active')").css('display', 'none');


  var animatebar = function(){


    if ((didScroll || hvr) && !mobile && !moving) {
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
        moving = true;
      };
      if(scroll > 25 && hvr){
        $('.blkbox').stop().animate({backgroundColor: "rgba(0,0,0,.5)"}, 600);
        $('#links').each(function(){
          $(this).stop().slideDown("fast");
        });
        $('.blk').stop().animate({left: positionBLK}, 1100);
        $('#suprise .active').slideUp('fast');
        hvr = false;
        moving = true;
      }else if(scroll > 25 && !hvr){
        $('.blkbox').stop().animate({backgroundColor: "rgba(0,0,0,0)"}, 600);
        $('#links').each(function(){
          $(this).stop().slideUp("fast");
        });
        $('.blk').stop().animate({left: "79.3vw"}, 1100);
        $('#suprise .active').stop().slideDown('fast');
        moving = true;
      };
    };
    var def = new $.Deferred();
     def.resolve(false);
     return def;

  };

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

    animatebar().done(function(){moving = false;});

  }, 700);

  if(($(window).width() < 700)&& first){
    $('#top').slideUp();
    first = false;
    mobile = true;
  };

  var down = false;
  $('#hamburg').unbind('click').click(function(){
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
