//
//  ViewController.swift
//  Demo
//
//  Created by pontake-dev on 2018/08/03.
//  Copyright © 2018年 pontake-dev. All rights reserved.
//

import UIKit
import PTDAlertViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showDialogButtonTapped(_ sender: UIButton) {
        PTDAlertViewController.showDialog(title: "title", message: "message")
    }
    
    @IBAction func showYesOnlyAlertButtonTapped(_ sender: UIButton) {
        PTDAlertViewController.showYesOnlyAlert(title: "title", message: "message") {
            print("Alert Yes button tapped.")
        }
    }
    
    @IBAction func showYesNoAlertButtonTapped(_ sender: UIButton) {
        PTDAlertViewController.showYesNoAlert(title: "title", message: "message") { (isYesTapped) in
            if isYesTapped {
                print("Alert Yes button tapped.")
            } else {
                print("Alert No button tapped.")
            }
        }
    }

}

