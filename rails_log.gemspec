$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_log/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_log"
  s.version     = RailsLog::VERSION
  s.authors     = ["qinmingyuan"]
  s.email       = ["mingyuan0715@foxmail.com"]
  s.homepage    = "https://github.com/qinmingyuan/rails_log"
  s.summary     = "Summary of RailsLog."
  s.description = "Description of RailsLog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 5.0'
  s.add_dependency 'rails_com', '~> 1.0.0'
  s.add_dependency 'default_where'
end
