# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rest-open-uri"
  s.version = "1.0.0"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Leonard Richardson"]
  s.cert_chain = nil
  s.date = "2006-12-21"
  s.description = "rest-open-uri is a hack of, and drop-in replacement for, open-uri. It supports all standard HTTP methods (not just GET) and allows you to send an entity-body. This gem will be deprecated if and when equivalent functionality makes it into core Ruby."
  s.email = "leonardr@segfault.org"
  s.extra_rdoc_files = ["CHANGELOG"]
  s.files = ["CHANGELOG"]
  s.homepage = "http://rubyforge.org/tracker/?func=detail&aid=6321&group_id=426&atid=1700"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubygems_version = "1.8.16"
  s.summary = "A drop-in replacement for open-uri for use in REST clients."

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
