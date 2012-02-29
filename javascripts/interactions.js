$(document).ready(function() {

  var arr = ['Cr', 'KD', 'LP'];
  var arr2 = ['Cr1', 'Cr2', 'Cr3'];

  var Label = {
    labelize: function(label) {

      var two = label.slice(0, 2); // 2 chart version of label

      var l = ''; // return value

      // check if two character version is in arr array
      if ($.inArray(two, arr) > -1) {
        l = label.slice(0, 2);
      }

      // check three char array
      if ($.inArray(label, arr2) > -1) {
        l = label;
      }

      // check if they're in either
      if ($.inArray(two, arr) === -1 && $.inArray(label, arr2) === -1) {
        l = label.charAt(0);
      }

      return l;
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
      var label = classValue.slice(0, 3);


      // Create an div with class 'icon' and append to the line.
      var icon = '<div class="icon ' + classValue + '">';
      icon += Label.labelize(label); + '</div>';
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
