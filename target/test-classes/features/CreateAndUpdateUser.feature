Feature: Create and Update user feature
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
    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
    * def randomEmail = generateEmail(10)
    * set requestPayload.email = randomEmail
    * print requestPayload



  Scenario: create and update user scenario
    # 1st call : create user with post call
    Given path '/public/v1/users/'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.data.id == '#present'
    And match $.data.email == randomEmail
    * print response
    # fetch the user id from the post call response
    * def userId = $.data.id
    * def requestUpdatePayload =
    """
    {
      "gender": "female",
      "status": "inactive"
    }
    """

    # 2nd call : update user created in the 1st call
    Given path '/public/v1/users/' + userId
    And request requestUpdatePayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match $.data.gender == 'female'
    And match $.data.status == 'inactive'
    * print response




