Feature: As an user and shopper  
  I want the system to correctly calculate the total cost of the quantity of every product.  
  so I can watch and confirm the final amount I need to pay before completing the purchase.

Background:
    Given I am at GMO home page
    When I click the "Enter GMO Online" button

Scenario Outline: Add quantity of single product
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for "<product>" as "<expected_price>" 
  Examples:
    | product                | input | expected_price |
    | 3 Person Dome Tent     | 1     | 299.99         |

Scenario Outline: Fill the quantity of a single product
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for "<product>" as "<expected_price>"
  Examples:
    | product                | input | expected_price |   
    | 3 Person Dome Tent     | 1     | 299.99         |
    | External Frame Backpack| 1     | 179.95         |
    | Glacier Sun Glasses    | 1     | 67.99          |
    | Padded Socks           | 1     | 19.99          |
    | Hiking Boots           | 1     | 109.90         |
    | Back Country Shorts    | 1     | 24.95          |

Scenario Outline: Add quantity with varying inputs for a single product
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for "<product>" as "<expected_price>" 
  Examples:
    | product                | input | expected_price |   
    | 3 Person Dome Tent     | 4     | 1199.96        |
    | External Frame Backpack| 2     | 359.90         |
    | Glacier Sun Glasses    | 5     | 339.95         |
    | Padded Socks           | 20    | 399.80         |
    | Hiking Boots           | 10    | 1099.00        |
    | Back Country Shorts    | 14    | 349.30         |

Scenario Outline: Add a lot quantity of diverse products
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for "<product>" as "<expected_price>"
  Examples:
    | product                | input | expected_price |   
    | External Frame Backpack| 30    | 5398.50        | 
    | Glacier Sun Glasses    | 450   | 30595.50       |
    | Hiking Boots           | 300   | 32970.00       | 
    | Back Country Shorts    | 20    | 499.00         |

Scenario Outline: Add quantity of multiple diverse products
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for "<product>" as "<expected_price>"
  Examples:
    | product                | input | expected_price |   
    | 3 Person Dome Tent     | 3     | 899.97         |
    | Glacier Sun Glasses    | 2     | 135.98         |
    | Hiking Boots           | 4     | 439.60         | 
    | Back Country Shorts    | 6     | 149.70         |

