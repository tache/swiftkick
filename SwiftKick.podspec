Pod::Spec.new do |s|
  s.name = 'SwiftKick'
  s.version = '1.1.2'
  s.license = { :type => "MIT" }
  s.summary = 'Some classes and functions for kickstarting your Swift development project'
  s.homepage = 'https://github.com/dudash/swiftkick'
  s.social_media_url = 'http://about.me/jasondudash'
  s.authors = { 'Jason Dudash' => 'jason.dudash@gmail.com' }

  s.platform  = :ios, :tvos
  s.tvos.deployment_target = '10.2'
  s.ios.deployment_target = '9.3'

  s.requires_arc = true
  s.source = { :git => 'https://github.com/dudash/swiftkick.git', :tag => s.version }
  s.source_files = 'Sources/*.{h,swift}'

  s.pod_target_xcconfig =  { 'SWIFT_VERSION' => '3.1' }

end
