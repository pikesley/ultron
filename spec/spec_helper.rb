require 'ultron'

require 'timecop'
require 'coveralls'
Coveralls.wear_merged!

require_relative 'support/vcr_setup'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
