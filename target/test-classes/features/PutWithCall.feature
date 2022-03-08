Feature: update user call
  Background: 
    * url baseUrl
    
  Scenario: update user created in other feature
    * def getUser = call read('classpath:src/test/java/features/callers/getCaller.feature')
    Given path '/public/v1/users/' + getUser.response.data.id
    And getUser.response.data.name = 'shiroe modified'
    And header Authorization = 'Bearer ' + tokenID
    And request getUser.response.data
    When method PUT
    Then status 200
    * print 'after put ', response
    