Pod::Spec.new do |s|
  s.name             = 'APIVerveAdviceGenerator'
  s.version          = '1.1.9'
  s.summary          = 'Advice Generator is a simple tool for generating random pieces of advice. It returns a random piece of advice.'
  s.description      = <<-DESC
Advice Generator is a simple tool for generating random pieces of advice. It returns a random piece of advice.

This iOS/macOS SDK provides a convenient way to access the Advice Generator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  s.source           = { :git => 'https://github.com/apiverve/advice-api.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.14'
  s.tvos.deployment_target = '12.0'
  s.watchos.deployment_target = '5.0'

  s.swift_version = '5.0'

  s.source_files = 'Sources/APIVerveAdviceGenerator/**/*'

  s.frameworks = 'Foundation'
end
