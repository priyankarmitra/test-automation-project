# frozen_string_literal: true

require 'helpers/random_data_generator'
require "cucumber"
require 'delegate'
require 'watir'
require 'selenium-webdriver'
#require "pages/registration_page"


include RandomDataGenerator

Before('@web') do
    @browser = Watir::Browser.new
    @browser.goto("http://127.0.0.1:5000/")
end



Given('we navigate to signup page') do
    @browser.element(id: 'signupLink').click
  end
  
  When('I enter the email and password') do
    begin
        @browser.element(xpath: "//div[@id='signupModal']//*[@id='email']").set()
        @browser.element(xpath: "//div[@id='signupModal']//*[@id='password']").set()
        
    rescue StandardError => ex
        raise "Failed to perform action! #{ex.message}"
    end
   
  end
  
  Then('I should view a response stating successful registration') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given('we navigate to login page') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When('I enter an existing email and password') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('I should land on the user list page') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('user delete the last user from the list') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When('logout from the page after deletion') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When('I enter the deleted user email and password') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then('I wont be able to login successfully') do
    pending # Write code here that turns the phrase above into concrete actions
  end