Pod::Spec.new do |s|
  s.name         = "SFTransform3D"
  s.version      = "0.4"
  s.summary      = "An iOS category on UIView to simplify 3D transformations."
  s.description  = <<-DESC
                    SFTransform3D is an iOS category on UIView that simplifies applyinf some 3D transormations to the UIView.
                   DESC
  s.homepage     = "http://www.simon-fortelny.com"
  s.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author       = { 'Simon Fortelny' => 'sforteln@gmail.com' }
  s.source       = { :git => "https://github.com/sforteln/SFTransform3D.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.source_files = '*.{h,m}'
  s.framework    = "QuartzCore"
  s.requires_arc = true
end
