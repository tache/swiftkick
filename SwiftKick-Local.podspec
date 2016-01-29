Pod::Spec.new do |s|
  s.name = 'SwiftKick'
  s.license = 'MIT'
  s.summary = 'Some classes and functions for kickstarting your Swift development project'
  s.homepage = 'https://github.com/dudash/swiftkick'
  s.social_media_url = 'http://about.me/jasondudash'
  s.authors = { 'Jason Dudash' => 'jason.dudash@gmail.com' }

  s.version = '0.0.6-development'
  s.source = { :git => '.' }
  
  s.platform  = :ios, '8.1'
  s.ios.deployment_target = '8.1' 
#  s.platform  = :osx, '10.9'
#  s.osx.deployment_target = '10.9'
  s.requires_arc = true
  s.source_files = 'Source/*'
end
