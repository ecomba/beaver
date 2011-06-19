require 'sinatra/base'

class Website < Sinatra::Base
  get '/' do
    'Hello Website!'
  end
end
