Pod::Spec.new do |s|
  s.name          = "JHB_HUDView"
  s.version       = "0.0.2"
  s.summary       = "The first version of JHB_HUDView."
  s.description   =  "This is a plugin to show your application is in-progress and There are some different relizations offerred! You can choose the related-one and copy it to your projectfile ,then use it!"
  s.homepage      = "https://github.com/BruceFight/JHB_HUDView"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.platform      = :ios, "8.2"
  s.author        = { "CoderBala" => '1050848821@qq.com' }
  s.source        = { :git => 'https://github.com/BruceFight/JHB_HUDView.git', :tag =>  s.version }
  s.source_files  = "JHB_HUDView/*"
  s.requires_arc  = true
end
