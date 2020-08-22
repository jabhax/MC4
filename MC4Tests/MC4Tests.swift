//
//  MC4Tests.swift
//  MC4Tests
//
//  Created by Justin Barros on 7/31/20.
//  Copyright © 2020 JabKamHax. All rights reserved.
//

import XCTest
@testable import MC4

class MC4Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let board = Board()
        
        let msg = "Board row and column sizes do not match. Must have N x N Grid."
        XCTAssertEqual(board.rows(), board.cols(r:0), msg)
        
        
        let p1 = Player()
        let p2 = Player()
        print(p1)
        print(p2)
        
        for i in 0...board.get_grid().count-1 {
            for j in 0...board.get_grid()[i].count-1 {
                board.insert_left(r: j)
            }
        }
        board.print_players()
        board.print_board()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
