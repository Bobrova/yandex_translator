
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yandex_translator/version"

Gem::Specification.new do |spec|
  spec.name          = "yandex_translator"
  spec.version       = YandexTranslator::VERSION
  spec.authors       = ["Nastya Bobrova"]
  spec.email         = ["an.s.bobrova@gmail.com"]

  spec.summary       = %q{Yandex Translate API}
  spec.homepage      = "https://github.com/Bobrova/yandex_translator"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
