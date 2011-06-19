require 'sinatra/base'

class Website < Sinatra::Base
  get '/' do
    '<p>Hello Website!</p>'
  end
end
