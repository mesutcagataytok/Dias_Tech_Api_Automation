  Feature: Test API for Booking - DeleteBooking

  Background: Check correct request to delete a reservation receive 201

    * header Context-Type = 'appliction/json'

    Scenario:
    * def createBookingResponse = call read('classpath:features/common/CreateBooking.feature')
    * def bookingId = createBookingResponse.response.bookingid
    * def createTokenReponse = call read('classpath:features/common/CreateToken.feature')
    * def accessToken = createTokenReponse.response.token

    * url 'https://restful-booker.herokuapp.com/booking/'+ bookingId

    And cookie token = accessToken
    When method Delete
    Then status 201
    And match response == "Created"
