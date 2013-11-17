$:.push File.expand_path("../lib", __FILE__)

require "my_timeline/version"

Gem::Specification.new do |s|
  s.name        = "my_timeline"
  s.version     = MyTimeline::VERSION
  s.authors     = ["Justin Aiken"]
  s.email       = ["60tonangel@gmail.com"]
  s.homepage    = "https://www.github.com/JustinAiken/my_timeline"
  s.summary     = "Social Media Aggregation Timeline"
  s.description = "Social Media Aggregation Timeline"

  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")

  s.add_runtime_dependency "rails"
  s.add_runtime_dependency "kaminari"
  s.add_runtime_dependency 'ledermann-rails-settings'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'guard-rspec'
end
