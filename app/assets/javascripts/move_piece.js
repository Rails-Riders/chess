$(document).ready(function() {
  if ($(".chess-board").length == 0) {
    return;
  }

  $( ".draggable" ).draggable();


  $( "td" ).droppable({
    drop: function( event, ui ) { 
      var startRow  = $(this).data("square-row");
      var startCol  = $(this).data("square-col");
      var pieceId   = $(ui.draggable).data("piece-id");
      var newRow    = $(ui.draggable).data("piece-start-row");
      var newCol    = $(ui.draggable).data("piece-start-col");
      var piece     = $(ui.draggable);
      var newSquare = $(this);

      console.debug("The piece to move has an id of: "+pieceId+".");
      console.debug("The square to move to is on row: "+startRow+" and col: "+startCol+".");

      $.ajax({
        method: 'put',
        url: "/pieces/" + pieceId,
        data: { y_position: startRow, x_position: startCol }
      }).done(function() {
        console.debug("it worked! valid move")
        newSquare.append(piece.css('position','static'));
      }).fail(function() {
        // console.debug("the world hates me")
        // move piece back - invalid move
      });
      
    } //drop
  }); //droppable
});