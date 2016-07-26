// // Nos steps qui deconnent
//           $(".next_step").on("click", function(event){
//             event.preventDefault();
//             var button = jQuery(this);
//             button.parent().slideUp( "slow", function() {
//               done:  button.parent('div').addClass('hide');
//             });

//             button.parent('div').next().removeClass('hide');
//           })

//           $(".previous_step").on("click", function(event){
//             event.preventDefault();
//             var button = jQuery(this);
//             button.parent().slideUp( "slow", function() {
//               done:  button.parent('div').addClass('hide');
//             });

//             console.log(button.parent('div').prev());
//             button.parent('div').prev().removeClass('hide');
//           })
























 $( document ).ready(function() {

    $('input:radio').removeAttr('checked');

    $(window).keydown(function(event){
      if (event.keyCode == 13)  {
        event.preventDefault();
        console.log('enter');
      }
    });

    $.fn.moveMid = function(){
      console.log('move mid')
      $(this).addClass('mid-pos')
    };

    $.fn.moveTop = function(){
      console.log('move top');
      $(this).addClass('top-pos');
    };

    $('fieldset input:text').focus(function() {
      $(this).parent().moveMid();
      $(this).parent().prev().moveTop();
    });


    $('fieldset input:submit').focus(function() {
      $(this).parent().moveMid();
      $(this).parent().prev().moveTop();
    });

    $('fieldset').first().moveMid();
    $('fieldset input:text').first().focus();




    $('.next-button').click(function () {
      console.log('click click normal')
      if (_.isEmpty($(this).parent().children('input').val())) {
        console.log("warning")
      }
      else {
        $(this).parent().moveTop();
        $(this).parent().nextAll(":visible").first().moveMid();
        $(this).parent().nextAll(":visible").first().children('input').focus();
        preview_data = ($(this).parent().children('input').val());
        preview_label = ($(this).parent().children('label').text());
        if (_.isEmpty(preview_data)) {
          $('#preview-infos').append('<li class="preview-data"> Information manquante </li>')
        }
        else {
          $('#preview-infos').append('<li class="preview-data" data-name="' + $(this).parent().children('input').attr('name') +'">' + '<span class="preview-label">' +  preview_label + ':' + '</span>' + preview_data +  '<i class="fa fa-pencil" aria-hidden="true"></i>' + '</li>')
        };

      }
    });



    $('.next-button-radio').click(function () {
      console.log('click click radio')
      var radio_id =  $(this).parent().find('input:checked').attr('id')
      if ($('#' + radio_id).parent().hasClass('no_sublevel')) {
        console.log('found u no sublevel')
        $(this).parent().moveTop();
        $(this).parent().nextAll(":visible").first().moveMid();
      }
      else {
        $(this).parent().moveTop();
        $('.' + radio_id).show("fast", function() {
          $(this).moveMid();
        });
      }
      preview_data = ($(this).parent().find('input:checked').val());
      $('#preview-infos').append('<li class="preview-data">' + preview_data +'</li>')

    });

      $('.next-button-upload').click(function () {
        console.log('click click normal')
        $(this).parent().moveTop();
        $(this).parent().nextAll(":visible").first().moveMid();
      });




    $('#preview-infos').on('click', "li", function() {
      console.log("click preview data", $("input[name='" + $(this).data("name") + "']"));
      if  ($("input[name='" + $(this).data("name") + "']")) {
        console.log("found you again")
      }
    })


});
