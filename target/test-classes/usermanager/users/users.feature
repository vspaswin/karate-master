Feature: Spring AI Demo User Management API Tests

  Background:
    * url 'http://localhost:8080/api/v1'
    * def timestamp = function(){ return java.lang.System.currentTimeMillis() }
    * def randomEmail = function(){ return 'test.' + timestamp() + '@example.com' }

  Scenario: Get all users with pagination
    Given path 'users'
    And param page = 0
    And param size = 10
    When method get
    Then status 200
    And match response contains { page: '#object' }
    And match response.page contains { size: '#number', totalElements: '#number' }

  Scenario: Create and retrieve a user
    * def user =
      """
      {
        "name": "Test User",
        "email": "#(randomEmail())",
        "phoneNumber": "+1234567890",
        "status": "ACTIVE"
      }
      """

    # Create user
    Given path 'users'
    And request user
    When method post
    Then status 201
    And match response contains { id: '#number', name: 'Test User' }
    * def userId = response.id

    # Get created user
    Given path 'users', userId
    When method get
    Then status 200
    And match response contains { id: '#(userId)', name: 'Test User' } 