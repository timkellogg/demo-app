$(document).ready(function() {
  $('#hide_unprocessed').on('click', function() {
    var currentState = this.textContent;
    var companies = $('.td-company-processed');

    if (currentState === 'Hide unprocessed') {
      $(this).text('Show unprocessed');

      companies.each(function() {
        var processed = this.textContent;

        if (processed === 'No') {
          $(this).parent().hide();
        }
      });
    } else {
      $(this).text('Hide unprocessed');
      companies.each(function() {
        var processed = this.textContent;

        if (processed === 'No') {
          $(this).parent().show();
        }
      });
    }
  });

  // TODO: find a more elegant way to combine these two methods that are very similar
  // Shows/Hides the processed companies from the list
  $('#hide_processed').on('click', function() {
    var currentState = this.textContent;
    var companies = $('.td-company-processed');

    if (currentState === 'Hide processed') {
      $(this).text('Show processed');

      companies.each(function() {
        var processed = this.textContent;

        if (processed === 'Yes') {
          $(this).parent().hide();
        }
      });
    } else {
      $(this).text('Hide processed');
      companies.each(function() {
        var processed = this.textContent;

        if (processed === 'Yes') {
          $(this).parent().show();
        }
      });
    }
  });
});
