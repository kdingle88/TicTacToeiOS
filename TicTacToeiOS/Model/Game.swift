//
//  Game.swift
//  TicTacToeiOS
//
//  Created by Keiph Maurice on 6/2/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//

import Foundation

struct Game {
    var board = Board()
    
    func legalMove(spot: Int) -> Bool {
        if board.legalMoves.contains(spot) && !board.winner && !board.draw {
            return true
            
        }
        else {
            return false
        }
        
    }
    
    
    func getBoardStatus() -> String {
        return board.status
    }
    
    mutating func begin(){
        board = Board()
    }
    
    func getWinner() -> Bool {
        return board.winner
    }
    
    func getTurn() -> Icon {
        return board.turn 
    }
    
    func getDraw() -> Bool {
        return board.draw
    }
    
    mutating func makeMove(spot:Int) {
        board = board.move(spot)
    }
    
    func getComputerMove() -> Int? {
        return self.findBestMove(board)
        
    }
    
    func minimax(_ board: Board, maximizingPlayer: Bool, player: Icon, depth: Int) -> Int {
        if board.winner && player == board.turn.opposite || depth == 0 {
            return 1
        }
        else if board.winner && player != board.turn.opposite || depth == 0 {
            return -1
        }
        else if board.draw || depth == 0 {
            return 0
        }
     
        if maximizingPlayer {
            let maxEval = Int.min
            
            let newMaxEval = board.legalMoves.map { max(minimax(board.move($0), maximizingPlayer: true, player: player, depth: -1), maxEval) }
            
            return newMaxEval.max() ?? maxEval
            
        } else {
            
            let minEval = Int.max
            
            let newMinEval = board.legalMoves.map { min(minimax(board.move($0), maximizingPlayer: true, player: player, depth: -1), minEval) }
            
            return newMinEval.min() ?? minEval
        }
    }
    
    
    func findBestMove(_ board: Board) -> Int {
        let evals = board.legalMoves.map { minimax(board.move($0), maximizingPlayer: false, player: board.turn, depth: 3) }
        
        let maxEval = evals.max() ?? Int.min
        
        let maxEvalMoves:[Int] = board.legalMoves.filter { minimax(board.move($0), maximizingPlayer: false, player: board.turn, depth: 3) == maxEval }
        
        let highestMoveEval = maxEvalMoves.max { a,b in a < b }
        
        return highestMoveEval ?? -1
       
    }
}
