require_relative "test_helper"
# https://gist.github.com/JoshCheek/989a099594059ebf3015
# will be helpful eventually
class TestApp < Rulers::Application
end
class TestController < Rulers::Controller
  def myaction
    "Hello"
  end
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods
  
  def app
    TestApp.new
  end
  
  def test_request
    get "/test/myaction"
    
    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end
  
  def test_error
    get "/test/invalid"
    
    assert last_response.ok?
  end
end
