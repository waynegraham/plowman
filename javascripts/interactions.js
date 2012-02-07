$(document).ready(function() {
  $('.line').each(function(){

    // Get all the marginalia spans.
    var marginalia = $(this).children('.marginalia');

    // Hide the marginalia to start, then loop through each.
    marginalia.hide().each(function() {

      // Get the second class value, so we can associate a specific
      // marginalia to an icon.
      var classValue = $(this).attr('id').split('.')[0];

      // Create an div with class 'icon' and append to the line.
      var icon = '<div class="icon ' + classValue + '">' + classValue + '</div>';
      $(this).parent().append(icon);
    });
  });

  // When we click on the icon, we'll toggle the view of its associated
  // marginalia.
  $('.icon').click(function() {
    var classValue = $(this).attr('class').split(' ')[1];
    $(this).parent().children('.marginalia.' + classValue).toggle(); });
});
