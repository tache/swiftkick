Pod::Spec.new do |s|
  s.name = 'SwiftKick'
  s.version = '1.2.0'
  s.license = { :type => "MIT" }
  s.summary = 'Some classes and functions for kickstarting your Swift development project'
  s.homepage = 'https://github.com/dudash/swiftkick'
  s.social_media_url = 'http://about.me/jasondudash'
  s.authors = { 'Jason Dudash' => 'jason.dudash@gmail.com' }

  s.platform  = :ios, :tvos
  s.tvos.deployment_target = '10.2'
  s.ios.deployment_target = '9.3'

  s.requires_arc = true
  s.source = { 
    :git => 'https://github.com/dudash/swiftkick.git', :tag => s.version
  }
  s.source_files = 'Sources/*.{h,swift}'
  s.default_subspec = 'All'

 # All classes
  s.subspec 'All' do |subs|
    subs.source_files = 'Sources/**/*.swift'
  end

  # Collection classes
  s.subspec 'Collections' do |subs|
    subs.source_files = 'Sources/Collections/*.swift'
  end

  # All Extensions
  s.subspec 'Extensions' do |subs|
    subs.source_files = 'Sources/Extensions/*.swift', 'Sources/Extensions/**/*.swift'
  end

  # Individual extension
  s.subspec 'NumberExtensions' do |subs|
    subs.source_files = 'Sources/Extensions/NumberTypes/*.swift'
  end

  # Individual extension
  s.subspec 'StringExtensions' do |subs|
    subs.source_files = 'Sources/Extensions/String/*.swift'
  end

  # Individual extension
  s.subspec 'UIExtensions' do |subs|
    subs.source_files = 'Sources/Extensions/UITypes/*.swift'
  end

  # Individual extension (https://developer.apple.com/documentation/foundation/preferences)
  s.subspec 'PreferencesExtensions' do |subs|
    subs.source_files = 'Sources/Extensions/FoundationPreferences/*.swift'
  end

  # Logger classes
  s.subspec 'Logger' do |subs|
    subs.source_files = 'Sources/Logger/*.swift'
  end

  s.pod_target_xcconfig =  { 'SWIFT_VERSION' => '3.1' }

end
