Feature: feature of outline scenarios
  Background:
    * url baseUrl

  Scenario Outline: Data table printing <id>
    * print 'Current id is -> ' + id
    Examples:
      |id|
      |10|
      |20|
      |30|

    Scenario Outline: Get user Example - <id>
      Given path 'public/v1/users/' + id
      When method GET
      Then status 200
      * print $.data.name + ' has id ' + id
      Examples:
        |id|
        |2642|
        |2644|
        |2643|

  Scenario Outline: Get user Example - <id> from csv data
    Given path 'public/v1/users/' + id
    When method GET
    Then status 200
    * print $.data.name + ' has id ' + id
    Examples:
      |read('classpath:src/test/resources/payload/data.csv')|
