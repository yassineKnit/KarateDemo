Feature: post request with json file
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
    * def randomEmail = generateEmail(10)
    * print randomEmail
    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
    * set requestPayload.email = randomEmail
    * print requestPayload

  Scenario: Create user with post request from json file
    #1 : create user with post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.email == '#present'
    And match $.data.email == randomEmail
    * print response

    # fetch user id from post call response
    * def userId = $.data.id

    #2 : delete user by id
    Given path '/public/v1/users/' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method DELETE
    Then status 204

    #3 : Get the same user by the id
    Given path '/public/v1/users/' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method GET
    Then status 404
