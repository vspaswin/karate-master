Feature: Sample Karate Test Script
For help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]
    # Extract the first user from the response

    Given path 'users', first.id
    When method get
    Then status 200

  Scenario: Create a user and then get it by id
    * def user =
      """
      {
        "name": "Test User",
        "username": "testuser",
        "email": "test@user.com",
        "address": {
          "street": "Has No Name",
          "suite": "Apt. 123",
          "city": "Electri",
          "zipcode": "54321-6789"
        }
      }
      """

    Given path 'users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    # Extract the ID of the created user
    * print 'Created id is:', id

    # Note: JSONPlaceholder doesn't actually create the resource
    # It just simulates the creation and returns a mock response
    Given path 'users', '1'
    When method get
    Then status 200