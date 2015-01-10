Pod::Spec.new do |s|
  s.name = 'SwiftKick'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Useful classes for use with the Swift programming language'
  s.homepage = 'https://github.com/dudash/swiftkick'
  s.social_media_url = 'http://about.me/jasondudash'
  s.authors = { 'Jason Dudash' => 'jason.dudash@gmail.com' }
  s.source = { :git => 'https://github.com/dudash/swiftkick.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'Source/*'
end
