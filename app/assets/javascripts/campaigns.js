$(document).ready(function() {

  // Hides/Shows all of the non-unique businesses
  $('#unique_businesses').on('click', function() {
    var currentState = this.textContent;

    if (currentState === 'Unique businesses') {
      $(this).text('All businesses');

      var businesses = $('.td-company-names');
      var uniqueBusinesses = [];

      businesses.each(function() {
        var businessName = this.textContent;

        if (uniqueBusinesses.indexOf(businessName) !== -1) {
          $(this).parent().hide();
        } else {
          uniqueBusinesses.push(businessName);
        }
      });
    } else {
      $(this).text('Unique businesses');
      $('.td-company-names').parent().show();
    }
  });

  $('#unique_employees').on('click', function() {
    
  });
});
