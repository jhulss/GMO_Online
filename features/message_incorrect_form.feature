Feature: As an user and shopper  
  I want the system to correctly calculate the total cost of the quantity of every product.  
  so I can watch and confirm the final amount I need to pay before completing the purchase.

Background:
    Given I am at GMO home page
    When I click the "Enter GMO Online" button

Scenario Outline: Fill the form with a negative number for one product
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then A popup appears displaying "Please enter only digits in this field."
  Examples:
    | product                | input        |   
    | 3 Person Dome Tent     | -1           | 

Scenario Outline: Fill the form with negative numbers
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then A popup appears displaying "Please enter only digits in this field."
  Examples:
    | product                | input        |   
    | 3 Person Dome Tent     | -1           | 
    | External Frame Backpack| -1           |  
    | Glacier Sun Glasses    | -1           | 
    | Padded Socks           | -1           | 
    | Hiking Boots           | -1           |  
    | Back Country Shorts    | -1           |

Scenario Outline: Fill the form with only one character
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then A popup appears displaying "Please enter only digits in this field."
  Examples:
    | product                | input        |   
    | 3 Person Dome Tent     | a            | 
    | External Frame Backpack| b            |  
    | Glacier Sun Glasses    | c            | 
    | Padded Socks           | d            | 
    | Hiking Boots           | e            |  
    | Back Country Shorts    | f            |

Scenario Outline: Fill the form with any character or string
  And I enter "<input>" in the input field "<product>"
  When I click on the "Place an order" Button
  Then A popup appears displaying "Please enter only digits in this field."
  Examples:
    | product                | input        |   
    | 3 Person Dome Tent     | one          | 
    | External Frame Backpack| seven        |  
    | Glacier Sun Glasses    | three03      | 
    | Padded Socks           | wasd         | 
    | Hiking Boots           | cero         |  
    | Back Country Shorts    | 20twenty20   |