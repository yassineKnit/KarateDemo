Feature: Put request feature
  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
    """
    {
      gender: "female",
      status: "inactive"
    }
    """
    
  Scenario: update user by id
    Given path '/public/v1/users/3883'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match response.data.status == 'inactive'
    And match response.data.gender == 'female'