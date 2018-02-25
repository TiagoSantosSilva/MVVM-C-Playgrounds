//
//  Application Coordinator.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

protocol ApplicationCoordinatorRepresentable {
    
    // MARK: - Functions
    
    func startCoordinator()
}

class ApplicationCoordinator: ApplicationCoordinatorRepresentable {
    
    // MARK: - Window
    
    private let window: UIWindow
    
    // MARK: -
    
    private var baseCoordinator: BaseCoordinatorRepresentable?
    
    // MARK: - Initializer
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Functions
    
    func startCoordinator() {
        start()
    }
}

extension ApplicationCoordinator: Coordinator {
    func start() {
        baseCoordinator = BaseCoordinator(window: window)
        baseCoordinator?.startCoordinator()
    }
}
