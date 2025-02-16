Feature: Get Booking Ids
  This service is used to be able to
  check the reservation by booking id

  Background:

    * header Accept = 'application/json'

  Scenario: Check correct request with reservation id receive code 200
    * def createBookingResponse = call read('classpath:features/common/CreateBooking.feature')
    * def bookingId = createBookingResponse.response.bookingid
    * url 'https://restful-booker.herokuapp.com/booking/'+ bookingId

    When method GET
    Then status 200
    And match response == "#object"
    And assert response != null
