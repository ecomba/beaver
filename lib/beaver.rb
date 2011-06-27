class Beaver
  def initialize app, options={}
    @app, @options = app, options
  end

  def init_environment env
    @env = env
    @response = Rack::Response.new
    @request = Rack::Request.new(env)
  end

  def authorised?
    @request.params['email'] == 'test@beaver.com' && @request.params['password'] == 's3cr3t'
  end

  def open_dam
    [302,{'Location' => @request.path, 'Content-Type' => 'text/plain', 'Set-Cookie' => 'beaver=in;path=/'},['']]
  end

  def default_form
    File.read(File.dirname(__FILE__) + '/beaver_form.html')
  end

  def close_dam
    @response.write default_form
    @response.finish
  end

  def call(env)
    init_environment env
    if @request.cookies['beaver'] == 'in'
      @app.call env
    elsif @request.post? && authorised?
      open_dam
    else
      close_dam
    end
  end
end

