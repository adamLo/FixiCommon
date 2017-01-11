#
# Be sure to run `pod lib lint FixiCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FixiCommon'
  s.version          = '0.1.0'
  s.summary          = 'Common Fixi source'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Fixi Common Files custom private Pod to share all common source files as modules for both apps: Citizen and Handler to avoid code duplications
Contains:
- Analytics Proxy
                       DESC

  s.homepage         = "http://decos.com"
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Private', :file => 'LICENSE' }
  s.author           = { 'Adam Lovastyik' => 'a.lovastyik@decos.com' }
#s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/FixiCommon.git', :tag => s.version.to_s }
  s.source       = { :git => "https://github.com/adamLo/FixiCommon.git", :commit => "a74ec388906826be0f2bbfa717128cd784d8d6a6" }
  s.social_media_url = 'https://twitter.com/nazabiker'

  s.ios.deployment_target = '8.2'

  s.source_files = 'FixiCommon/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FixiCommon' => ['FixiCommon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
  s.dependency 'Fabric'
  s.dependency 'Crashlytics'

  s.requires_arc = true
end
