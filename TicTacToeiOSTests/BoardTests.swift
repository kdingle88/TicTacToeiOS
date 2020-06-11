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
        let turn:Icon = .O
        let spots:[Icon] = [.E, .X, .E, .E, .E, .E, .E, .E, .E]
        let status = "O turn to move"
        let legalMoves = [0,2,3,4,5,6,7,8]
        
        XCTAssertTrue(newBoard.turn == turn)
        XCTAssertTrue(newBoard.spots == spots)
        XCTAssertTrue(newBoard.status == status)
        XCTAssertTrue(newBoard.legalMoves == legalMoves)
        XCTAssertFalse(newBoard.winner)
        XCTAssertFalse(newBoard.draw)
        XCTAssertTrue(newBoard.lastMove == 1)
    }
    
    func test_move_winner() {
        let turn:Icon = .O
        let spots: [Icon] = [.X, .X, .X, .E, .E, .O, .O, .E, .E]
        let status = "O turn to move"
        let legalMoves = [3,4,7,8]
        
        
        let testBoard = Board(spots: spots, turn: .O)

 

        XCTAssertTrue(testBoard.turn == turn)
        XCTAssertTrue(testBoard.spots == spots)
        XCTAssertTrue(testBoard.status == status)
        XCTAssertTrue(testBoard.legalMoves == legalMoves)
        XCTAssertTrue(testBoard.winner)
        XCTAssertFalse(testBoard.draw)
    }
    
    func test_move_draw() {
        let spots:[Icon] = [.O, .X, .O, .X, .X, .O, .X, .O, .X]
        let movesLeft = 0
        let testBoard = Board(spots: spots)
        
        XCTAssertTrue(testBoard.spots == spots)
        XCTAssertTrue(testBoard.legalMoves.count == movesLeft)
        XCTAssertFalse(testBoard.winner)
        XCTAssertTrue(testBoard.draw)

    }
    
    func test_check_row_win() {
        let spots:[Icon] = [.O, .O, .O, .X, .X, .E, .X, .E, .X]
        let testBoard = Board(spots: spots)
        
        XCTAssertTrue(testBoard.checkRowWin())
        XCTAssertFalse(testBoard.checkColumnWin())
        XCTAssertFalse(testBoard.checkDiagonalWin())
    }
    
    func test_check_column_win() {
          let spots:[Icon] = [.O, .O, .X, .O, .X, .E, .O, .X, .X]
          let testBoard = Board(spots: spots)
          
          XCTAssertFalse(testBoard.checkRowWin())
          XCTAssertTrue(testBoard.checkColumnWin())
          XCTAssertFalse(testBoard.checkDiagonalWin())
      }
    
    func test_check_diagonal_win() {
          let spots:[Icon] = [.O, .X, .X, .X, .O, .E, .O, .X, .O]
          let testBoard = Board(spots: spots)
          
          XCTAssertFalse(testBoard.checkRowWin())
          XCTAssertFalse(testBoard.checkColumnWin())
          XCTAssertTrue(testBoard.checkDiagonalWin())
      }


}
