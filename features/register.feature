Feature: The create account page should have verification on all the fields
  Scenario: User can create an account
    Given I am on the new page
    When I fill out the form
    Then a new account should be created