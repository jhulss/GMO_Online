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
    Then I should see the Product Total "67.99"
    And I should see the correct Sales Tax "3.40"
    And I should see the Shipping & Handling "5.00"
    And I should see the Grand Total "76.39"

Scenario: Enter quantities for two products
    And I fill in the product quantities in the table

    | product                | input    |   
    | External Frame Backpack| 2        |  
    | Glacier Sun Glasses    | 5        |  

    When I click on the "Place an order" Button
    Then I should see the Product Total "699.85"
    And I should see the correct Sales Tax "34.99"
    And I should see the Shipping & Handling "5.00"
    And I should see the Grand Total "739.84"

Scenario: Enter quantities for a selection of five products
    And I fill in the product quantities in the table

    | product                | input    |    
    | External Frame Backpack| 4        |  
    | Glacier Sun Glasses    | 6        | 
    | Padded Socks           | 3        | 
    | Hiking Boots           | 7        |  
    | Back Country Shorts    | 10       |

    When I click on the "Place an order" Button
    Then I should see the Product Total "2206.51"
    And I should see the correct Sales Tax "110.33"
    And I should see the Shipping & Handling "5.00"
    And I should see the Grand Total "2321.84"

Scenario: Enter quantities for a selection of multiple products
    And I fill in the product quantities in the table

    | product                | input    | 
    | 3 Person Dome Tent     | 700      |   
    | External Frame Backpack| 400      |  
    | Glacier Sun Glasses    | 550      | 
    | Padded Socks           | 900      | 
    | Hiking Boots           | 1100     |  
    | Back Country Shorts    | 12000    |

    When I click on the "Place an order" Button
    Then I should see the Product Total "757648.50"
    And I should see the correct Sales Tax "37882.43"
    And I should see the Shipping & Handling "5.00"
    And I should see the Grand Total "795535.93"