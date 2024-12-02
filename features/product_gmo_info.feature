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
