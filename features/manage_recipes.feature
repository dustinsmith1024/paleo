Feature: Manage recipes
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new recipe
    Given I am on the new recipe page
    When I fill in "Name" with "name 1"
    And I fill in "Instructions" with "instructions 1"
    And I uncheck "Approved"
    And I press "Create"
    Then I should see "name 1"
    And I should see "instructions 1"
    And I should see "false"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
  Scenario: Delete recipe
    Given the following recipes:
      |name|instructions|approved|
      |name 1|instructions 1|false|
      |name 2|instructions 2|true|
      |name 3|instructions 3|false|
      |name 4|instructions 4|true|
    When I delete the 3rd recipe
    Then I should see the following recipes:
      |Name|Instructions|Approved|
      |name 1|instructions 1|false|
      |name 2|instructions 2|true|
      |name 4|instructions 4|true|
