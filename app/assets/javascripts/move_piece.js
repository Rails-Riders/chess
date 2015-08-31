<br />
<div class="booyah-box col-xs-10 col-xs-offset-1"> 
  <div class="game-container">
    <h1>Have Fun</h1>
    <table class="chess-board">
      <tbody>
        <% 8.downto(1) do |row| %>
          <tr>
            <% 1.upto(8) do |col| %>
              <td class= "<%= board_squares(row) %> droppable" data-square-row="<%= row %> " data-square-col="<%= col %>">            
                <%  @pieces.detect do |piece| %>
                  <% if piece.x_position == col && piece.y_position == row %>
                  <div class="draggable piece color_<%= piece.color %>" data-piece-id="<%= piece.id %>" data-piece-starting-row="<%= row %>" data-piece-starting-col="<%= col %>">
                    <%= piece_color(piece) %>
                     </div>
                  <% end %>
                <% end %>
              </td>
            <% end %>
          </tr>
        <% end %>
      </tbody>
    </table>
       <br />
  <%= link_to 'Sign In', new_user_session_path %>
    </div>
</div>