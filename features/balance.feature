Feature: Verify text fields and balance calculation 
  As an end user
  I want to verify the right count of values appear on the screen
            verify the values on the screen are greater than 0
            verify the total balance is correct based on the values listed
            verify the values are formatted as currencies
            verify the total balance matches the sum of the values

  Scenario: Verify balance page
    Given I navigate to the page on Chrome
    When the page is loaded
    Then verify the text fields and total balance are correct
