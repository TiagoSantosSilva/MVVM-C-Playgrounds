//
//  ElementDetailsViewModel.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import Foundation

class ElementDetailsViewModel {
    
    // MARK: - Properties
    
    weak var viewDelegate: ElementDetailsViewModelDelegate?
    
    // MARK: -
    
    weak var coordinatorDelegate: ElementDetailsViewModelCoordinatorDelegate?
    
    // MARK: -
    
    internal(set) var element: Element? {
        didSet {
            viewDelegate?.detailsDidChange(viewModel: self)
        }
    }
    
    // MARK: - Initializer
    
    init(element: Element) {
        self.element = element
    }
}

extension ElementDetailsViewModel: ElementDetailsViewModelRepresentable {
    
    // MARK: -
    
    func done() {
        coordinatorDelegate?.detailsViewModelDidEnd(self)
    }
}
