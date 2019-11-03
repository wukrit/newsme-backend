# -*- encoding: utf-8 -*-
# stub: prettier 0.15.0 ruby lib

Gem::Specification.new do |s|
  s.name = "prettier".freeze
  s.version = "0.15.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kevin Deisz".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-08-06"
  s.executables = ["rbprettier".freeze]
  s.files = ["exe/rbprettier".freeze]
  s.homepage = "https://github.com/prettier/plugin-ruby#readme".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.4".freeze
  s.summary = "prettier plugin for the Ruby programming language".freeze

  s.installed_by_version = "3.0.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
  end
end
