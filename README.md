# PTDAlertViewController

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/PTDAlertViewController.svg?style=flat)](http://cocoapods.org/pods/PTDAlertViewController)
[![License](https://img.shields.io/cocoapods/l/PTDAlertViewController.svg?style=flat)](http://cocoapods.org/pods/PTDAlertViewController)
[![Platform](https://img.shields.io/cocoapods/p/PTDAlertViewController.svg?style=flat)](http://cocoapods.org/pods/PTDAlertViewController)

PTDAlertViewController is a wrapper around UIalertController that displays Alerts with simple code.
PTDAlertViewControllerはアラートダイアログをシンプルなコードで実装するためのUIalertControllerのラッパーです。

## Description

- Message dialogue display with no button.
ボタンなしのメッセージダイアログ表示します。

After a certain number of seconds have elapsed, a message dialog will be displayed which closes automatically. You can also specify the number of seconds to close.
And, by tapping outside of the message dialog, the user can erase the dialog immediately.
ある秒数が経過したら自動的に閉じるメッセージダイアログを表示します。閉じる秒数は指定することもできます。
メッセージダイアログの外をタップすることによって、ダイアログを消去することができます。

- Message dialogue display that displays one button.
ボタンを1つだけ表示させるメッセージダイアログ表示。

You can detect that you tapped the dialog button with a closure.
ダイアログのボタンをタップした事をクロージャで取得できます。

- Message dialogue display to display two buttons.
ボタンを2つ表示させるメッセージダイアログ表示。

You can detect that you tapped the dialog button with a closure.
ダイアログのボタンをタップした事をクロージャで取得できます。

## Example Usages

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

## Installation

### CocoaPods

Add to `Podfile`:

```
pod 'PTDAlertViewController'
```

### Carthage

Add to `Cartfile`:

```
github "pontake-dev/PTDAlertViewController"
```

## License

MIT
