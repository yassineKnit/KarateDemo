Feature: random email post request
  Background: 
    * url 'https://gorest.co.in'
    * def generateEmail =
    """
    function(s){
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for(var i=0;i<s;i++){
        text += pattern.charAt(Math.floor(Math.random() * pattern.length));

      }
      return text + "@mail.jp";

    }
    """
    * def randomEmail = generateEmail(6)
    * print randomEmail
    * def requestPayload = 
    """
    {

    "name": "shiroe boooy",
    "gender": "male",
    "status": "active"
    }
    """

    * set requestPayload.email = randomEmail
    * print requestPayload

    Scenario: create user with post request using email generator
      Given path '/public/v1/users'
      And request requestPayload
      And header Authorization = 'Bearer ' + tokenID
      When method POST
      Then status 201
      And match $.data.email == randomEmail
