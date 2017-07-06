Pod::Spec.new do |s|
  s.name = 'SwiftKick'
  s.version = '1.1.0-development'
  s.license = { :type => "MIT" }
  s.summary = 'Some classes and functions for kickstarting your Swift development project'
  s.homepage = 'https://github.com/dudash/swiftkick'
  s.social_media_url = 'http://about.me/jasondudash'
  s.authors = { 'Jason Dudash' => 'jason.dudash@gmail.com' }

  s.platform  = :ios, :tvos
  s.tvos.deployment_target = '9.1'
  s.ios.deployment_target = '8.1' 

  s.requires_arc = true
  s.source = { :git => '.' }
  s.source_files = 'Sources/*'

  s.pod_target_xcconfig =  { 'SWIFT_VERSION' => '3.0' }

end
