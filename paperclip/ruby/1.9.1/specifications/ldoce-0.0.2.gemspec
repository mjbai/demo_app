# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ldoce"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Burns"]
  s.date = "2012-02-20"
  s.description = "API for the Longman Dictionary of Contemporary English"
  s.email = ["markthedeveloper@gmail.com"]
  s.homepage = "https://github.com/markburns/ldoce"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.16"
  s.summary = "So far covers playing mp3 media files and fetching definitions"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end
