Feature: GET API feature
  Background:
    * url 'https://gorest.co.in/public/v2/users'
  Scenario: get user details
    And path '425535'
    When method GET
    Then status 200
    And print response
    * assert response.id == 425535
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actName = jsonResponse.name
    * def actId = jsonResponse.id
    * def actEmail = jsonResponse.email
   * print actName
   * print actId
   * print actEmail
    * match actName == 'Preity Khan IV'
    * match actId == 425535
    * match actEmail == 'preity_iv_khan@runte.io'

  Scenario: get user details - "message": "Resource not found"
#    Given url 'https://gorest.co.in/public/v2/users'
    And path '1'
    When method GET
    Then status 404