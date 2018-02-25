//
//  BaseViewModel.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import Foundation

protocol BaseViewModelViewDelegate: class {
    
}

protocol BaseViewModelCoordinatorDelegate: class {
    func didSelectAnimal(_ viewModel: BaseViewModelRepresentable, animal: Animal)
}

protocol BaseViewModelRepresentable {
    
    // MARK: - Parameters
    
    weak var coordinatorDelegate: BaseViewModelCoordinatorDelegate? { get }
    
    // MARK: -
    
    weak var viewDelegate: BaseViewModelViewDelegate? { get }
    
    // MARK: - Functions
    
    func didSelectAnimal(animal: Animal)
}

struct BaseViewModel: BaseViewModelRepresentable {
    
    // MARK: - Parameters
    
    weak var coordinatorDelegate: BaseViewModelCoordinatorDelegate?
    
    // MARK: -
    
    weak var viewDelegate: BaseViewModelViewDelegate?
    
    // MARK: - Initialization
    
    init(coordinatorDelegate: BaseViewModelCoordinatorDelegate, viewDelegate: BaseViewModelViewDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
        self.viewDelegate = viewDelegate
    }
    
    // MARK: - Functions
    
    func didSelectAnimal(animal: Animal) {
        coordinatorDelegate?.didSelectAnimal(self, animal: animal)
    }
}
