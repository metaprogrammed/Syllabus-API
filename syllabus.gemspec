Gem::Specification.new do |s|
  s.name        = 'syllabus'
  s.version     = '0.0.1'
  s.date        = '2016-03-12'
  s.summary     = "The Teachable API gem"
  s.description = "A wrapper for communicating with the Teachable API"
  s.authors     = ["Natalia Aranguren"]
  s.email       = 'nati.aranguren@gmail.com'
  s.files       = Dir['lib/*.rb'] + Dir['lib/syllabus/*.rb']
  s.test_files  = `git ls-files -- {test}/*`.split("\n")
  s.homepage    = 'https://bitbucket.org/metaprogrammed/syllabus'
  s.license     = 'MIT'


  if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('0.0.1')
    s.add_runtime_dependency(%q<faraday>, ["~> 0.9", ">= 0.9.0"])
    s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9", ">= 0.9.0"])
    s.add_development_dependency(%q<json_pure>, ["~> 1.4"])
    s.add_development_dependency(%q<multi_json>, ["< 2.0.0", ">= 0.0.5"])
    s.add_development_dependency(%q<test-unit>, ["~> 3.0"])
  else
    s.add_runtime_dependency(%q<faraday>, ["~> 0.9", ">= 0.9.0"])
    s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9", ">= 0.9.0"])    
    s.add_dependency(%q<json_pure>, ["~> 1.4"])
    s.add_dependency(%q<multi_json>, ["< 2.0.0", ">= 0.0.5"])
    s.add_dependency(%q<test-unit>, ["~> 3.0"])
  end



end