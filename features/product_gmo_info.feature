Feature: View product details on the store
         As a potential buyer
         I want to review detailed information about a product
         So that I can make an informed decision about purchasing it

Scenario: Review details of the "External Frame Backpack" product
        Given the user has navigated to the product page
        Then they should see the product title as "External Frame Backpack"
        And the subtitle displayed as "Our most popular external frame backpack"
        And the price listed as "$ 179.95"
        And the available stock should indicate "8"
        And the item number should be "1001"
        And the product description should be:
        """
        An ideal pack for long trail trips, its strong heli-arc welded 6061-T6 aircraft-quality aluminum frame with V-truss design resists diagonal distortion. Thoughtful design allows head clearance when the bag is in lower position. Four outside pockets keep necessary gear and accessories within easy reach. Fully-adjustable suspension features curved, tapered shoulder straps with load-lift straps and sternum strap provide load carrying comfort. Hipbelt has generous padding. Two large main compartments; lower sleeping bag compartment has outside zip access. Extender bar and extension collar. Heavy-duty nylon ripstop packcloth. Made in USA.
        """

Scenario: Validate details of the "Back Country Shorts"
        Given the user has navigated to the product page
        Then the name of the product should be "Back Country Shorts"
        And the description should read "Our quick drying shorts are a customer favorite. Perfect for a day of any outdoor activity or just lounging around the camp."
        And the listed cost should be "$ 24.95"
        And the inventory level should indicate "59"
        And the identifier should be "1005"
        And the product description should state:
        """
        Lightweight nylon shorts can take on any activity and double as swimwear. Supplex nylon fabric is strong and dries quickly. Nylon liner dries quickly, allowing shorts to be used as swimwear. Two side pockets and one back zip pocket with mesh bottoms for drainage. Elasticised belt provides a comfortable, snug fit. Made in USA.
        """
