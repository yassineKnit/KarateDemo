Feature: get api feature
  Scenario: get user details scenario

    Given url baseUrl + '/public/v1/users'
    And path '110'
    When method GET
    Then status 200
    * def jsonResponse = response
    * def jsonResponseData = jsonResponse.data
    And match jsonResponseData.gender == 'male'
    And match jsonResponseData.name == 'Chandini Adiga'
    And match jsonResponseData.email == 'adiga_chandini@weber.com'
    And match jsonResponseData.id == 110
    * print 'my name is ' + myVarName
    
  Scenario: get all active users
    * def query = {status: active}
    Given url baseUrl + '/public/v1/users'
    And params query
    When method GET
    Then status 200
    And match response.meta.pagination.total == response.data.length
    * print response

    Scenario: Get user by id
      * def query = {id: 110 }
      Given url baseUrl + '/public/v1/users'
      And params query
      When method GET
      Then status 200
      * print response
