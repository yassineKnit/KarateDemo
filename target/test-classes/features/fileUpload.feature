  Feature: file upload feature
    Background:
      * url 'https://filebin.net'
      * def generateBin =
      """
      function(s){
        var text = "";
        var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        for(var i=0;i<s;i++){
          text += pattern.charAt(Math.floor(Math.random() * pattern.length));
        }

        return text

      }
      """

    Scenario: File upload testCase
      * def randomBin = generateBin(10)
      * def randomFileName = generateBin(5)
      * print randomBin
      * print randomFileName
      Given path '/' + randomBin + '/' + randomFileName
      And request karate.read('file:src/test/resources/shiroe.jpg')
      When method POST
      Then status 201
