Feature: GET API headers feature
  Background:
  * url 'https://gorest.co.in//public/v2/users/'
    * def config = read('../../java/karate-config.js')
#    * url config.testEnvUrl
  Scenario: get user details
    * print tokenID = 'b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    #ustteki kisim karate-config.js den olmasi lazim normalde
   Given header Authorization = 'Bearer '+tokenID
    And path '424183'
    When method GET
    Then status 200
