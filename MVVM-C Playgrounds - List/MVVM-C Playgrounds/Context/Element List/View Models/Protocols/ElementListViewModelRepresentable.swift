//
//  ElementListViewModelRepresentable.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import Foundation

protocol ElementListViewModelDelegate: class {
    func itemsDidChange(viewModel: ElementListViewModel)
}

protocol ElementListViewModelCoordinatorDelegate: class {
    func elementListViewModelDidSelectData(_ viewModel: ElementListViewModel, element: Element)
}

protocol ElementListViewModelRepresentable {
    
    var viewDelegate: ElementListViewModelDelegate? { get set }
    var coordinatorDelegate: ElementListViewModelCoordinatorDelegate? { get set }
    
    var title: String { get }
    var numberOfItems: Int { get }
    
    func itemAtIndex(_ index: Int) -> Element?
    func useItemAtIndex(_ index: Int)
}
