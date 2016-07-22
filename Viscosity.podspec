Pod::Spec.new do |s|
  s.name = 'Viscosity'
  s.version = '0.0.2'
  s.license = 'MIT'
  s.summary = 'Harness the power of auto layout with a simplified, chainable, and compile time safe syntax.'
  s.homepage = 'https://github.com/Wzxhaha/Viscosity'
  s.authors = { 'WzxJiang' => 'wzxjiang@foxmail.com' }
  s.social_media_url = 'http://wzxjiang.com'
  s.source = { :git => 'https://github.com/Wzxhaha/Viscosity.git', :tag => '0.0.2' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Viscosity/*.swift'
  s.requires_arc = true
end