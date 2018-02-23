//
//  ElementDetailsViewModelRepresentable.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import Foundation

protocol ElementDetailsViewModelDelegate: class {
    func detailsDidChange(viewModel: ElementDetailsViewModel)
}

protocol ElementDetailsViewModelCoordinatorDelegate: class {
    func detailsViewModelDidEnd(_ viewModel: ElementDetailsViewModel)
}

protocol ElementDetailsViewModelRepresentable {
    var element: Element? { get set }
    var viewDelegate: ElementDetailsViewModelDelegate? { get set }
    var coordinatorDelegate: ElementDetailsViewModelCoordinatorDelegate? { get set }
    
    func done()
}
