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
    
    func minimax(_ board: Board, maximizingPlayer: Bool, player: Icon) -> Int {
        if board.winner && player == board.turn.opposite { return 1 }
        else if board.winner && player != board.turn.opposite { return -1 }
        else if board.draw { return 0 }
     
        if maximizingPlayer {
            let maxEval = Int.min
            
            let newMaxEval = board.legalMoves.map({ move -> Int in
                let result = minimax(board.move(move), maximizingPlayer: false, player: player)
                return max(result, maxEval)
            })
            return newMaxEval.max() ?? maxEval
            
        } else {
            let minEval = Int.max
            
            let newMinEval = board.legalMoves.map({ move -> Int in
                let result = minimax(board.move(move), maximizingPlayer: true, player: player)
                return min(result, minEval)
            })
            
            return newMinEval.min() ?? minEval
        }
    }
    
    
    func findBestMove(_ board: Board) -> Int {
        if board.legalMoves.count > 0 {
        let evals = board.legalMoves.map({move -> Int in
            return minimax(board.move(move), maximizingPlayer: false, player: board.turn)
        })
        
        let maxEval = evals.max() ?? Int.min
        
        let maxEvalMoves = board.legalMoves.filter { minimax(board.move($0), maximizingPlayer: false, player: board.turn) == maxEval }
        
        
        return maxEvalMoves[0]
        } else {
            return -1
        }
    }
}
