//
//  RootCoordinator.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import UIKit

class RootCoordinator {
    
    // MARK: - Dependencies
    
    private let window: UIWindow
    
    // MARK: -
    
    fileprivate let navigator: NavigatorRepresentable
    
    // MARK: - Initializer
    
    init(window: UIWindow, navigator: NavigatorRepresentable) {
        self.window = window
        self.navigator = navigator
        self.window.rootViewController = navigator.root()
        self.window.makeKeyAndVisible()
    }
}

extension RootCoordinator: Coordinator {
    
    func start() {
        
    }
}
