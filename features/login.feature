Feature: The login page should let the user login
  Scenario: login with valid credentials
    Given I am on the login page
    When I fill in email with "fdsa@fdsa.com"
    And I fill in password with "Password"
    And I press "Log in"
    Then I should be on the users home page