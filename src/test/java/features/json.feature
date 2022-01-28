Feature: json feature testing
  Scenario: json reader parser scenario
    * def jsonObject =
    """
    [
    {
      "email" : "yassine@mail.com",
      "password" : "11111"
    },

    {
      "email" : "mail2@mail.com",
      "password" : "2222"
    },

    {
      "email" : "mail3@mail.com",
      "password" : "33333"
    }
    ]



    """
    
    * print jsonObject[0].password

  Scenario: complex json reader
    * def jsonObject =
    """
    {
	"items":
		{
			"item":
				[
					{
						"id": "0001",
						"type": "donut",
						"name": "Cake",
						"ppu": 0.55,
						"batters":
							{
								"batter":
									[
										{ "id": "1001", "type": "Regular" },
										{ "id": "1002", "type": "Chocolate" },
										{ "id": "1003", "type": "Blueberry" },
										{ "id": "1004", "type": "Devil's Food" }
									]
							},
						"topping":
							[
								{ "id": "5001", "type": "None" },
								{ "id": "5002", "type": "Glazed" },
								{ "id": "5005", "type": "Sugar" },
								{ "id": "5007", "type": "Powdered Sugar" },
								{ "id": "5006", "type": "Chocolate with Sprinkles" },
								{ "id": "5003", "type": "Chocolate" },
								{ "id": "5004", "type": "Maple" }
							]
					}

				]
		}
}

    """
    
    * print jsonObject.items.item[0].batters.batter[0].type + " " + jsonObject.items.item[0].batters.batter[1].type