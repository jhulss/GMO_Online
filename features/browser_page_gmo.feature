Feature: Interact with the Browser Test page on the GMO site
    As a user
    I want to test various browser features
    So I can validate the functionality of the page

    Background:
        Given I am on the Green Mountain Outpost browser test page

    Scenario: Validate the "Left or Right" button functionality
        When I click on the "Left or Right" button
        Then I should see an alert displaying the text "This button AND the GMO image should be on the right edge of the page!"
        And the page title should be "Browser Test"

    Scenario: Validate the header text on the Browser Test page
        When I verify the page layout
        Then the page should display the header "Browser Test"
        And the page title should be "Browser Test"

    Scenario: Verify the technologies listed for Internet Explorer 3.0
        When I scroll to the technologies section
        Then the technologies listed for Internet Explorer 3.0 should include:
        | Blinking Text         |
        | Rotating Images       |
        | Background Sounds     |
        | Custom Scrollbars     |

    Scenario: Validate the footer content
        When I scroll to the footer section
        Then the footer should contain the text "This is a sample site for demonstration purposes only!"

    Scenario: Verify the title displayed inside the body
        When I check the body title
        Then the page should display the title "Browser Test" inside the body

    Scenario: Verify the marquee text
        When I observe the moving text
        Then I should see the text "Welcome to the Browser Test page!" moving from right to left
