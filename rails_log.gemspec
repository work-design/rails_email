$:.push File.expand_path('../lib', __FILE__)
require 'rails_log/version'

Gem::Specification.new do |s|
  s.name = 'rails_log'
  s.version = RailsLog::VERSION
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/yougexiangfa/rails_log'
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

  s.add_dependency 'rails', '>= 5.0', '<= 6.0'
  s.add_runtime_dependency 'rails_com', '~> 1.2'
  s.add_runtime_dependency 'default_where', '~> 2.2'
  s.add_runtime_dependency 'default_form', '~> 1.3'
end
