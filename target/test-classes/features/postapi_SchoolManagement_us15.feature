Feature: Create user using post api

  Background:
    * url 'https://school-management-v1.herokuapp.com'
    * def faker = new com.github.javafaker.Faker()
    * def phonenumber =
    """
function() {
    var firstPart = Math.floor(Math.random() * 900) + 100;
    var secondPart = Math.floor(Math.random() * 900) + 100;
    var thirdPart = Math.floor(Math.random() * 10000);
    return `${firstPart}-${secondPart}-${thirdPart}`;
}
"""
    * def requestPayload =
    """
    {
      "advisorTeacherId": "116",
      "birthDay": "2011-05-30",
      "birthPlace": "#(faker.address().city())",
      "email": "#(faker.internet().emailAddress())",
      "fatherName": "#(faker.name().firstName())",
      "gender": "MALE",
      "motherName": "#(faker.name().firstName())",
      "name": "#(faker.name().firstName())",
      "password": "#(faker.internet().password())",
      "phoneNumber": "#(phonenumber())",
      "ssn": "#(faker.idNumber().ssnValid())",
      "studentNumber": "#(faker.number().digits(4))",
      "surname": "#(faker.name().lastName())",
      "username": "#(faker.name().username())"
    }
    """
  Scenario: Create a user with the given data
    Given path '/students/save'
    And request requestPayload
    And header Authorization = 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJUZWFtMDdWaWNlRGVhbiIsImlhdCI6MTY4MjI1MDExMiwiZXhwIjoxNjgyMjU4NzUyfQ.FLXIm1QhGLzCcsVmzdmZDHAIu43gWhmDVduG0HzkkHqUOxYFu-lLquFfko0v9m4nqMvWVNPW6K2_t9OWC7BoYw'
    When method post
    Then status 200