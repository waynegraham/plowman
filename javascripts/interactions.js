$(document).ready(function() {

  var arr = ['Cr', 'KD'];

  var Label = {
    labelize: function(label) {
      if ($.inArray(label, arr)) {
        label = label.charAt(0);
      }

      return label;
    }
  };

  $('.line').each(function() {

    // Get all the marginalia spans.
    var marginalia = $(this).children('.marginalia');

    // Hide the marginalia to start, then loop through each.
    marginalia.hide().each(function() {

      // Get the second class value, so we can associate a specific
      // marginalia to an icon.
      var classValue = $(this).attr('id');
      var label = classValue.slice(0, 2);

      //console.log(label);


      // Create an div with class 'icon' and append to the line.
      //var icon = '<div class="icon ' + classValue + '">' + classValue.charAt(0) + '</div>';
      var icon = '<div class="icon ' + classValue + '">' + Label.labelize(label); + '</div>';
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
