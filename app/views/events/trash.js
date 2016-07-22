
  <%= content_for(:after_js) do %>
      <script>
        $(document).ready(function(){
          $('.event-card').draggable();
          $('#swipe-no').droppable({
            drop: function(event, ui) {
              $('.active-card').hide();
              var event_id = $('.active-card').attr("data-id");
               $.ajax({
                  url:  "/couples/"+ '<%= current_couple.id %>' +"/events/"+ event_id +"/swipeleft",
                  type: 'POST',
                  dataType: "json",
                  success: function(data) {
                    console.log(data["current_swipe"]);
                  }
                });
              location.reload();
            }
          });
          $('#swipe-yes').droppable({
            drop: function(event, ui) {
              $('.active-card').hide();
              var event_id = $('.active-card').attr("data-id");
              $.post( "/couples/"+ '<%= current_couple.id %>' +"/events/"+ event_id +"/swiperight", function( data ) {
                  if (data["current_swipe"]["participation"] == true) {
                    if (confirm("it's a match !!!") == true) {
                      location.reload();
                    }
                  }
                location.reload();
              });

            }
          });
        });
      </script>
    <% end %>
