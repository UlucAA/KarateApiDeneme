#TODO bu class olmadi yarim kaldi 5.video naveen....
Feature: GET API headers feature
  Background:
    * url 'https://gorest.co.in/public/v2/users'
  Scenario: pass the user request with headers
    Given header Content-Type = 'application/json; charset=utf-8'
#    And header Transfer-Encoding = 'chunked'
    And header Connection = 'keep-alive'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header User-Agent = 'Apache-HttpClient/4.5.12 (Java/11.0.16.1)'
    And header Authorization = 'Bearer f9a6125f6ea4617'
   And path '409186'
    When method GET
    Then status 200
    * print response
  Scenario: pass the user request with headers_Part2
    * def request_headers =
    And path '408182'
    When method GET
    Then status 200
    * print response
  #https://gorest.co.in/public/v2/users/408482 == https://gorest.co.in/public/v2/users/408482
