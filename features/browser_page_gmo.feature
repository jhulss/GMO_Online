Feature: Validate Green Mountain Outpost page functionality
  As a user
  I want to interact with elements on the Green Mountain Outpost page
  So that I can verify their functionality

  Scenario: Click on the Left or Right button and verify alert
    Given I am on the Green Mountain Outpost page
    When I click on the "Left or Right" button
    Then I should see an alert displaying the text "This button AND the GMO image should be on the right edge of the page!"

  Scenario: Verify the page header
    Given I am on the Green Mountain Outpost page
    Then the page should display the header "All Browsers Are Not Created Equal"

  Scenario: Verify technologies displayed for Internet Explorer 3.0
    Given I am on the Green Mountain Outpost page
    Then the technologies listed for Internet Explorer 3.0 should include:
      | dot bullets   |
      | circle bullets|
      | square bullets|

  Scenario: Verify the footer disclaimer text
    Given I am on the Green Mountain Outpost page
    Then the footer should contain the text "This is a sample web site for demonstration purposes only!"

  Scenario: Verify that the page title is correct
    Given I am on the Green Mountain Outpost page
    Then the page title should be "Browser Test Page"
