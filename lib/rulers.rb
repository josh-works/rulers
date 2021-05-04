require "rulers/version"
require "rulers/array"

module Rulers
  class Application
    def call(env)
      `echo debug '#{env}' > debug.txt`;
      [200, {'Content-Type' => 'text/html'},
      ["Hello from RoRulers"]]
    end
  end
  
  class Error < StandardError; end
  # Your code goes here...
end
