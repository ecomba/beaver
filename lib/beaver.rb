class Beaver
  def initialize app, options={}
    @app, @options = app, options
  end

  def call(env)
    setup_rack_environment env
    return @app.call @env if cookie_set?
    return open_dam if allowed_to_cross?
    return close_dam
  end

  private
  def setup_rack_environment env
    @env = env
    @response = Rack::Response.new
    @request = Rack::Request.new(env)
  end

  def open_dam
    [redirect, dam_headers, empty_body]
  end

  def redirect
    302
  end

  def dam_headers
    {'Location' => @request.path, 'Content-Type' => 'text/plain',
     'Set-Cookie' => 'beaver=in;path=/'}
  end

  def empty_body
    ['']
  end

  def close_dam
    @response.write default_form
    @response.finish
  end

  def default_form
    File.read(File.dirname(__FILE__) + '/beaver_form.html')
  end

  def authorised?
    @request.params['email'] == 'test@beaver.com' && @request.params['password'] == 's3cr3t'
  end

  def allowed_to_cross?
    @request.post? && authorised?
  end

  def cookie_set?
    @request.cookies['beaver'] == 'in'
  end
end

