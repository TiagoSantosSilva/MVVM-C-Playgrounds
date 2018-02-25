//
//  ElementDetailsCoordinator.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import UIKit

protocol ElementDetailsCoordinatorDelegate: class {
    func detailsCoordinatorDidFinish(detailsCoordinator: ElementDetailsCoordinator)
}

class ElementDetailsCoordinator {
    
    // MARK: - Properties
    
    weak var delegate: ElementDetailsCoordinatorDelegate?
    
    // MARK: -
    
    let element: Element
    
    // MARK: -
    
    let window: UIWindow
    
    // MARK: - Initializer
    
    init(window: UIWindow, element: Element) {
        self.window = window
        self.element = element
    }
}

extension ElementDetailsCoordinator: Coordinator {
    func start() {
        let detailsViewController = ElementDetailsViewController()
        let detailsViewModel = ElementDetailsViewModel(element: element)
        detailsViewModel.coordinatorDelegate = self
        detailsViewController.viewModel = detailsViewModel
        window.rootViewController = detailsViewController
    }
}

extension ElementDetailsCoordinator: ElementDetailsViewModelCoordinatorDelegate {
    func detailsViewModelDidEnd(_ viewModel: ElementDetailsViewModel) {
        delegate?.detailsCoordinatorDidFinish(detailsCoordinator: self)
    }
}
