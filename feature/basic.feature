Feature: basic
  Scenario: amazon
    Given a fixture app "basic-app"
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "hello"
    
