$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_log/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_log"
  s.version     = RailsLog::VERSION
  s.authors     = ["qinmingyuan"]
  s.email       = ["mingyuan0715@foxmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsLog."
  s.description = "TODO: Description of RailsLog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
