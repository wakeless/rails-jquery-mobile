Gem::Specification.new do |s|
  s.name = %q{rails-jquery-mobile}
  s.version = "0.1"
  s.summary = "Rails helper for jQuery Mobile"
  s.description = "Rails helper extensions for jQuery Mobile.
  
  First developed for the mobile version of http://terroir.me/"
  s.homepage = "http://github.com/wakeless/rails-jquery-mobile"
  s.test_files = ["spec/helpers/mobile_helper_spec.rb", "spec/spec_helper.rb"]
  s.files = ["lib/rails-jquery-mobile.rb"]
  
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.authors = ["Michael Gall"]
  s.email = %q{michael@wakeless.net}

  s.add_dependency %q<rails>, ["~> 3.0.0"]

  s.add_development_dependency %q<rspec-rails>, ["~> 2.5.0"]
  s.add_development_dependency %q<webrat>, ["~> 0.7.3"]
  
end
