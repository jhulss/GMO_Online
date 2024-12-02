Feature: As a user and shopper  
  I want the GMO to calculate and show me the total cost when I place an order.  
  So that I can confirm the final amount I need to pay before completing the order.

Background:
    Given I am at GMO home page
    When I click the "Enter GMO Online" button

Scenario: Enter quantities for one product
    And I fill in the product quantities in the table

    | product                | input    |   
    | Glacier Sun Glasses    | 1        |  

    When I click on the "Place an order" Button
    Then I should see the Product Total
    And I should see the correct Sales Tax
    And I should see the Shipping & Handling
    And I should see the Grand Total

Scenario: Enter quantities for two products
    And I fill in the product quantities in the table

    | product                | input    |   
    | External Frame Backpack| 2        |  
    | Glacier Sun Glasses    | 5        |  

    When I click on the "Place an order" Button
    Then I should see the Product Total
    And I should see the correct Sales Tax
    And I should see the Shipping & Handling
    And I should see the Grand Total

Scenario: Enter quantities for a selection of six products
    And I fill in the product quantities in the table

    | product                | input    |    
    | External Frame Backpack| 4        |  
    | Glacier Sun Glasses    | 6        | 
    | Padded Socks           | 3        | 
    | Hiking Boots           | 7        |  
    | Back Country Shorts    | 10       |

    When I click on the "Place an order" Button
    Then I should see the Product Total
    And I should see the correct Sales Tax
    And I should see the Shipping & Handling
    And I should see the Grand Total
