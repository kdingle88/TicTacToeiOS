//
//  GameTests.swift
//  TicTacToeiOSTests
//
//  Created by Keiph Maurice on 6/2/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//
@testable import TicTacToeiOS
import XCTest

class GameTests: XCTestCase {

   var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        super.tearDown()
        game = nil
    }
    
    func test_legal_move() {
        
        let move = 1
        
        XCTAssertTrue(game.legalMove(spot: move))
        
        game.makeMove(spot: move)
        
        XCTAssertFalse(game.legalMove(spot: 1))
    }

}
