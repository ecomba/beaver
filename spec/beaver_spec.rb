require 'spec_helper'

describe Beaver do

  def app
    Beaver.new stub(:request, call: [200,[],"We're in!"])
  end

  def renders_login_form
    last_response.should be_ok
    last_response.body.should include '<form'
  end

  it 'renders the login page' do
    get '/'

    renders_login_form
  end

  it 'logs us in with the right password' do
    params = {email: 'test@beaver.com', password: 's3cr3t'}
    post '/', params

    last_response.should be_redirect
  end

  it 'refuses to log us in with the wrong password' do
    params = {email: 'test@beaver.com', password: 'wr0ng'}
    post '/', params

    renders_login_form
  end
end
