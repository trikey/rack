class NotFound

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    req = Rack::Request.new(env)
    status = 404 if req.path != '/time'
    [status, headers, body]
  end
end