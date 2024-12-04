Feature: Enter the About The GMO Site to know about the page
            As a user
            I want to click "About The GMO Site" on the homepage
            So I can access the about page and know more about the page

 Scenario: Access the About page from the homepage
            When I click on the "About The GMO Site" link
            Then I should be redirected to the About page
            And I should see information about the GMO site

 Scenario: Validate the details on the "About This Site" page
            Given the user has navigated to the "About This Site" page
            Then the title of the page should be "About This Site"
            And the subtitle should state:
            """
            This is a sample online commerce application. It is not real. Green Mountain Outpost is a fictitious company. Any resemblance to actual companies, either living or dead, is purely coincidental.
            """
            And the security warning should display:
            """
            For your privacy and security, DO NOT ENTER REAL BILLING OR SHIPPING INFORMATION
            """
            And the page should list the incorporated technologies:
            | HTML 3.2                 |
            | HTML Browser Extensions  |
            | Animation                |
            | JavaScript               |
            | CGI                      |
            | Java                     |
            | ActiveX                  |
            | Client-side processes    |
            | Server-side processes    |

            And the page should list possible future technologies:
            | Style sheets           |
            | Multimedia             |
            | VBscript               |
            | Plug-Ins               |
            | IIOP                   |
            | Cookies                |
            | Secure transactions    |
            | Database access        |

            And the footer should contain a disclaimer stating:
            """
            This is a sample web site for demonstration purposes only!
            No products will be sent to you.
            """