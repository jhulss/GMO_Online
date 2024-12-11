Feature: Interact with the Browser Test page on the GMO site
    As a user
    I want to test various browser features
    So I can validate the functionality of the page

    Background:
        Given I am on the Green Mountain Outpost browser test page

    Scenario: Validate the "Left or Right" button functionality
        When I click on the "Left or Right" button
        Then I should see an alert displaying the text "This button AND the GMO image should be on the right edge of the page!"
        And the page title should be "Browser Test Page"

    Scenario: Validate the header text on the Browser Test page
        When I verify the page layout
        Then the page should display the header "All Browsers Are Not Created Equal"
        And the page title should be "Browser Test Page"

    Scenario: Verify the technologies listed for Internet Explorer 3.0
        When I scroll to the technologies section
        Then the technologies listed for Internet Explorer 3.0 should include:
        | dot bullets           |
        | circle bullets        |
        | square bullets        |

    Scenario: Validate the footer content
        When I scroll to the footer section
        Then the footer should contain the text "This is a sample web site for demonstration purposes only!\nNo products will be sent to you."

    Scenario: Verify the title displayed inside the body
        When I check the body title
        Then the page should display the title "All Browsers Are Not Created Equal" inside the body

    Scenario: Verify the marquee text
        When I observe the moving text
        Then I should see the text "Sometimes Even Left and Right Doesn't Mean Anything" moving from right to left
