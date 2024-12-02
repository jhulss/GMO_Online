Feature: As an user and shopper  
  I want the system to correctly calculate the total cost of the quantity of every product.  
  so I can watch and confirm the final amount I need to pay before completing the purchase.

Background:
    Given I am at GMO home page
    When I click the "Enter GMO Online" button

Scenario Outline: Add quantity of single products
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for each item
  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 1     | 

Scenario Outline: Fill the quantity of a single product
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for each item
  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 1     | 
    | External Frame Backpack| 1     |  
    | Glacier Sun Glasses    | 1     | 
    | Padded Socks           | 1     | 
    | Hiking Boots           | 1     |  
    | Back Country Shorts    | 1     |

Scenario Outline: Add quantity with varying inputs for a single product
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for each item
  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 4     | 
    | External Frame Backpack| 2     |  
    | Glacier Sun Glasses    | 5     | 
    | Padded Socks           | 20    | 
    | Hiking Boots           | 10    |  
    | Back Country Shorts    | 15    |

Scenario Outline: Add a lot quantity of diverse products
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for each item
  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 25    | 
    | External Frame Backpack| 30    |  
    | Glacier Sun Glasses    | 450   | 
    | Padded Socks           | 45    | 
    | Hiking Boots           | 300   |  
    | Back Country Shorts    | 20    |

Scenario Outline: Add quantity of multiple diverse products
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then I verify the total price for each item
  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 3     | 
    | Glacier Sun Glasses    | 2     | 
    | Hiking Boots           | 4     |  
    | Back Country Shorts    | 6     |

