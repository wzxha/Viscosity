Pod::Spec.new do |s|
  s.name = 'Viscosity'
  s.version = '0.0.4'
  s.license = 'MIT'
  s.summary = 'Harness the power of auto layout with a simplified, chainable, and compile time safe syntax.'
  s.homepage = 'https://github.com/Wzxhaha/Viscosity'
  s.authors = { 'WzxJiang' => 'wzxjiang@foxmail.com' }
  s.source = { :git => 'https://github.com/Wzxhaha/Viscosity.git', :tag => 0.0.4}
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
  s.requires_arc = true
end
