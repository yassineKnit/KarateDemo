Feature: header feature
  Scenario: pass the user request with headers scenario 1
    Given header Content-Type = 'text/xml;charset=ISO-8859-1'
    And header Accept-Encoding = 'gzip,deflate'
    And header Connection = 'Keep-Alive'
    And header Expect = '100-continue'
    And header User-Agent = 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'
    And header Authoeization = 'Bearer 5b62f89b0056585969f112bc3d07f726481559fab42599241dcab33d2b9f6d2e'
    * def query = {id: 30}
    When url baseUrl + '/public/v1/users'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers scenario 2
    * def requestHeaders = {Content-Type: 'text/xml;charset=ISO-8859-1', Accept-Encoding: 'gzip,deflate', Connection: 'Keep-Alive', Expect: '100-continue', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)', Authoeization: 'Bearer 5b62f89b0056585969f112bc3d07f726481559fab42599241dcab33d2b9f6d2e'}
    Given headers requestHeaders
    * def query = {id: 30}
    When url baseUrl + '/public/v1/users'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers scenario 3
    * configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Accept-Encoding: 'gzip,deflate', Connection: 'Keep-Alive', Expect: '100-continue', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)', Authoeization: 'Bearer 5b62f89b0056585969f112bc3d07f726481559fab42599241dcab33d2b9f6d2e'}
    * def query = {id: 30}
    Given url baseUrl + '/public/v1/users'
    And params query
    When method GET
    Then status 200
    * print response