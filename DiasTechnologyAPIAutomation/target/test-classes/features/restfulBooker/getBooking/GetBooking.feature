Feature:
  This service is used to obtain all bookingIds

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * header Accept = 'application/json'

  Scenario: Check correct request with reservation id receive code 200

    When method GET
    Then status 200
    And match response == "#array"
    And assert response.length > 0