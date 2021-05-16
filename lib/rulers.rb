require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)      
      if ENV['PATH_INFO'] == '/favicon.ico'
        return [404,
          {'Content-Type' => 'text/html'}, []]
      end
      
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
        [200, {'Content-Type' => 'text/html'},
        [text]]
      rescue
        text = File.read("public/error.html")
        [400, {'Content-Type' => 'text/html'},
        [text]]
      end
    end
  end
  
  class Controller
    def initialize(env)
      @env = env
    end
    
    def env
      @env
    end
  end
end
