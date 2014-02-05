$(document).ready(function() {





  $(".up").click(function(){
    var id = $(this).val();
    var that = this;
    var route = define_route();
    $.post(route + id,{vote: true},function(response){
      var new_count = response.votes;
      $(that).html(new_count);
    }, "json");
  });


  $(".down").click(function(){
    var id = $(this).val();
    var that = this;
    var route = define_route();
    $.post(route + id,{vote: false},function(response){
      var new_count = response.votes;
      $(that).html(new_count);
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
