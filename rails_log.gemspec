$:.push File.expand_path('lib', __dir__)
require 'rails_log/version'

Gem::Specification.new do |s|
  s.name = 'rails_log'
  s.version = RailsLog::VERSION
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_log'
  s.summary = 'Record rails error log and email log'
  s.description = 'Description of RailsLog.'
  s.license = 'LGPL-3.0'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails_com', '~> 1.2'
end
