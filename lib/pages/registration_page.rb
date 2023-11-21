# frozen_string_literal: true

class RegistrationPage
=begin
include PageObjects

  def initialize(browser)
    @browser = browser
  end

  @browser.text_field(:signupLink, id: "signupLink")
  @browser.text_field(:email_login, name: "email")
  @browser.text_field(:password_login, name: "password")
  @browser.text_field(:email_signup, xpath: "//div[@id='signupModal']//*[@id='email']")
  @browser.text_field(:password_signup, xpath: "//div[@id='signupModal']//*[@id='password']")
  @browser.element(:signIn, xpath: "//input[@type='submit' and @value='Login']")
  @browser.element(:signUp, xpath: "//input[@type='submit' and @value='Sign up']")

  # Logs into screen using email & password
  def login_with(user_email, user_password)
    self.email = email_login
    self.password = password_login
    signIn.click
  end

  # Signs Up into screen using email & password
  def signUp_with(user_email, user_password)
      self.email = email_signup
      self.password = password_signup
      signUp.click
    end 

=end
end