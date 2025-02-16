Feature: Update BOOKING
  This service is used to update the customer reservations

  Background:
    * header Context-Type = 'appliction/json'
    * header Accept = 'application/json'


  Scenario:Check correct request to update a reservation receive 200

    * def createBookingResponse = call read('classpath:features/common/CreateBooking.feature')
    * def bookingId = createBookingResponse.response.bookingid
    * def createTokenReponse = call read('classpath:features/common/CreateToken.feature')
    * def accessToken = createTokenReponse.response.token

    * url 'https://restful-booker.herokuapp.com/booking/'+ bookingId

    And cookie token = accessToken
    And request
      """
       {
          "firstname" : "Çağatay Test",
          "lastname" : "Tok Test",
         "totalprice" : 1000,
         "depositpaid" : true,
         "bookingdates" : {
          "checkin" : "2028-01-01",
          "checkout" : "2028-01-01"
        },
           "additionalneeds" : "Brunch"
           }
      """
    When method PUT
    Then status 200
    Then print  response
    Then response.firstname == "Çağatay Test"
    Then response.lastname == "Tok Test"

