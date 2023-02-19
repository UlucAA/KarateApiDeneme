Feature: Create user using post api
  Background:
    * url 'https://gorest.co.in'
#    * def requestPayload = read('C:\\Users\\Murphy\\IdeaProjects\\KarateApiDeneme\\src\\test\\resources\\payload\\user.json')')
#    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
#    * def requestPayload = read('classpath:src\\test\\resources\\payload\\user.json')
#    * def requestPayload = read('user.json')
    * def requestPayload = read('../../resources/payload/user.json')
#ustteki ile okudu sadece yorumlarda birisi yazmisti oyle duzelttim....

  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'tom'
    And match $.data.email == 'tombul11121@gmail.com'