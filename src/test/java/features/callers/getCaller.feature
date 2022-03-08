Feature: get caller
  Background:
    * url baseUrl
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
    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
    * set requestPayload.email = randomEmail
    * print requestPayload

    Scenario: create user
      Given path '/public/v1/users'
      And header Authorization = 'Bearer ' + tokenID
      And request requestPayload
      When method POST
      Then status 201
      And match $.data.id == '#present'
      * print 'print after get ', response