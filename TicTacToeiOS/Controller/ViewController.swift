//
//  ViewController.swift
//  TicTacToeiOS
//
//  Created by Keiph Maurice on 6/1/20.
//  Copyright © 2020 Keith Maurice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet var spots: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
        
    }
    
    @IBAction func move(_ sender: UIButton) {
        
        if game.legalMove(spot: sender.tag) {
            game.makeMove(spot:sender.tag)
            sender.setImage(UIImage(named: "Cross.png"), for: .normal)
            
            
            messageLabel.text = game.getBoardStatus()
            checkForWinner()
            checkForDraw()
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                if let computerMove = self.game.getComputerMove() {
                    if self.game.legalMove(spot: computerMove) {
                        self.game.makeMove(spot:computerMove)
                        self.spots[computerMove].setImage(#imageLiteral(resourceName: "Nought"), for: .normal)
                        self.messageLabel.text = self.game.getBoardStatus()
                        self.checkForWinner()
                        self.checkForDraw()
                        
                        
                    }
                }
            }
        }
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        resetBoard()
        
    }
    
    func resetBoard() {
        game.begin()
        messageLabel.text = game.getBoardStatus()
        playAgainButton.isHidden = true
        
        
        for spot in spots {
            spot.setImage(nil, for: .normal)
        }
        for spot in spots {
            spot.isEnabled = true
        }
    }
    
    func checkForWinner() {
        if game.getWinner() {
            messageLabel.isHidden = false
            messageLabel.text = "\(game.getTurn().opposite) wins the game!"
            playAgainButton.isHidden = false
            
            for spot in spots {
                spot.isEnabled = false
            }
        }
    }
    
    func checkForDraw() {
        if game.getDraw() {
            messageLabel.isHidden = false
            messageLabel.text = "Game is a draw!"
            playAgainButton.isHidden = false
            
            
            for spot in spots {
                spot.isEnabled = false
            }
            
        }
    }
    
    
    
}

