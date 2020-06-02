//
//  BoardTests.swift
//  TicTacToeiOSTests
//
//  Created by Keiph Maurice on 6/2/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//
@testable import TicTacToeiOS
import XCTest

class BoardTests: XCTestCase {

    var board: Board!
    
    override func setUp() {
        super.setUp()
        board = Board()
    }
    
    override func tearDown() {
        super.tearDown()
        board = nil
    }
    
    func test_move_no_winner() {
        let newBoard = board.move(1)
        
        XCTAssertTrue(newBoard.turn == .O)
        XCTAssertTrue(newBoard.spots == [.E, .X, .E, .E, .E, .E, .E, .E, .E])
        XCTAssertTrue(newBoard.status == "O turn to move")
        XCTAssertTrue(newBoard.legalMoves == [0,2,3,4,5,6,7,8])
        XCTAssertFalse(newBoard.winner)
        XCTAssertFalse(newBoard.draw)
    }
    
    func test_move_winner() {
        
        var newBoard = board.move(0)
        
        XCTAssertTrue(newBoard.turn == .O)
        newBoard = newBoard.move(5)
        
        XCTAssertTrue(newBoard.turn == .X)
        newBoard = newBoard.move(1)
        
        XCTAssertTrue(newBoard.turn == .O)
        newBoard = newBoard.move(6)
        
        XCTAssertTrue(newBoard.turn == .X)
        newBoard = newBoard.move(2)

        XCTAssertTrue(newBoard.turn == .O)
        XCTAssertTrue(newBoard.spots == [.X, .X, .X, .E, .E, .O, .O, .E, .E])
        XCTAssertTrue(newBoard.status == "O turn to move")
        XCTAssertTrue(newBoard.legalMoves == [3,4,7,8])
        XCTAssertTrue(newBoard.winner)
        XCTAssertFalse(newBoard.draw)
    }
    
    func test_move_draw() {
        
        let testBoard = Board(spots:[.O, .X, .O, .X, .X, .O, .X, .O, .X])
        
        XCTAssertTrue(testBoard.spots == [.O, .X, .O, .X, .X, .O, .X, .O, .X])
        XCTAssertTrue(testBoard.legalMoves == [])
        XCTAssertFalse(testBoard.winner)
        XCTAssertTrue(testBoard.draw)

    }


}
