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
        let newBoard = board.move(0)
        let turn:Icon = .O
        let spots:[Icon] = [
            .X, .E, .E, .E, .E,
            .E, .E, .E, .E, .E,
            .E, .E, .E, .E, .E,
            .E, .E, .E, .E, .E,
            .E, .E, .E, .E, .E
        ]
        let status = "O turn to move"
        let legalMoves = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
        
        XCTAssertTrue(newBoard.turn == turn)
        XCTAssertTrue(newBoard.spots == spots)
        XCTAssertTrue(newBoard.status == status)
        XCTAssertTrue(newBoard.legalMoves == legalMoves)
        XCTAssertFalse(newBoard.winner)
        XCTAssertFalse(newBoard.draw)
        XCTAssertTrue(newBoard.lastMove == 0)
    }
    
    func test_board_winner() {
        let turn:Icon = .O
        let spots:[Icon] = [
            .X, .X, .X, .X, .X,
            .O, .O, .O, .O, .E,
            .E, .E, .E, .E, .E,
            .E, .E, .E, .E, .E,
            .E, .E, .E, .E, .E]
        
        let testBoard = Board(spots: spots, turn: .O)

 

        XCTAssertTrue(testBoard.turn == turn)
        XCTAssertTrue(testBoard.spots == spots)
        XCTAssertTrue(testBoard.winner)
        XCTAssertFalse(testBoard.draw)
    }
    
    func test_board_draw() {
        let spots:[Icon] = [
        .X, .X, .X, .X, .O,
        .O, .O, .O, .O, .X,
        .X, .X, .X, .X, .O,
        .O, .O, .O, .O, .X,
        .X, .X, .X, .O, .O]
        let movesLeft = 0
        let testBoard = Board(spots: spots)
        
        XCTAssertTrue(testBoard.spots == spots)
        XCTAssertTrue(testBoard.legalMoves.count == movesLeft)
        XCTAssertFalse(testBoard.winner)
        XCTAssertTrue(testBoard.draw)

    }
    
    func test_check_row_win() {
        let spots:[Icon] = [
        .X, .X, .X, .X, .X,
        .O, .O, .O, .O, .E,
        .E, .E, .E, .E, .E,
        .E, .E, .E, .E, .E,
        .E, .E, .E, .E, .E]
        let testBoard = Board(spots: spots)
        
        XCTAssertTrue(testBoard.checkRowWin())
        XCTAssertFalse(testBoard.checkColumnWin())
        XCTAssertFalse(testBoard.checkDiagonalWin())
    }
    
    func test_check_column_win() {
          let spots:[Icon] = [
          .X, .X, .E, .E, .E,
          .X, .O, .O, .O, .O,
          .X, .E, .E, .E, .O,
          .X, .E, .E, .E, .E,
          .X, .E, .E, .E, .E]
          let testBoard = Board(spots: spots)
          
          XCTAssertFalse(testBoard.checkRowWin())
          XCTAssertTrue(testBoard.checkColumnWin())
          XCTAssertFalse(testBoard.checkDiagonalWin())
      }
    
    func test_check_diagonal_win() {
          let spots:[Icon] = [
          .X, .E, .E, .E, .E,
          .O, .X, .O, .O, .O,
          .E, .E, .X, .E, .E,
          .E, .E, .E, .X, .E,
          .E, .E, .E, .E, .X]
          let testBoard = Board(spots: spots)
          
          XCTAssertFalse(testBoard.checkRowWin())
          XCTAssertFalse(testBoard.checkColumnWin())
          XCTAssertTrue(testBoard.checkDiagonalWin())
      }


}
