Feature: Create user using put api
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
  Scenario: Update a user with the given data
#1st call:create a user with post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    When method post
    Then status 201
    And match $.data.id == '#present'

# fetch the user id from the post call response
  * def userId = $.data.id
  * print userId

#2nd put call -- to update the user
    * def requestPutPayload =
     """
    {
        "gender": "female",
        "status": "inactive"
    }
    """

    Given path '/public/v1/users/'+userId
    And request requestPutPayload
    And header Authorization = 'Bearer b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.id == userId
    And match $.data.name == '#present'
    And match $.data.name == 'tom'
    And match $.data.email == requestPayload.email
