$(document).ready(function() {

  $('.line').each(function(){

    // Get all the marginalia spans.
    var marginalia = $(this).children('.marginalia');

    // Hide the marginalia to start, then loop through each.
    marginalia.hide().each(function() {

      // Get the second class value, so we can associate a specific
      // marginalia to an icon.
      var classValue = $(this).attr('id');


      // Create an div with class 'icon' and append to the line.
      
      //var icon = '<div class="icon ' + classValue + '">' + classValue.charAt(0) + '</div>';
      var icon = '<div class="icon ' + classValue + '">' + classValue.slice(0,2) + '</div>';
      $(this).parent().append(icon);
    });
  });

  // When we click on the icon, we'll toggle the view of its associated
  // marginalia.
  $('.icon').click(function() {
    var marginaliaId = '#' + $(this).attr('class').split(' ')[1];
    $(marginaliaId).toggle();
  });


});
