Feature: hello world feature
  Scenario: print hello world scenario
    * print 'Hello Wooorld !'
    * print 'Hello shirooooooe boooooooy'

  Scenario: declare and print variables
    * def balance = 200
    * def fee = 20
    * def taux = 10
    * print 'the total amount is ' + (balance - fee)*100

  Scenario: calculator scenarion
    * def a = 10
    * def b = 20
    * print 'result is -> ' + a*b
