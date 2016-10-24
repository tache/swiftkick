Pod::Spec.new do |s|
  s.name = 'SwiftKick'
  s.version = '1.0.0'
  s.summary = 'Some classes and functions for kickstarting your Swift development project'
  s.homepage = 'https://github.com/dudash/swiftkick'
  s.license = { :type => "MIT" }
  s.authors = { 'Jason Dudash' => 'jason.dudash@gmail.com' }
  s.social_media_url = 'http://about.me/jasondudash'

  s.requires_arc = true
  s.platform  = :ios, :tvos
  s.tvos.deployment_target = '9.1'
  s.ios.deployment_target = '8.1'
  # s.osx.deployment_target = '10.9'
  s.source = { :git => 'https://github.com/dudash/swiftkick.git', :tag => s.version }
  s.source_files = 'Sources/*.{h,swift}'
  s.pod_target_xcconfig =  {
          'SWIFT_VERSION' => '3.0',
    }
end
