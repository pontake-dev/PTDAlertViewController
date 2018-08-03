//
//  UIGestureRecognizerExtensions.swift
//
//  Created by pontake-dev on 2017/10/08.
//  Copyright © 2017年 pontake-dev. All rights reserved.
//

import Foundation
import UIKit

// Reference code
// https://gist.github.com/JohnCoates/2b6892b023a3f93092ab395cb8b743c9

// Allow UITapGestureRecognizer actions to be described in closures
/* use this
 UITapGestureRecognizer(addToView: targetView) {
 print("tapped!")
 }
 */
extension UIGestureRecognizer {
    @discardableResult convenience public init(addToView targetView: UIView,
                                               closure: @escaping () -> Void) {
        self.init()
        
        GestureTarget.add(gesture: self,
                          closure: closure,
                          toView: targetView)
    }
}

fileprivate class GestureTarget: UIView {
    class ClosureContainer {
        weak var gesture: UIGestureRecognizer?
        let closure: (() -> Void)
        
        init(closure: @escaping () -> Void) {
            self.closure = closure
        }
    }
    
    var containers = [ClosureContainer]()
    
    convenience init() {
        self.init(frame: .zero)
        isHidden = true
    }
    
    class func add(gesture: UIGestureRecognizer, closure: @escaping () -> Void,
                   toView targetView: UIView) {
        let target: GestureTarget
        if let existingTarget = existingTarget(inTargetView: targetView) {
            target = existingTarget
        } else {
            target = GestureTarget()
            targetView.addSubview(target)
        }
        let container = ClosureContainer(closure: closure)
        container.gesture = gesture
        target.containers.append(container)
        
        gesture.addTarget(target, action: #selector(GestureTarget.target(gesture:)))
        targetView.addGestureRecognizer(gesture)
    }
    
    class func existingTarget(inTargetView targetView: UIView) -> GestureTarget? {
        for subview in targetView.subviews {
            if let target = subview as? GestureTarget {
                return target
            }
        }
        return nil
    }
    
    func cleanUpContainers() {
        containers = containers.filter({ $0.gesture != nil })
    }
    
    @objc func target(gesture: UIGestureRecognizer) {
        cleanUpContainers()
        
        for container in containers {
            guard let containerGesture = container.gesture else {
                continue
            }
            
            if gesture === containerGesture {
                container.closure()
            }
        }
    }
}
