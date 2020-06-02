//
//  ViewController.swift
//  TicTacToeiOS
//
//  Created by Keiph Maurice on 6/1/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = Board()
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet var spots: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
        
    }
    
    @IBAction func move(_ sender: UIButton) {
       
        if board.legalMoves.contains(sender.tag) && !board.winner && !board.draw {
            
            if board.turn == .X {
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
            }
                
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: .normal)
            }
            
             board = board.move(sender.tag)
             messageLabel.text = board.status
             checkForWinner()
             checkForDraw()
             
            
            
        }
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        resetBoard()

    }
    
    func resetBoard() {
        board = Board()
        messageLabel.text = board.status
        playAgainButton.isHidden = true
        
        
        for spot in spots {
            spot.setImage(nil, for: .normal)
        }
        for spot in spots {
            spot.isEnabled = true
        }
    }
    
    func checkForWinner() {
        if board.winner {
            messageLabel.isHidden = false
            messageLabel.text = "\(board.turn.opposite) wins the game!"
            playAgainButton.isHidden = false
            
            for spot in spots {
                spot.isEnabled = false
            }
        }
    }
    
    func checkForDraw() {
        if board.draw {
            messageLabel.isHidden = false
            messageLabel.text = "Game is a draw!"
            playAgainButton.isHidden = false
            
            for spot in spots {
                spot.isEnabled = false
            }
            
        }
    }
   
}

