Feature: GET API  with Query Parameters
  Background:
    * url 'https://gorest.co.in/public/v2/users'
  Scenario: get all active users
    * def query = {status:'active',gender:'female',id:406612}
    And params query
    When method GET
    Then status 200
    * print response
  Scenario: get all active users and get the count
    * def query = {status:'active'}
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 10