//
//  BaseCoordinator.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

protocol BaseCoordinatorDelegate: class {
    func baseCoordinatorDidFinish(baseCoordinator: BaseCoordinatorRepresentable)
}

protocol BaseCoordinatorRepresentable {
    func startCoordinator()
}

class BaseCoordinator: BaseCoordinatorRepresentable {
    
    // MARK: - Properties
    
    private var baseViewController: BaseViewController?
    
    // MARK: -
    
    private var window: UIWindow!
    
    // MARK: -
    
    private var secondCoordinator: SecondCoordinatorRepresentable?
    
    // MARK: - Initialization
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Functions
    
    func startCoordinator() {
        start()
    }
}

extension BaseCoordinator: Coordinator {
    func start() {
        baseViewController = BaseViewController()
        let viewModel: BaseViewModelRepresentable = BaseViewModel(coordinatorDelegate: self, viewDelegate: baseViewController!)
        baseViewController!.viewModel = viewModel
        window.rootViewController = baseViewController
        window?.makeKeyAndVisible()
    }
}

extension BaseCoordinator: BaseViewModelCoordinatorDelegate {
    func didSelectAnimal(_ viewModel: BaseViewModelRepresentable, animal: Animal) {
        secondCoordinator = SecondCoordinator(window: window, delegate: self, animal: animal)
        secondCoordinator?.startCoordinator()
    }
}

extension BaseCoordinator: SecondCoordinatorDelegate {
    func secondCoordinatorDidFinish(_ secondCoordinator: SecondCoordinatorRepresentable) {
        self.secondCoordinator = nil
        window.transitionWithFade(viewController: baseViewController!)
    }
}
