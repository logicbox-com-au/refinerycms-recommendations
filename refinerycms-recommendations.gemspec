# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-recommendations'
  s.authors           = ['Rich Larcombe', 'Ben Bruscella']
  s.version           = '1.0.0'
  s.description       = 'Ruby on Rails Recommendations extension for Refinery CMS'
  s.date              = '2012-06-10'
  s.summary           = 'Recommendations extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.4'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.4'
end

