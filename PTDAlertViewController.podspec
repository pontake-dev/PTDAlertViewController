Pod::Spec.new do |s|
  s.name         = "PTDAlertViewController"
  s.version      = "1.0.0"
  s.summary      = "PTDAlertViewController is a wrapper around UIalertcontroller that displays Alerts with simple code."
  s.homepage     = "https://github.com/pontake-dev/PTDAlertViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "pontake-dev" => "pontake.dev@gmail.com" }
  s.platform     = :ios, "8.0"
  s.swift_version = "4.0"
  s.source       = { :git => "https://github.com/pontake-dev/PTDAlertViewController.git", :tag => "#{s.version}" }
  s.source_files  = "PTDAlertViewController/**/*.{swift}"

end