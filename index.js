$(document).mousemove(function(mouse){
  var xPostition = mouse.pageX
  var yPostition = mouse.pageY

  $("#phone").css({left:xPostition , top:yPostition});

  phoneWidth = document.getElementById('phone').width
  phoneHeight = document.getElementById('phone').height
  backgroundHeight = document.getElementById('colour-background').height
  backgroundWidth = document.getElementById('colour-background').width

  topParam = yPostition - (phoneHeight / 3.4)
  bottomParam = backgroundHeight - yPostition - (phoneHeight / 3.5)
  leftParam = xPostition - (phoneWidth / 2.1)
  rightParam = backgroundWidth - xPostition - (phoneWidth / 2.2)

  console.log(backgroundHeight)

  $("#colour-background").css('-webkit-clip-path', 'inset('+topParam+'px '+rightParam+'px '+bottomParam+'px '+leftParam+'px)');
});
