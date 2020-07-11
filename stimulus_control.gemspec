$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "stimulus_control/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "stimulus_control"
  spec.version     = StimulusControl::VERSION
  spec.authors     = ["Bernardo Gurgel"]
  spec.email       = ["bernardogfilho@gmail.com"]
  spec.homepage    = "https://github.com/brnrdog/stimulus_control"
  spec.summary     = "Rails forms powerered by Stimulus"
  spec.description = "Rails forms powerered by Stimulus"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "simplecov"
end
