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

  // Hides/Shows all of the non-unique employees
  // TODO: combine methods so that they are DRY
  $('#unique_employees').on('click', function() {
    var currentState = this.textContent;

    if (currentState === 'Unique employees') {
      $(this).text('All employees');

      var employees = $('.td-employee-name');
      var uniqueEmployees = [];

      employees.each(function() {
        var employeeName = this.textContent;

        if (uniqueEmployees.indexOf(employeeName) !== -1) {
          $(this).parent().hide();
        } else {
          uniqueEmployees.push(employeeName);
        }
      });
    } else {
      $(this).text('Unique employees');
      $('.td-company-names').parent().show();
    }
  });

});
