Feature: Test API for Booking - CreateBooking

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * header Accept = 'application/json'

  Scenario: Create Booking
    And request
     """
        {
          "firstname" : "Mesut",
          "lastname" : "Tok",
          "totalprice" : 500,
          "depositpaid" : true,
          "bookingdates" : {
              "checkin" : "2025-03-13",
              "checkout" : "2025-04-13"
          },
          "additionalneeds" : "Breakfast"
        }
    """
    When method POST
    Then status 200
    Then print response
    Then response.booking.firstname == "Mesut"
    Then response.booking.lastname == "Tok"

