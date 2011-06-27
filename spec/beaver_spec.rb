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


  it 'refuses to log us in with the wrong password' do
    params = {email: 'test@beaver.com', password: 'wr0ng'}
    post '/', params

    renders_login_form
  end

  context 'when we can log in' do
    let(:params) { {email: 'test@beaver.com', password: 's3cr3t'} }
    it 'logs us in with the right password' do
      post '/', params

      last_response.should be_redirect
      last_response.headers.keys.should include('Set-Cookie')
      last_response.headers.values.should include('beaver=in;path=/')
    end

    it 'gives us the real app if we have the cookie' do
      set_cookie 'beaver=in'
      get '/'
      last_response.body.should include "We're in!"
    end
  end
end
