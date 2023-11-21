Feature: Validate the API responses
  AS a QA Engineer
  I WANT TO test different user specific API responses
  SO THAT I can help users perform CRUD operations without any issues

  @automated @scenario1
  Scenario: Validate the signup functionality for new users
    Given we fetch the user signup endpoint
    When I provide the email and password
    Then I should receive a response stating successful registration

  @automated @scenario2
  Scenario: Validate the signup functionality for existing users
    Given we fetch the user signup endpoint
    When I provide an existing email and password
    Then I should receive a response stating user exists

  @automated @scenario3
  Scenario Outline: Validate the login functionality for invalid users
    Given we setup the user login endpoint
    When I provide an existing "<Email>" and "<Password>"
    Then I should receive a response with "<Messages>"

    Examples:
      | Email                          | Password | Messages              | 
      | test@priyo.com                 | 123      | Registered Users      |    
      | nouser@doesntexists.com        | 123      | invalid credentials.  |
      | invalidemail@#test.com.de.nu@y | 32332    | invalid credentials.  |
      | test1                          | Hello    | invalid credentials.  |
      |                                | Test     | invalid credentials.  |
      | user@email.com                 |          | invalid credentials.  |
      |                                |          | invalid credentials.  |

  @automated @scenario4
  Scenario: Validate the deleted users cannot login in again 
    Given we fetch the user usersapi endpoint
    When I make a request
    Then I should receive a response with all existing users
    And  we delete the last user from the list
    When we setup the user login endpoint
    And I provide the deleted user email and password
    Then I should not be able to login successfully