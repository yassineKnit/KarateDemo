Feature: api authentication
  Scenario: send api request with token
    * def query = {status: 'active', gender: 'male'}
    Given url baseUrl + '/public/v1/users'
    And header Authorization = 'Bearer ' + tokenID

    And params query
    When method GET

    Then status 200
    * print response
    * print tokenID