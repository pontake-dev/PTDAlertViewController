Pod::Spec.new do |s|
  s.name         = "PTDAlertViewController"
  s.version      = "1.0.1"
  s.summary      = "PTDAlertViewController is a wrapper around UIalertcontroller that displays Alerts with simple code."
  s.description  = <<-DESC
  PTDAlertViewController is a wrapper around UIalertcontroller that displays Alerts with simple code.

  Example Usages

  ```swift
  // MARK: Message dialogue display with no button.

  PTDAlertViewController.showDialog(title: "title", message: "message")
  //When specifying all arguments
  PTDAlertViewController.showDialog(title: nil, message: "message", animated: true, showTime: 1.0)

  // MARK: Message dialogue display that displays one button.

  PTDAlertViewController.showYesOnlyAlert(title: "title", message: "message") {
      print("Alert Yes button tapped.")
  }
  //When specifying all arguments
  PTDAlertViewController.showYesOnlyAlert(title: nil, message: "message", yesButtonMessage: "agree", animated: true) {
      print("Alert Yes button tapped.")
  }

  // MARK: Message dialogue display to display two buttons.
  PTDAlertViewController.showYesNoAlert(title: "title", message: "message") { (isYesTapped) in
      if isYesTapped {
          print("Alert Yes button tapped.")
      } else {
          print("Alert No button tapped.")
      }
  }
  //When specifying all arguments
  PTDAlertViewController.showYesNoAlert(title: nil, message: "message", yesButtonMessage: "done", noButtonMessage: "cancel", animated: true) { (isYesTapped) in
      if isYesTapped {
          print("Alert Yes button tapped.")
      } else {
          print("Alert No button tapped.")
      }
  }
  ```
                   DESC
  s.homepage     = "https://github.com/pontake-dev/PTDAlertViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "pontake-dev" => "pontake.dev@gmail.com" }
  s.platform     = :ios, "8.0"
  s.swift_version = "4.0"
  s.source       = { :git => "https://github.com/pontake-dev/PTDAlertViewController.git", :tag => "#{s.version}" }
  s.source_files  = "PTDAlertViewController/**/*.{swift}"

end
