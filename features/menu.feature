Feature: There should be a navigation menu

  In order to be able to easily navigate the site
  As a paleo fan
  I want top navigation

  Scenario: Home page should have top links
    Given I am on the home page
    I should see "home" within "#links"
    And I should see "search" within "#links"

