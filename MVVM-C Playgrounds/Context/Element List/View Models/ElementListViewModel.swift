//
//  ElementListViewModel.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import Foundation

class ElementListViewModel {
    
    // MARK: - Properties
    
    private var items: [Element] = [
        Element(title: "Element 1", description: "Element One"),
        Element(title: "Element 2", description: "Element Two"),
        Element(title: "Element 3", description: "Element Three")
    ]
    
    // MARK: -
    
    weak var viewDelegate: ElementListViewModelDelegate?
    
    // MARK: -
    
    weak var coordinatorDelegate: ElementListViewModelCoordinatorDelegate?
}

extension ElementListViewModel: ElementListViewModelRepresentable {

    func itemAtIndex(_ index: Int) -> Element? {
        guard items.count > index else { return nil }
        return items[index]
    }
    
    func useItemAtIndex(_ index: Int) {
        guard let coordinatorDelegate = coordinatorDelegate,
            items.count > index else { return }
        
        coordinatorDelegate.elementListViewModelDidSelectData(self, element: items[index])
    }
    
    
    var title: String {
        return "List"
    }
    
    var numberOfItems: Int {
        return items.count
    }
}
