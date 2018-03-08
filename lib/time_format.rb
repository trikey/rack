class TimeFormat
  FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(format)
    @format = format.split(',')
  end

  def formatted_date
    unknown_formats = @format.reject{ |format_name| FORMATS.keys.include? format_name }

    if unknown_formats.empty?
      correct_format = @format.map { |format_name| FORMATS[format_name] }.join('-')
      DateTime.now.strftime(correct_format)
    else
      raise "Unknown time format [#{unknown_formats.join(', ')}]"
    end
  end
end