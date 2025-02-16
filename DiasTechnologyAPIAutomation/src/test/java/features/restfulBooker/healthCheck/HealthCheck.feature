Feature: Health Check
  This service is used to verify the status of the service

  Background:
    * url 'https://restful-booker.herokuapp.com/ping'

    Scenario: Check correct request to check service status receive 201

      When method GET
      Then status 201

