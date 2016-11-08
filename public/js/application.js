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
       $.ajax({
          method: 'PATCH',
          url: $t.context.URL,
          data: winner
       }).done(function(response){
        debugger
       })

      // AJAX request to send winner to Ruby, persist in database, then append winner on page in red
      // alert("Player 1 wins!!")
      // window.location.reload();
    } else if (downCount === boardEnd) {
      alert("Player 2 wins!!")
      window.location.reload();
    };
  });

});
