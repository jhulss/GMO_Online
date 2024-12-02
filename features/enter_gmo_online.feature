Feature: Enter the GMO Online to explore the Catalog
         As a user
         I want to click "Enter GMO OnLine" on the homepage
         So I can access the catalog and verify its content
Scenario: Verify Online Catalog items
         Given I am at GMO home page
         When I click the "Enter GMO Online" button
         Then I should be redirected to the catalog page with the title "OnLine Catalog"
         And I should see a table of products with headers "Item Number", "Item Name", "Unit Price", and "Order Quantity"
         Then I see the GMO Online Catalog
             | Item Number | Item Name               | Unit Price | Order Quantity |
             | 1000        | 3 Person Dome Tent      | $299.99    | 0              |
             | 1001        | External Frame Backpack | $179.95    | 0              |
             | 1002        | Glacier Sun Glasses     | $67.99     | 0              |
             | 1003        | Padded Socks            | $19.99     | 0              |
             | 1004        | Hiking Boots            | $109.90    | 0              |
             | 1005        | Back Country Shorts     | $24.95     | 0              |

