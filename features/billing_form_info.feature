Feature: Streamlined purchase flow for Green Mountain Outpost
  As a customer,
  I want to select products, review my order,
  and complete the checkout process smoothly.
  

Background:
    Given I am at GMO home page
    When I click the "Enter GMO Online" button


  Scenario: Purchase a single product
    When I input "1" in the quantity field for "3 Person Dome Tent"
    And I proceed by clicking the "Place An Order" button
    Then the "Place Order" page should appear
    And I click the "Proceed With Order" button on the page
    Then the "Billing Information" page should be displayed
    And I complete the billing form with the following details:
      | Field       | Value                  |
      | Name        | Juan Pérez             |
      | Address     | Calle Ficticia 123     |
      | City        | Ciudad Imaginaria      |
      | State       | Estado Ficticio        |
      | Zip         | 12345                  |
      | Phone       | 555-123-4567           |
      | E-mail      | juan.perez@ejemplo.com |
      | Card Type   | American Express       |
      | Card Number | 3782-8224-6310-005     |
      | Expiration  | 12/25                  |
    And I check the box "Same as"
    When I finalize the purchase by clicking "Place The Order" button
    Then I should see the receipt page with the following details:
     | Field        | Value                   |
      | Bill to      | Juan Pérez, Calle Ficticia 123, Ciudad Imaginaria, Estado Ficticio 12345 |
      | Ship to      | Juan Pérez, Calle Ficticia 123, Ciudad Imaginaria, Estado Ficticio 12345 |
      | Product      | 3 Person Dome Tent      |
      | Qty          | 1                       |
      | Unit Price   | $ 299.99                |
      | Total Price  | $ 299.99                |
      | Grand Total  | $ 319.99                |