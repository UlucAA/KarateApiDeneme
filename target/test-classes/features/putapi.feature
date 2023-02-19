Feature: Create user using post api
  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
    """
    {
        "status": "active",
        "email": "sutlunuriye@gmail.com"
    }
    """
  Scenario: Create a user with the given data
    Given path '/public/v1/users/424778'
    And request requestPayload
    And header Authorization = 'Bearer b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Malti Pilla LLD'
    And match $.data.email == 'sutlunuriye@gmail.com'