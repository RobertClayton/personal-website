$(document).mousemove(function(mouse){
    var leftPostition = mouse.pageX
    var rightPostition = mouse.pageY
    console.log(leftPostition)
    $("#phone").css({left:leftPostition , top:rightPostition});
    // $('#phone').animate({'marginLeft' : 50%});
    // $( "#phone" ).position({
    //   my: "left+0 bottom+0",
    //   of: mouse,
    //   collision: "fit"
    // });
});
