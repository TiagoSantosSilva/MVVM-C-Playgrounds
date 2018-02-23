//
//  ElementDetailsViewModelTests.swift
//  MVVM-C PlaygroundsTests
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import XCTest
@testable import MVVM_C_Playgrounds

class ElementDetailsViewModelTests: XCTestCase {
    
    var currentExpectaion: XCTestExpectation?
    
    func testInitialDefaults() {
        let viewModel = ElementDetailsViewModel(element: Element(title: "Element 1", description: "Description 1"))
        XCTAssertNil(viewModel.viewDelegate)
        XCTAssertNil(viewModel.coordinatorDelegate)
    }
    
    func testDetails() {
        let viewModel = ElementDetailsViewModel(element: Element(title: "Element 1", description: "Description 1"))
        XCTAssertNotNil(viewModel.element)
        
        XCTAssertEqual("Element 1", viewModel.element!.title)
        XCTAssertEqual("Description 1", viewModel.element!.description)
    }
    
    func testCoordinatorDelegate() {
        let viewModel = ElementDetailsViewModel(element: Element(title: "Element 1", description: "Description 1"))
        viewModel.coordinatorDelegate = self
        currentExpectaion = expectation(description: "testCoordinatorDidChange")
        viewModel.done()
        
        waitForExpectations(timeout: 1) { error in
            viewModel.viewDelegate = nil
        }
    }
}

extension ElementDetailsViewModelTests: ElementDetailsViewModelCoordinatorDelegate {
    func detailsViewModelDidEnd(_ viewModel: ElementDetailsViewModel) {
        currentExpectaion?.fulfill()
    }
}
