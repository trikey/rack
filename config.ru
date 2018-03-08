require_relative 'middleware/not_found'
require_relative 'lib/time_format'
require_relative 'app'

use NotFound
run App.new