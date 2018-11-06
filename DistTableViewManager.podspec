Pod::Spec.new do |s|

  s.name         = "DistTableViewManager"
  s.version      = "1.0.1"
  s.summary      = "powerful data driven content manager for UITableView"
  s.author       = { "Damrin" => "75081647@qq.com" }
  s.homepage    = 'https://github.com/Damsir/DistTableViewManager'
  s.source      = { :git => 'https://github.com/Damsir/DistTableViewManager.git', :tag => s.version }
  s.license = "MIT"
  s.platform = :ios, "8.0"
  s.requires_arc = true
  s.source_files = "DistTableViewManager", "DistTableViewManager/**/*.{h,m}"
  # s.public_header_files = "DistPopView/*.h"
  #s.resources = 'DistDownload/Resource/*.{bundle}'
  s.framework = 'UIKit'
  s.ios.deployment_target = "8.0"

end
