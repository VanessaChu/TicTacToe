//
//  ViewController.swift
//  TicTacToe
//
//  Created by Vanessa Chu on 2017-06-28.
//  Copyright © 2017 Vanessa Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 //1 is nought, 2 is cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7]]
    var winState = false

    @IBOutlet var winMessage: UILabel!
    
    @IBOutlet var playAgain: UIButton!
    @IBAction func buttonPressed(_ sender: AnyObject) {
        if activePlayer == 1{
            sender.setImage(UIImage(named: "nought.png"), for: [])
            gameState[sender.tag - 1] = activePlayer
        }else{
            sender.setImage(UIImage(named: "cross.png"), for: [])
            gameState[sender.tag - 1] = activePlayer
        }
        
        for combination in winningCombinations{
            if(gameState[combination[0] - 1] == activePlayer && gameState[combination[1] - 1] == activePlayer && gameState[combination[2] - 1] == activePlayer){
                winState = true
            }
        }
        
        if winState == true{
            winMessage.isHidden = false
            playAgain.isHidden = false
            if activePlayer == 1{
                winMessage.text = "Nought wins the game!"
            }else{
                winMessage.text = "Cross wins the game!"
            }
            winState = false
        }else{
            if activePlayer == 1{
                activePlayer = 2
            }else{
                activePlayer = 1
            }
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton{
            button.setImage(nil, for: [])
            }
        }
        winMessage.isHidden = true
        playAgain.isHidden = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winMessage.isHidden = true
        playAgain.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

