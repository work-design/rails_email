Gem::Specification.new do |s|
  s.name = 'rails_email'
  s.version = '0.0.2'
  s.authors = ['Mingyuan Qin']
  s.email = ['mingyuan0715@foxmail.com']
  s.summary = 'Record rails error log and email log'
  s.description = 'Description of RailsLog.'

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
  s.add_dependency 'rails_auth'
end
