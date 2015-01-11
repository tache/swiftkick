Pod::Spec.new do |s|
  s.name = 'SwiftKick'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Useful classes for use with the Swift programming language'
  s.homepage = 'https://github.com/dudash/swiftkick'
  s.social_media_url = 'http://about.me/jasondudash'
  s.authors = { 'Jason Dudash' => 'jason.dudash@gmail.com' }
  s.source = { :git => 'https://github.com/dudash/swiftkick.git', :tag => s.version }
  
  s.ios.platform  = :ios, '8.0'
  s.osx.platform  = :osx, '10.9'
  s.requires_arc = true

  s.source_files = 'Source/*'
end
