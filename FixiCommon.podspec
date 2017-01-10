Pod::Spec.new do |s|
  s.name             = "FixiCommon"
  s.version          = "1.0.0"
  s.summary          = "Fixi Citizen and Handler apps common sources"
  s.homepage         = "https://decos.visualstudio.com/DefaultCollection/Fixi/_git/FixiCommoniOS"
  s.license          = 'All source is private property of Decos Software Engineering B.V.'
  s.author           = { "adamLo" => "a.lovastyik@decos.com" }
  s.source           = { :git => "https://decos.visualstudio.com/DefaultCollection/Fixi/_git/FixiCommoniOS", :tag => s.version }
  s.social_media_url = 'https://twitter.com/nazabiker'

  s.platform     = :ios, '8.2'
  s.requires_arc = true

  s.source_files = 'Pod'
  s.resources = 'Pod/Assets/*'

  s.frameworks = 'Foundation'
  s.module_name = 'FixiCommon'
end