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
    
    func test_find_best_move_win_next_move() {
        let spots: [Icon] = [.X, .O, .X,
                               .X, .E, .O,
                               .E, .E, .O ]
        
        let board = Board(spots: spots, turn: .X, lastMove: 8)
        
        
        
        XCTAssertTrue(game.findBestMove(board) == 6)
    }
    
    func test_find_best_move_block_win() {
        let spots: [Icon] = [.X, .E, .E,
                               .E, .E, .O,
                               .E, .X, .O]
        let board: Board = Board(spots: spots, turn: .X, lastMove: 8)
        
        XCTAssertTrue(game.findBestMove(board) == 2)
    }
    
    func test_find_best_move_win_in_two_moves() {
        let spots: [Icon] = [.X, .E, .E,
                               .E, .E, .O,
                               .O, .X, .E]
        let board: Board = Board(spots:spots, turn: .X, lastMove: 6)
        
        XCTAssertTrue(game.findBestMove(board) == 1)
    }

}
