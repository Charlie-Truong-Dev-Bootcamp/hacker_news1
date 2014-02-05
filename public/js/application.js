$(document).ready(function() {





  $(".up").click(function(){
    var id = $(this).val();

    console.log(this);

    var that = this;
    var route = define_route();
    $.post(route + id,{vote: true},function(response){
      $(that).html(response.up_votes);
      $(".down[value="+id+"]").html(response.down_votes);
    }, "json");
  });


  $(".down").click(function(){
    var id = $(this).val(); //this is an id number
    var that = this; //where we are at...the button..the thing we are referencing
    var route = define_route(); //where we are posting to
    $.post(route + id,{vote: false},function(response){ //ajax post request
      $(that).html(response.down_votes); //.html is the text inside of the button
      $(".up[value="+id+"]").html(response.up_votes);
    }, "json");
  });



});

var define_route = function(){
  if (window.location.href.split("/")[3] === "comments"){
    return "/comment_vote/"
  }
  else{
    return "/post_vote/"
  }
}
