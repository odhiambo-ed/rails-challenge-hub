
# Challenge Hub API Documentation

## Base URL

All API endpoints are prefixed with: `/api/v1`

## Authentication

Authentication is required for most endpoints. Use the following endpoints to manage user sessions:

### POST /signup

Create a new user account.

**Request Body:**

```json
{
  "user": {
    "email": "user@example.com",
    "password": "password123",
    "password_confirmation": "password123"
  }
}
```

**Response:** Returns the created user object and authentication token.

### POST /login

Authenticate a user and start a new session.

**Request Body:**

```json
{
  "user": {
    "email": "user@example.com",
    "password": "password123"
  }
}
```

**Response:** Returns the user object and authentication token.

### DELETE /logout

End the current user session.

**Headers:** Requires authentication token.

**Response:** Returns a success message.

### GET /current_user

Retrieve the current authenticated user's information.

**Headers:** Requires authentication token.

**Response:** Returns the current user object.

## Challenges

### GET /challenges

Retrieve a list of all challenges.

**Query Parameters:**

- `page`: Page number for pagination (default: 1)
- `per_page`: Number of items per page (default: 10)

**Response:** Returns an array of challenge objects.

### GET /challenges/:id

Retrieve a specific challenge by ID.

**Response:** Returns the challenge object with associated solutions.

### POST /challenges

Create a new challenge.

**Headers:** Requires authentication token.

**Request Body:**

```json
{
  "challenge": {
    "title": "Challenge Title",
    "description": "Challenge description",
    "difficulty_level": "easy",
    "tag_ids": [1, 2, 3]
  }
}
```

**Response:** Returns the created challenge object.

### PUT /challenges/:id

Update an existing challenge.

**Headers:** Requires authentication token.

**Request Body:** Same as POST, with updated fields.

**Response:** Returns the updated challenge object.

### DELETE /challenges/:id

Delete a challenge.

**Headers:** Requires authentication token.

**Response:** Returns a success message.

## Solutions

### GET /challenges/:challenge_id/solutions

Retrieve all solutions for a specific challenge.

**Response:** Returns an array of solution objects.

### GET /challenges/:challenge_id/solutions/:id

Retrieve a specific solution.

**Response:** Returns the solution object with associated comments.

### POST /challenges/:challenge_id/solutions

Create a new solution for a challenge.

**Headers:** Requires authentication token.

**Request Body:**

```json
{
  "solution": {
    "code": "Solution code here",
    "explanation": "Explanation of the solution"
  }
}
```

**Response:** Returns the created solution object.

### PUT /challenges/:challenge_id/solutions/:id

Update an existing solution.

**Headers:** Requires authentication token.

**Request Body:** Same as POST, with updated fields.

**Response:** Returns the updated solution object.

### DELETE /challenges/:challenge_id/solutions/:id

Delete a solution.

**Headers:** Requires authentication token.

**Response:** Returns a success message.

## Comments

### GET /challenges/:challenge_id/solutions/:solution_id/comments

Retrieve all comments for a specific solution.

**Response:** Returns an array of comment objects.

### POST /challenges/:challenge_id/solutions/:solution_id/comments

Create a new comment on a solution.

**Headers:** Requires authentication token.

**Request Body:**

```json
{
  "comment": {
    "content": "Comment text here"
  }
}
```

**Response:** Returns the created comment object.

### PUT /challenges/:challenge_id/solutions/:solution_id/comments/:id

Update an existing comment.

**Headers:** Requires authentication token.

**Request Body:** Same as POST, with updated content.

**Response:** Returns the updated comment object.

### DELETE /challenges/:challenge_id/solutions/:solution_id/comments/:id

Delete a comment.

**Headers:** Requires authentication token.

**Response:** Returns a success message.

## Votes

### POST /challenges/:challenge_id/solutions/:solution_id/votes

Create or update a vote on a solution.

**Headers:** Requires authentication token.

**Request Body:**

```json
{
  "vote": {
    "value": 1
  }
}
```

**Response:** Returns the created or updated vote object.

### DELETE /challenges/:challenge_id/solutions/:solution_id/votes/:id

Remove a vote from a solution.

**Headers:** Requires authentication token.

**Response:** Returns a success message.

## Tags

### GET /tags

Retrieve all available tags.

**Response:** Returns an array of tag objects.

### GET /challenges/:challenge_id/tags

Retrieve all tags for a specific challenge.

**Response:** Returns an array of tag objects associated with the challenge.

### POST /challenges/:challenge_id/tags

Add tags to a challenge.

**Headers:** Requires authentication token.

**Request Body:**

```json
{
  "tag_ids": [1, 2, 3]
}
```

**Response:** Returns the updated challenge object with associated tags.

### DELETE /challenges/:challenge_id/tags/:id

Remove a tag from a challenge.

**Headers:** Requires authentication token.

**Response:** Returns the updated challenge object with remaining tags.

## Error Handling

The API uses conventional HTTP response codes to indicate the success or failure of requests. Codes in the 2xx range indicate success, codes in the 4xx range indicate an error that failed given the information provided (e.g., a required parameter was omitted), and codes in the 5xx range indicate an error with the server.

## Rate Limiting

To prevent abuse, the API implements rate limiting. You can check the following response headers:

- `X-RateLimit-Limit`: The maximum number of requests you're permitted to make per hour.
- `X-RateLimit-Remaining`: The number of requests remaining in the current rate limit window.
- `X-RateLimit-Reset`: The time at which the current rate limit window resets in UTC epoch seconds.

## Pagination

List endpoints support pagination using the `page` and `per_page` query parameters. The response will include the following headers:

- `X-Total`: The total number of items
- `X-Page`: The current page number
- `X-Per-Page`: The number of items per page
- `X-Total-Pages`: The total number of pages

## Authentication Token

After successful login, you'll receive an authentication token. Include this token in the Authorization header for all authenticated requests:

```
Authorization: Bearer your_auth_token_here
```
```

This Markdown file can be saved with a `.md` extension and will be properly formatted for viewing in any Markdown viewer or editor.