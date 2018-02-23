//
//  MVVM_C_PlaygroundsTests.swift
//  MVVM-C PlaygroundsTests
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import XCTest
@testable import MVVM_C_Playgrounds

class MVVM_C_PlaygroundsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDefaults() {
        let viewModel = ElementListViewModel()
        XCTAssertEqual(0, viewModel.numberOfItems)
        XCTAssertEqual("List", viewModel.title)
        XCTAssertNil(viewModel.viewDelegate)
        XCTAssertNil(viewModel.coordinatorDelegate)
    }
    
    // MARK: - Since the data is hardcoded we use this number.
            // However, if it was dynamic, a custom method would have to be created to perform the test.
    
    func testNumberOfItems() {
        let viewModel = ElementListViewModel()
        XCTAssertEqual(3, viewModel.numberOfItems)
    }
    
    func testItemAtIndex_ValidIndex() {
        let viewModel = ElementListViewModel()
        
        let elementZero = viewModel.itemAtIndex(0)
        
        XCTAssertEqual("Element 1", elementZero!.title)
        XCTAssertEqual("Element One", elementZero!.description)
        
        let elementTwo = viewModel.itemAtIndex(2)
        
        XCTAssertEqual("Element 3", elementTwo!.title)
        XCTAssertEqual("Element Three", elementTwo!.description)
    }
    
    func testItemAtIndex_InvalidIndex() {
        let viewModel = ElementListViewModel()
        
        let elementIndex = viewModel.numberOfItems + 1
        
        let elementAtOutOfListIndex = viewModel.itemAtIndex(elementIndex)
        
        XCTAssertNil(elementAtOutOfListIndex)
    }
}

