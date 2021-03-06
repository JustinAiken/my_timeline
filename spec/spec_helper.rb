ENV['RAILS_ENV'] ||= 'test'

require File.expand_path "../dummy/config/environment.rb",  __FILE__
require 'rspec/rails'
require 'factory_girl_rails'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include MyTimeline::Engine.routes.url_helpers
  config.before(:each) { @routes = MyTimeline::Engine.routes }

  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
