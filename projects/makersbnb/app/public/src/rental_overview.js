$(document).ready(function(){

  $.get('/rental/current_view', function(rental){
    var available
    (rental[0]['user']['available']) ? available = 'Yes' : available = 'No';

    $('#rental-image').append("<span class='image'> <f href=\"#\"> <img style='width:200px; height:120px;' src= "+ rental[0]['images']['source']['source']['url'] +"/></f></span>")
    $('#rental-name').append("<span class='name'>"+ rental[0]['user']['name'] +"</span>")
    $("#rental-location").append("<span class='location'>" + rental[0]['user']['location'] + "</span>")
    $("#rental-price").append("<span class='price'>" + rental[0]['user']['price'] + "</span>")
    $("#rental-capacity").append("<span class='capacity'>" + rental[0]['user']['capacity'] + "</span>")
    $("#rental-available").append("<span class='available'>" + available + "</span>")
    // $("#rental-booking-button").append("<form class='bookButton' action='/rental/book' method='post'><input id='startDate' name='startDate'/><button type='submit'>Book</button></form>")
    $("#rental-description").append("<span class='description'>" + rental[0]['user']['description'] + "</span>")
    $("#rental-review").append("<span class='review'>" + rental[0]['user']['description'] + "</span>")

  });

  // var start = $( "#startPicker" ).value
  $( function() {
    $( "#startDate" ).datepicker();
    // $("#startDate").val(start)
  } );
  $( function() {
    $( "#endDate" ).datepicker();
  } );



  // $("#increaseTemperature").on('click', function() {
  //   $("#increaseTemperature").html(thermostat.increaseTemperature());
  //   $("#temperature").html(thermostat.temperature);
  //   $("#energyUsage").html(thermostat.energyUsage());
  //   saveData()
  //   $("#resetTemperature").fadeIn(100)
  // })

});
