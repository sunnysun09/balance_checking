# balance_checking

This is the test project to verify the balance page data.

Project files:

balance_checking
        |--- README.md                       this file
        |--- features
             |--- balance.feature            feature file
             |--- TestForm.html              example page that will be tested
             |--- support
                  |--- env.rb                instantiate a new chrome browser
                  |--- balance_detail.rb.    tests using Page Object Model
             |--- step_definitions
                  |--- balance_steps.rb      step file
  
Setup:

The project is using Cucumber, Ruby and Page Object Model to automate the test. The following steps are needed to install the required packages:
    1. Install Ruby+Devkit downloadable from http://rubyinstaller.org/downloads
    2. Install Cucumber by running "gem install cucumber" from command prompt
    3. Install Capybara by running "gem install capybara" from command prompt (Optional)
    4. Install Watir WebDriver by running "gem install water-webdriver" from command prompt 
    5. Install Page Object by running "gem install page-object" from command prompt
  
To run:

    On command prompt, go to balance_checking directory, run "./cucumber"

Example Output:

C:\test\balance>cucumber
Feature: Verify text fields and balance calculation
  As an end user
  I want to verify the right count of values appear on the screen
            verify the values on the screen are greater than 0
            verify the total balance is correct based on the values listed
            verify the values are formatted as currencies
            verify the total balance matches the sum of the values

  Scenario: Verify balance page                               # features/balance.feature:9
    Given I navigate to the page on Chrome                    # features/step_definitions/balance_steps.rb:1
    When the page is loaded                                   # features/step_definitions/balance_steps.rb:5
      Verify values appears
      Verify values are in currency format
      Verify values larger than 0
      Verify balance is right
    Then verify the text fields and total balance are correct # features/step_definitions/balance_steps.rb:9
      Total balance should be $997000.0, not $1000000.0 (RuntimeError)
      ./features/support/balance_detail.rb:56:in `verify_balance_correct'
      ./features/support/balance_detail.rb:73:in `verify_balance'
      ./features/step_definitions/balance_steps.rb:10:in `"verify the text fields and total balance are correct"'
      features/balance.feature:12:in `Then verify the text fields and total balance are correct'

Failing Scenarios:
cucumber features/balance.feature:9 # Scenario: Verify balance page

1 scenario (1 failed)
3 steps (1 failed, 2 passed)
0m5.554s
