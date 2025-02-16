Feature: Partial Update BOOKING
  This service is used to partially update the customer reservations

  Background:
    * header Context-Type = 'appliction/json'
    * header Accept = 'application/json'


  Scenario:Check correct request to partially update a reservation receive 200

    * def createBookingResponse = call read('classpath:features/common/CreateBooking.feature')
    * def bookingId = createBookingResponse.response.bookingid
    * def createTokenReponse = call read('classpath:features/common/CreateToken.feature')
    * def accessToken = createTokenReponse.response.token

    * url 'https://restful-booker.herokuapp.com/booking/'+ bookingId

    And cookie token = accessToken
    And request
      """
      {
      "firstname" : "Çağatay",
     "lastname" : "Test"
       }
      """
    When method PATCH
    Then status 200
    Then print  response
    Then response.firstname == "Çağatay"
    Then response.lastname == "Test"

