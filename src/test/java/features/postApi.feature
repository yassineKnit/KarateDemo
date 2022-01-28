Feature: post api requests
  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
    """
    {
    "email": "shiroe12@mail.jp",
    "name": "shiroe boooy",
    "gender": "male",
    "status": "active"
    }
    """
  Scenario: create user with post request
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.email == '#present'
    And match $.data.email == 'shiroe12@mail.jp'
    * print response