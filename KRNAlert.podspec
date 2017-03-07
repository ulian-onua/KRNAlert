Pod::Spec.new do |s|

  s.name         = "KRNAlert"
  s.version      = "0.0.2"
  s.summary      = "KRNAlert is a wrapper of UIAlertController to simplify its usage in typical cases"

  s.homepage     = "https://github.com/ulian-onua/KRNAlert"

  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "Julian Drapaylo" => "ulian.onua@gmail.com" }
#s.social_media_url   = "http://www.linkedin.com/in/julian-drapaylo"



  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRNAlert.git", :tag => "0.0.2" }


  s.source_files  = "KRNAlert/*.{h,m}"
  s.public_header_files = "KRNAlert/*.h"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end
