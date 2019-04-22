require 'bundler'
Bundler.require

require './idea'

class IdeaBoxApp <  Sinatra::Base
  set :method_override, true

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end
  
  get '/' do
    erb :index, locals: {ideas: Idea.all}  
  end

  post '/' do
    # create an idea based on form parameters
    idea = Idea.new(params['idea_title'], params['idea_description'])
    
    # store it
    idea.save

    # send user back to index page to see all ideas
    redirect '/'
  end

  delete '/:id' do |id|
    Idea.delete(id.to_i)
    redirect '/'
  end
end