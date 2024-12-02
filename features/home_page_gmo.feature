Feature: Homepage navigation
         As an Internet user
         I want to enter GMO OnLine
         So I can verify that it loads and displays correctly

Scenario: Check homepage functionality
         Given I access the Google homepage
         Then I should see the text "Welcome to Green Mountain Outpost"
         And the main header must show "GMO OnLine"
         And the buttons labeled "Enter GMO OnLine" and "About The GMO Site" should appear
