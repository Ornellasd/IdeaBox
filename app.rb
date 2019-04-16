require 'bundler'
Bundler.require

class IdeaBoxApp <  Sinatra::Base
  get '/' do
    "Hello, Scoots!"
  end
end