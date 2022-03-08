Feature: GraphQL demo
  Background:  
    * url 'https://api.graphql.jobs'
    * text query =
    """
    query{
      jobs{
        id
        title
      }
    }
    """
  Scenario: graphQl scenario
    Given path '/'

    And request { query : '#(query)' }
    When method POST
    Then status 200
    And match response.data.jobs == '#array'