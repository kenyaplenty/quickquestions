//
//  quick_questionsTests.swift
//  quick-questionsTests
//
//  Created by karime on 10/7/20.
//

import XCTest
@testable import quick_questions

class quick_questionsTests: XCTestCase {
    
    /*
     * Test to see if we're able to tap on an option from view initialization
     */
    func testSelectOptionFromBeginning() {
        let vc = ViewController()
        
        //check selection is nothing at intialization
        XCTAssertEqual(vc.selectedOption, 0)
        
        vc.selectOption1()
        XCTAssertEqual(vc.selectedOption, 1)
    }
    
    /*
     * Test if we're able to switch between options with each selection
     */
    func testSelectionSwitching() {
        let vc = ViewController()
        
        //check selection is nothing at intialization
        XCTAssertEqual(vc.selectedOption, 0)
        
        vc.selectOption1()
        XCTAssertEqual(vc.selectedOption, 1)
        
        vc.selectOption2()
        XCTAssertEqual(vc.selectedOption, 2)
        
        vc.selectOption3()
        XCTAssertEqual(vc.selectedOption, 3)
    }
    
    /*
     * Test if we're able to switch between options with each selection
     */
    func testDeselection() {
        let vc = ViewController()
        
        //check selection is nothing at intialization
        XCTAssertEqual(vc.selectedOption, 0)
        
        vc.selectOption1()
        XCTAssertEqual(vc.selectedOption, 1)
        
        vc.selectOption1()
        XCTAssertEqual(vc.selectedOption, 0)
    }
}
