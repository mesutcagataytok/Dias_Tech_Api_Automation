Feature: Create Token

  This service is used for the generation of the token
  where the user will log in to the service by performing a login

  Background:
    * def config = call read('classpath:features/karate-config.js')
    * def apiBaseURL = config.apiBaseURL
    * url apiBaseURL
    * header Accept = 'application/json'

  Scenario: Verify that when sending the request with the correct username and password you receive code 200
    Given path '/auth'
    And request
    """
    {
    "username" : "admin",
    "password" : "password123"
    }
    """
    When method POST
    Then status 200
    Then print response
    And match response.token == '#notnull'
    * def accessToken = response.token

