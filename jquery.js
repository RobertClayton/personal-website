$(document).mousemove(function(mouse){
  var query = $('#sidebar');
  var isVisible = query.is(':visible');
  if (isVisible === true) {
    console.log("sidebar active")
    var xPostition = (mouse.pageX - 175)
  } else {
    var xPostition = mouse.pageX
    console.log("sidebar not visible")
  }
  var yPostition = mouse.pageY

  $("#phone").css({left:xPostition , top:yPostition});

  phoneWidth = document.getElementById('phone').width
  phoneHeight = document.getElementById('phone').height
  backgroundHeight = document.getElementById('colour-background').height
  backgroundWidth = document.getElementById('colour-background').width

  topParam = yPostition - (phoneHeight / 3.4)
  bottomParam = backgroundHeight - yPostition - (phoneHeight / 3.5)
  leftParam = xPostition - (phoneWidth / 2.1)
  // leftParam = xPostition - (phoneWidth / 1.03)
  rightParam = backgroundWidth - xPostition - (phoneWidth / 2.2)
  // rightParam = backgroundWidth - xPostition - (phoneWidth / 6)

  console.log(backgroundWidth)

  $("#colour-background").css('-webkit-clip-path', 'inset('+topParam+'px '+rightParam+'px '+bottomParam+'px '+leftParam+'px)');
});

$(document).ready(function () {
  // $('#sidebarCollapse').on('click', function () {
  //     $('#sidebar').toggleClass('active');
  // });

  // $("#sidebar").mCustomScrollbar({
  //   theme: "minimal"
  // });


});
