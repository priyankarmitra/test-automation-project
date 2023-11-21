# frozen_string_literal: true

# require 'nokogiri' <- couldn't install
require 'helpers/random_data_generator'
require 'modules/http_request'

include RandomDataGenerator

Given('we fetch the user signup endpoint') do
    @resource_path = "signup"
    begin
        @request = ServiceRequest.setup_request(ENV.fetch('TRIAL_HOST'))
    rescue StandardError => ex
        raise "Failed to setup signup request! #{ex.message}"
    end
  end
  
  When('I provide the email and password') do
    begin
        response_body = {
            email: generate_new_email,
            password: "Test123"
        }
        @response = @request.post(@resource_path,response_body)
    rescue StandardError => ex
        raise "Failed to make signup request! #{ex.message}"
    end
  end
  
  Then('I should receive a response stating successful registration') do
    assert_equal @response.code, 200, "The response status code do not match for user registration"
    refute @response.body.empty?, 'The response message for successful registration should appear'
    assert_includes @response.body, "User signed up successfully!", 'The response must contain a success message upon succesful registration'
  end
  
  When('I provide an existing email and password') do
    begin
            response_body = {
            email: "shamir@shamir.com",
            password: "Shamir123"
        }
        @response = @request.post(@resource_path,response_body)
    rescue StandardError => ex
        raise "Failed to make signup request! #{ex.message}"
    end
  end
  
  Then('I should receive a response stating user exists') do
    assert_equal @response.code, 200, "The response status code do not match for existing user registration"
    refute @response.body.empty?, 'The response message for unsuccessful registration as user exists already should appear'
    assert_includes @response.body, "User with that email already exists.", 'The response must contain a success message upon succesful registration'
  end
  
  Given('we setup the user login endpoint') do
    @resource_path = "login"
    begin
        @request = ServiceRequest.setup_request(ENV.fetch('TRIAL_HOST'))
    rescue StandardError => ex
        raise "Failed to setup Login request! #{ex.message}"
    end
  end
  
  When('I provide an existing {string} and {string}') do |email_id, password_val|
    
    @existing_email = email_id
    begin
        response_body = {
        email: email_id,
        password: password_val
    }
    @response = @request.post(@resource_path,response_body)
    rescue StandardError => ex
        raise "Failed to make Login request! #{ex.message}"
    end
  end

  Then('I should receive a response with {string}') do |message_body|

    assert_equal @response.code, 200, "The response status code do not match for valid/invalid login requests"
    refute @response.body.empty?, 'The response message for valid/invalid login should appear'
    
    if message_body.eql? "Registered Users"
        #parsed_data = Nokogiri::HTML.parse(@response.body)
        #user_email_to_validate =  parsed_data.xpath("//tr[2]/td[2]").text
        #assert_equal @response.body, @user_email_to_validate, "The user email after login do not appear in the registered page"
        assert_includes @response.body, @existing_email , "The response must contain the user email id #{@existing_email}"
    else
        assert_includes @response.body, "invalid credentials.", 'The response must contain a message for invalid credentials'
    end
  end
  
  Given('we fetch the user usersapi endpoint') do
    @resource_path = "usersapi"
    begin
        @request = ServiceRequest.setup_request(ENV.fetch('TRIAL_HOST'))
    rescue StandardError => ex
        raise "Failed to setup usersapi request! #{ex.message}"
    end
  end
  
  When('I make a request') do
    begin
        @response = @request.get(@resource_path)
    rescue StandardError => ex
        raise "Failed to make userapi request! #{ex.message}"
    end
  end
  
  Then('I should receive a response with all existing users') do
    begin
        @list_of_users = JSON.parse @response.body
    rescue StandardError => ex
        raise "Failed to parse JSON! #{ex.message}"
    end
  end
  
  Then('we delete the last user from the list') do
   
    begin
        @last_user_id = @list_of_users.last["id"]
        @last_user_email = @list_of_users.last["email"]
        @last_user_password = @list_of_users.last["password"]

        @resource_path = "delete/" + @last_user_id.to_s
        @response = @request.post(@resource_path,"")
        puts @response.body
    rescue StandardError => ex
        raise "Failed to parse JSON! #{ex.message}"
    end
  end
  
  When('I provide the deleted user email and password') do
    begin
        response_body = {
        email: @last_user_email,
        password: @last_user_password
    }
    @response = @request.post(@resource_path,response_body)
    rescue StandardError => ex
        raise "Failed to make Login request! #{ex.message}"
    end
  end
  
  Then('I should not be able to login successfully') do
    assert_includes @response.body, "invalid credentials.", 'The response must contain a message for invalid credentials'
  end