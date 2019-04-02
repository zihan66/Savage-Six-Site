Feature: User can search the directory page
  Scenario: search for a user
    Given I am on the directory page
    When I fill in search bar with "thisuserdoesnotexist"
    And I press "Search"
    Then I should be on the search results page and no user should be found