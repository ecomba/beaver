require 'spec_helper'

describe Beaver do

  def app
    Beaver.new stub(:request, call: [200,[],"We're in!"])
  end

  it 'renders the login page' do
    get '/'

    last_response.should be_ok
    last_response.body.should include '<form'
  end

  it 'logs us in' do
    params = {email: 'test@beaver.com', password: 's3cr3t'}
    post '/', params
    last_response.should be_redirect
  end
end
