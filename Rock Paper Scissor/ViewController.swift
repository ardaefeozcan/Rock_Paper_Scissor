//
//  ViewController.swift
//  Rock Paper Scissor
//
//  Created by Arda Efe Özcan on 30.09.2024.
//

import UIKit

class ViewController: UIViewController {
   
    // MARK: -IB Outlets
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    // MARK: - Instance Properities

   
    
    // MARK: - VDL

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
    }

    // MARK: - IB Actions
    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    
    // MARK: - Instance Methods
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        switch state {
        case .start:
            view.backgroundColor = .gray
            
            signLabel.text = "🤖"
            playAgainButton.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorButton.isEnabled = true
            
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .draw:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        }
    }
    
    
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        signLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
    
    
}

