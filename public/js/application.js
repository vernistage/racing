var up = 38;
var down = 40;
var upCount = 0;
var downCount = 0;
var winner = undefined;

$(document).ready(function() {
  $(document).on('keydown', function(event) {
    var boardEnd = $('td').length/2;
      if (event.which === up) {
        var $t = $('td.active1')
        $t.removeClass('active1');
        $t.next().addClass('active1');
        upCount += 1;
      } else if (event.which === down) {
        var $t = $('td.active2')
        $t.removeClass('active2');
        $t.next().addClass('active2');
        downCount += 1;
      };
    if (upCount === boardEnd) {
      winner = "winner=1"
      var self = $(this)
       $.ajax({
          method: 'PATCH',
          url: $t.context.URL,
          data: winner
       }).done(function(response){
          object = JSON.parse(response);
          $('.announcement').append("<h2> Congratulations, " + object.winner + "!!</h2>")
       })
    } else if (downCount === boardEnd) {
      winner = "winner=2"
       $.ajax({
          method: 'PATCH',
          url: $t.context.URL,
          data: winner
       }).done(function(response){
          object = JSON.parse(response);
          $('.announcement').append("<h2> Congratulations, " + object.winner + "!!</h2>")
       })
    };
  });

});
