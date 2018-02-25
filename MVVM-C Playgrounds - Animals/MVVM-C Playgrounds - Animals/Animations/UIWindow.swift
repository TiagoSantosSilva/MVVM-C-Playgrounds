//
//  UIWindow.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

extension UIWindow {
    func transitionWithFade(viewController: UIViewController) {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.rootViewController = viewController
        }, completion: nil)
    }
    
    func transitionWithSlide(viewController: UIViewController) {
        UIView.transition(with: self, duration: 0.3, options: .curveEaseInOut, animations: {
            self.rootViewController = viewController
        }, completion: nil)
    }
}
