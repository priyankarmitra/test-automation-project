require "httparty"

class HttpRequest
  attr_accessor :url

  def initialize(host)
    @host = host
  end

  def get(path)
    if path.empty?
      raise 'path is empty'
    end

    url = @host + path
    response = HTTParty.get(url, :headers => {"Content-Type" => "application/json"})
  end

  def post(path, pay_load, multipart_value=true)
    if path.empty? and pay_load.emtpy?
      raise 'path / payload is empty'
    end
    
    url = @host + path
    response = HTTParty.post(url, :body => pay_load, :multipart => multipart_value)
  end
end

# Module for managing service requests
module ServiceRequest
  extend self

  def setup_request(host)
    @request = HttpRequest.new(host)
  end

  def clear_request
    @request = nil
  end

  def get_request(path)
    @request.get(path)
  end

  def post_request(path, pay_load, multipart_value=true)
    @request.post(path, pay_load)
  end
end
