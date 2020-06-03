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
            var maxEval = Int.min
            for move in board.legalMoves {
                let result = minimax(board.move(move), maximizingPlayer: false, player: player)
                maxEval = max(result, maxEval)
            }
            return maxEval
        } else {
            var minEval = Int.max
            for move in board.legalMoves {
                let result = minimax(board.move(move), maximizingPlayer: true, player: player)
                minEval = min(result, minEval)
            }
            return minEval
        }
    }
    
    
    func findBestMove(_ board: Board) -> Int {
        var maxEval = Int.min
        var bestMove = -1
        for move in board.legalMoves {
            let result = minimax(board.move(move), maximizingPlayer: false, player: board.turn)
            if result > maxEval {
                maxEval = result
                bestMove = move
            }
        }
        return bestMove
    }

    
}
