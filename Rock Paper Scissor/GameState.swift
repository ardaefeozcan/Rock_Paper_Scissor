//
//  GameState.swift
//  Rock Paper Scissor
//
//  Created by Arda Efe Özcan on 30.09.2024.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw

    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You won!"
        case .lose:
            return "You lost!"
        case .draw:
            return "Is's a draw!"
            
        }
    }
}
