Feature: Validate the UI
  AS a QA Engineer
  I WANT TO test different user specific operations in UI
  SO THAT I can help users perform CRUD operations without any issues in the UI

  @automated @scenario5 @web
  Scenario: Validate the signup functionality for new users in UI
    Given we navigate to signup page
    When I enter the email and password
    Then I should view a response stating successful registration

  @automated @scenario6 @web
  Scenario: Validate the login functionality for existing users in UI
    Given we navigate to login page
    When I enter an existing email and password
    Then I should land on the user list page

  @automated @scenario7 @web
  Scenario: Validate the deleted users cannot login in again 
    Given we navigate to login page
    When I enter an existing email and password
    Then I should land on the user list page
    And  user delete the last user from the list
    When logout from the page after deletion
    And I enter the deleted user email and password
    Then I wont be able to login successfully