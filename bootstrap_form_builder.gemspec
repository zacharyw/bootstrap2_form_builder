$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_form_builder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_form_builder"
  s.version     = BootstrapFormBuilder::VERSION
  s.authors     = ["Zachary G. Wright"]
  s.email       = ["zacharygwright@gmail.com"]
  s.homepage    = "https://github.com/zacharyw/bootstrap_form_builder"
  s.summary     = "Adds form builder and a helper method to ActionView that generates forms with bootstrap markup."
  s.description = "Adds form builder and a helper method to ActionView that generates forms with bootstrap markup."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"

  s.add_development_dependency "sqlite3"
end
