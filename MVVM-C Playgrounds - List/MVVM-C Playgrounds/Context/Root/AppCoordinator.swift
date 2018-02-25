//
//  AppCoordinator.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    // MARK: - Keys
    
    fileprivate let LIST_KEY: String  = "List"
    
    // MARK: - Properties
    
    var window: UIWindow
    
    // MARK: -
    
    var coordinators = [String : Coordinator]()
    
    // MARK: - Initializer
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension AppCoordinator: Coordinator {
    
    // MARK: - Start
    
    func start() {
        showList()
    }
}

extension AppCoordinator: ElementListCoordinatorDelegate {
    
    // MARK: - Show List
    
    func showList() {
        let listCoordinator = ElementListCoordinator(window: window)
        coordinators[LIST_KEY] = listCoordinator
        listCoordinator.delegate = self
        listCoordinator.start()
    }
    
    // MARK: - List Coordinator Did Finish
    
    func listCoordinatorDidFinish(elementListCoordinator: ElementListCoordinator) {
        coordinators[LIST_KEY] = nil
    }
}
