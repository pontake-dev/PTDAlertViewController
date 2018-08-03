//
//  PTDAlertViewController.swift
//  PTDAlertViewController
//
//  Created by pontake-dev on 2017/12/31.
//  Copyright © 2017年 pontake-dev. All rights reserved.
//

import UIKit

public class PTDAlertViewController: UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Display message dialog.
    ///
    /// - Parameters:
    ///   - title: title (optional)
    ///   - message: message text (required)
    ///   - animated: do animate. default = true (can omitted)
    ///   - showTime: Dialog display seconds. default = 1.5 　(can omitted)
    public static func showDialog(title: String?, message: String, animated: Bool = true, showTime: Double = 1.5 ) {
        let vc = PTDAlertViewController()
        UIApplication.shared.delegate?.window??.addSubview(vc.view)
        let dialogue = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.present(dialogue,
                   animated: animated) {
                    //Tap outside the dialog so that you can close the dialog.
                    dialogue.view.superview?.isUserInteractionEnabled = true
                    UITapGestureRecognizer(addToView: dialogue.view.superview!, closure: {
                        dialogue.dismiss(animated: true, completion: nil)
                        vc.view.removeFromSuperview()
                    })
                    //This dialog will be closed automatically after the time of the showTime argument.
                    DispatchQueue.main.asyncAfter(deadline: .now() + showTime,
                                                  execute: {
                                                    dialogue.dismiss(animated: true, completion: nil)
                                                    vc.view.removeFromSuperview()
                    })
        }
    }
    
    /// Display a message dialog with "Yes" button only.
    ///
    /// - Parameters:
    ///   - title: title (optional)
    ///   - message: message text (required)
    ///   - yesButtonMessage: Yes button text. default = "はい" (can omitted)
    ///   - animated: do animate. default = true (can omitted)
    ///   - completion: Closure called when pressing the Yes button.
    public static func showYesOnlyAlert(title: String?, message: String,yesButtonMessage: String = "はい",animated: Bool = true, completion: (() -> Void)?) {
        let vc = PTDAlertViewController()
        UIApplication.shared.delegate?.window??.addSubview(vc.view)
        let dialogue = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Yes button
        let defaultAction: UIAlertAction = UIAlertAction(title: yesButtonMessage, style: .default) { (action) in
            if let _completion = completion {
                _completion()
            }
            dialogue.dismiss(animated: true, completion: nil)
            vc.view.removeFromSuperview()
        }
        
        dialogue.addAction(defaultAction)
        vc.present(dialogue, animated: animated, completion: nil)
    }
    
    /// Displays a message dialog with "Yes" and "No" buttons.
    ///
    /// - Parameters:
    ///   - title: title (optional)
    ///   - message: message text (required)
    ///   - yesButtonMessage: Yes button text. default = "はい" (can omitted)
    ///   - noButtonMessage: No button text. default = "いいえ" (can omitted)
    ///   - animated: do animate. default = true (can omitted)
    ///   - completion: Closure called when pressing the Yes or No button. Yes pressed result = true, No pressed result = false
    public static func showYesNoAlert(title: String?, message: String,yesButtonMessage: String = "はい", noButtonMessage: String = "いいえ", animated: Bool = true, completion: ((_ result: Bool) -> Void)?) {
        let vc = PTDAlertViewController()
        UIApplication.shared.delegate?.window??.addSubview(vc.view)
        let dialogue = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //YES button
        let defaultAction: UIAlertAction = UIAlertAction(title: yesButtonMessage, style: .default) { (action) in
            if let _completion = completion {
                _completion(true)
            }
            dialogue.dismiss(animated: true, completion: nil)
            vc.view.removeFromSuperview()
        }
        
        //NO button
        let cancelAction: UIAlertAction = UIAlertAction(title: noButtonMessage, style: .cancel) { (action) in
            if let _completion = completion {
                _completion(false)
            }
            dialogue.dismiss(animated: true, completion: nil)
            vc.view.removeFromSuperview()
        }
        
        dialogue.addAction(cancelAction)
        dialogue.addAction(defaultAction)
        vc.present(dialogue, animated: animated, completion: nil)
        
    }
}
