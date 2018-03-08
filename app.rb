class App
  def call(env)
    response = Rack::Response.new
    response['Content-Type'] = 'text/plain'
    req = Rack::Request.new(env)
    time_format = TimeFormat.new(req.params['format'])
    begin
      response.body = [time_format.formatted_date]
    rescue StandardError => e
      response.body = [e.message]
      response.status = 400
    end
    response.finish
  end
end