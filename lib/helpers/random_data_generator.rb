# frozen_string_literal: true

# Generates random strings needed in different places
require "date"

module RandomDataGenerator

  USER_EMAIL_PREFIX_NEW = "TestEmail_"

  def current_epoch_time
    Time.now.to_f.to_s
  end

  def generate_new_email
    USER_EMAIL_PREFIX_NEW + current_epoch_time + "@test.com"
  end

end
