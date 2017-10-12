//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Osama Mac on 10/13/17.
//  Copyright © 2017 Osama Mac. All rights reserved.
//

import UIKit

class PlayGameVC: UIViewController {

    var playerTurn = 1
    
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func putInput(_ sender: AnyObject) {
        let btnTag = sender.tag!
        
        if game[btnTag] == 0 {
            if playerTurn == 1 {
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                playerTurn = 2
            }else{
                sender.setImage(UIImage(named: "Nought.png"), for: .normal)
                playerTurn = 1
            }
        }
        
    }
}

