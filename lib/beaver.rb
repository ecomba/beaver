class Beaver
  def initialize app, options={}
    @app, @options = app, options
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.post?
      if request.params['email'] == 'test@beaver.com' && request.params['password'] == 's3cr3t'
        response = Rack::Response.new
        return [302,{'Location' => request.path},'']
      end
    end

    response = Rack::Response.new
    response.write '<form'
    return response.finish
  end
end

