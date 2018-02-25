//
//  SecondViewModel.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import Foundation

protocol SecondViewModelViewDelegate: class {
    
}

protocol SecondViewModelCoordinatorDelegate: class {
    func didPressClose(_ viewModel: SecondViewModelRepresentable)
}

protocol SecondViewModelRepresentable {
    
    // MARK: - Properties
    
    weak var viewDelegate: SecondViewModelViewDelegate? { get }
    
    // MARK: -
    
    weak var coordinatorDelegate: SecondViewModelCoordinatorDelegate? { get }
    
    // MARK: - Functions
    
    func done()
}

struct SecondViewModel: SecondViewModelRepresentable {
    
    // MARK: - Properties
    
    weak var viewDelegate: SecondViewModelViewDelegate?
    
    // MARK: -
    
    weak var coordinatorDelegate: SecondViewModelCoordinatorDelegate?
    
    // MARK: - Initialization
    
    init(viewDelegate: SecondViewModelViewDelegate, coordinatorDelegate: SecondViewModelCoordinatorDelegate) {
        self.viewDelegate = viewDelegate
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    // MARK: - Functions
    
    func done() {
        coordinatorDelegate?.didPressClose(self)
    }
}
