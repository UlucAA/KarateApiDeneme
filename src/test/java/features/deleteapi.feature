Feature: Create user using post api
  Background:
    * url 'https://gorest.co.in'
    * def random_string =
    """
        function(s){
            var text = "";
            var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            for(var i=0; i<s;i++)
              text+= pattern.charAt(Math.floor(Math.random() * pattern.length()));
              return text;
    }
    """
    * def randomString = random_string(10)
    * def random_string =
    * print randomString
    * def requestPayload =
    """
    {
        "name": "tom",
        "gender": "male",
        "status": "active"
    }

    """
    * requestPayload.email=randomString+"@gmail.com"
#  * set requestPayload.email=randomString+"@gmail.com"
    #ustteki kod blogunda setlisini yazinca gene nullpointerException atiyor ?
    * print requestPayload
  Scenario: Delete a user with the given user id
#1. create a user using POST CALL
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    When method post
    Then status 201
    And match $.data.id == '#present'

  #fetch the user id
  * def userId = $.data.id
  * print userId

    #2. delete the same user
    Given path '/public/v1/users/'+userId
    And header Authorization = 'Bearer b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    When method delete
    Then status 204

    #3.get the same user with user id
    Given url 'https://gorest.co.in/public/v1/users/'+userId
    When method GET
    Then status 404
    And match $.data.message == 'Resource not found'
