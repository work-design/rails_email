$:.push File.expand_path('lib', __dir__)
require 'rails_log/version'

Gem::Specification.new do |s|
  s.name = 'rails_email'
  s.version = RailsEmail::VERSION
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_email'
  s.summary = 'Record rails error log and email log'
  s.description = 'Description of RailsLog.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir[
    'test/**/*'
  ]

  s.add_dependency 'rails_com', '~> 1.2'
end
