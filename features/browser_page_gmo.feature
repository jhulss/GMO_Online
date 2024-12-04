Feature: Validate Left or Right button functionality
  As a user
  I want to click the "Left or Right" button
  So that I can verify it shows an alert

  Scenario: Click on the Left or Right button and verify alert
    Given I am on the Green Mountain Outpost page
    When I click on the "Left or Right" button
    Then I should see an alert with the text "This button AND the GMO image should be on the right edge of the page!"
