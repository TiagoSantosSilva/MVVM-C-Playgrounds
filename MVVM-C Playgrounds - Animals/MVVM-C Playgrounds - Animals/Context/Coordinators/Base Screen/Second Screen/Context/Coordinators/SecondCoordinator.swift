//
//  SecondCoordinator.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

protocol SecondCoordinatorDelegate: class {
    func secondCoordinatorDidFinish(_ secondCoordinator: SecondCoordinatorRepresentable)
}

protocol SecondCoordinatorRepresentable {
    
    // MARK: - Properties
    
    weak var delegate: SecondCoordinatorDelegate? { get }
    
    // MARK: - Functions
    
    func startCoordinator()
}

class SecondCoordinator: SecondCoordinatorRepresentable {
    
    // MARK: - Parameters
    
    private var window: UIWindow!
    
    // MARK: -
    
    private var animal: Animal
    
    // MARK: - Properties
    
    weak var delegate: SecondCoordinatorDelegate?
    
    // MARK: -
    
    private var secondViewController: SecondViewController?
    
    // MARK: - Initialization
    
    init(window: UIWindow, delegate: SecondCoordinatorDelegate, animal: Animal) {
        self.window = window
        self.delegate = delegate
        self.animal = animal
    }
    
    // MARK: - Functions
    
    func startCoordinator() {
        start()
    }
}

extension SecondCoordinator: Coordinator {
    func start() {
        secondViewController = SecondViewController(animal: animal)
        let secondViewModel = SecondViewModel(viewDelegate: secondViewController!, coordinatorDelegate: self)
        secondViewController?.viewModel = secondViewModel
        window.transitionWithSlide(viewController: secondViewController!)
    }
}

extension SecondCoordinator: SecondViewModelCoordinatorDelegate {
    func didPressClose(_ viewModel: SecondViewModelRepresentable) {
        delegate?.secondCoordinatorDidFinish(self)
    }
}

