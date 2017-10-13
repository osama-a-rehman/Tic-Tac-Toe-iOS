//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Osama Mac on 10/13/17.
//  Copyright © 2017 Osama Mac. All rights reserved.
//

import UIKit
import Darwin

class PlayGameVC: UIViewController {

    @IBOutlet weak var playerTurnLabel: UILabel!
    public var playerTurn = 1
    
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameRunning = true
    
    let winConditions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerTurnLabel.text = "Player 1\'s turn"
    }
    
    @IBAction func putInput(_ sender: AnyObject) {
        let btnTag = sender.tag!
        
        if game[btnTag] == 0 && gameRunning == true{
            if playerTurn == 1 {
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                
                playerTurn = 2
                playerTurnLabel.text = "Player 2\'s turn"
            }else{
                sender.setImage(UIImage(named: "Nought.png"), for: .normal)
                playerTurn = 1
                playerTurnLabel.text = "Player 1\'s turn"
            }
            
            game[btnTag] = playerTurn
            
            let hasWin = checkWin()
            
            if hasWin {
                playerTurnLabel.text = "Player \((playerTurn == 1 ? 2 : 1)) has won"
                
                gameRunning = false
                
                performSegue(withIdentifier: "ResultVCSegue", sender: (playerTurn == 1 ? 2 : 1))
            }else{
                let check = checkDraw()
                
                if check == true {
                    playerTurnLabel.text = "The match has drawn!"
                    
                    gameRunning = false
                    
                    performSegue(withIdentifier: "ResultVCSegue", sender: -1)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultVC {
            if let result = sender as? Int {
                destination.result = result
            }
        }
    }
    
    @IBAction func btnNewGamePressed(_ sender: AnyObject) {
        game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        gameRunning = true
        
        playerTurn = 1
        
        for case let button as UIButton in self.view.subviews {
            button.setImage(nil, for: .normal)
        }
        
        playerTurnLabel.text = "Player 1\'s turn"

    }
    
    
    
    @IBAction func btnExitPressed(_ sender: AnyObject) {
        exit(0)
    }
    
    func checkWin() -> Bool{
        for condition in winConditions {
            if game[condition[0]] != 0 && game[condition[0]] == game[condition[1]] && game[condition[1]] == game[condition[2]] {
                return true
            }
        }
        
        return false
    }
    
    func checkDraw() -> Bool {
        for number in game {
            if number == 0 {
                return false
            }
        }
        
        return true
    }
}

