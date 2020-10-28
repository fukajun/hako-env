require_relative 'lib/hako/envvars/version'

Gem::Specification.new do |spec|
  spec.name          = "hako-envvars"
  spec.version       = Hako::Envvars::VERSION
  spec.authors       = ["Jun Fukaya"]
  spec.email         = ["fukajun.shark@gmail.com"]

  spec.summary       = %q{Provide variable from environment to hako}
  spec.description   = %q{Provide variable from environment to hako}
  spec.homepage      = "https://github.com/fukajun/hako-envvars"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'hako'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
