# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ans-hash/version"

Gem::Specification.new do |s|
  s.name        = "ans-hash"
  s.version     = Ans::Hash::VERSION
  s.authors     = ["sakai shunsuke"]
  s.email       = ["sakai@ans-web.co.jp"]
  s.homepage    = "https://github.com/answer/ans-hash"
  s.summary     = %q{sha256 等のハッシュを生成するメソッドを提供する}
  s.description = %q{ハッシュを生成する}

  s.rubyforge_project = "ans-hash"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency "ans-gem-builder"
end
