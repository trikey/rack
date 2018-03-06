class TimeFormat
  FORMATS = {
    'year' => '%Y',
    'month' => '%M',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    status = 404 if env['REQUEST_PATH'] != '/time'
    params = Rack::Utils.parse_nested_query(env['QUERY_STRING'])
    format = params['format'].split(',')

    unknown_formats = format.reject{ |format_name| FORMATS.keys.include? format_name }

    if unknown_formats.length > 0
      body = ["Unknown time format [#{unknown_formats.join(', ')}]"]
      status = 400
    else
      correct_format = format.map { |format_name| FORMATS[format_name] }.join('-')
      body = body.map { |date_time| DateTime.parse(date_time).strftime(correct_format) }
    end
    [status, headers, body]
  end
end