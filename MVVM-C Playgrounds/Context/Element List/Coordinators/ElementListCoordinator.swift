//
//  ElementListCoordinator.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import UIKit

protocol ElementListCoordinatorDelegate: class {
    func listCoordinatorDidFinish(elementListCoordinator: ElementListCoordinator)
}

class ElementListCoordinator {
    
    // MARK: - Properties
    
    weak var delegate: ElementListCoordinatorDelegate?
    
    // MARK: -
    
    var elementDetailsCoordinator: ElementDetailsCoordinator?
    
    // MARK: -
    
    var elementListViewController: ElementListViewController?
    
    // MARK: -
    
    var window: UIWindow
    
    // MARK: - Initializer
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension ElementListCoordinator: Coordinator {
    func start() {
        elementListViewController = ElementListViewController()
        
        guard let elementListViewController = elementListViewController else { return }
        
        let viewModel = ElementListViewModel()
        viewModel.coordinatorDelegate = self
        elementListViewController.viewModel = viewModel
        window.rootViewController = elementListViewController
    }
}

extension ElementListCoordinator: ElementListViewModelCoordinatorDelegate {
    
    // TODO: - Finish the implementation
    
    func elementListViewModelDidSelectData(_ viewModel: ElementListViewModel, element: Element) {
        elementDetailsCoordinator = ElementDetailsCoordinator(window: window, element: element)
        elementDetailsCoordinator?.delegate = self
        elementDetailsCoordinator?.start()
    }
}

extension ElementListCoordinator: ElementDetailsCoordinatorDelegate {
    func detailsCoordinatorDidFinish(detailsCoordinator: ElementDetailsCoordinator) {
        self.elementDetailsCoordinator = nil
        window.rootViewController = elementListViewController
    }
}
