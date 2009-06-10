# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{greeneggs}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Fleet"]
  s.date = %q{2009-06-09}
  s.email = %q{disinnovate@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "greeneggs.gemspec",
     "lib/greeneggs.rb",
     "spec/greeneggs_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/disinnovate/greeneggs}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{GreenEggs is a small RedGreen-inspired plugin for Bacon}
  s.test_files = [
    "spec/greeneggs_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bacon>, [">= 1.0"])
    else
      s.add_dependency(%q<bacon>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<bacon>, [">= 1.0"])
  end
end
