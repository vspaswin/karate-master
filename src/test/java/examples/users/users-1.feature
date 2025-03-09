Feature: Get Post Details from JSONPlaceholder API

Background:
  * url 'https://jsonplaceholder.typicode.com'

Scenario: Get post by ID
  Given path '/posts/1'
  When method GET
  Then status 200
  And print response
  And match response.userId == 1
  And match response.id == 1
  And match response.title contains 'id' /* Just a simple check on title */
  And match response.body contains 'recusandae consequuntur' /* Simple check on body */

Scenario: List all posts
  Given path '/posts'
  When method GET
  Then status 200
  And print response
  And match each response contains { userId: '#number', id: '#number', title: '#string', body: '#string' }

Scenario: Create a new post
  Given path '/posts'
  And request { userId: 11, title: 'My New Post Title', body: 'This is the body of my new post.' }
  When method POST
  Then status 201 # JSONPlaceholder often returns 201 for successful POSTs
  And print response
  And match response contains { id: '#present' } # New post should have an ID

Scenario: Update an existing post (PUT)
  Given path '/posts/1'
  And request { id: 1, userId: 1, title: 'Updated Post Title', body: 'This is the updated body of the post.' }
  When method PUT
  Then status 200
  And print response
  And match response contains { id: 1, title: 'Updated Post Title' } # Verify update

Scenario: Delete a post
  Given path '/posts/1'
  When method DELETE
  Then status 200 # Or 204 No Content, JSONPlaceholder might return 200 OK
  And print response
  # For DELETE, you might not get a body, so just checking status is often enough