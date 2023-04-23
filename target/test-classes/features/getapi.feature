Feature: GET API feature
  Background:
    * url 'https://gorest.co.in/public/v2/users/'
  Scenario: get user details
    And path '427794'
    When method GET
    Then status 200
    And print response
    * assert response.id == 427794
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actName = jsonResponse.name
    * def actId = jsonResponse.id
    * def actEmail = jsonResponse.email
   * print actName
   * print actId
   * print actEmail
    * match actName == 'Agnivesh Devar IV'
    * match actId == 427794
    * match actEmail == 'agnivesh_iv_devar@bernhard.name'

  Scenario: get user details - "message": "Resource not found"
#    Given url 'https://gorest.co.in/public/v2/users'
    And path '1'
    When method GET
    Then status 404