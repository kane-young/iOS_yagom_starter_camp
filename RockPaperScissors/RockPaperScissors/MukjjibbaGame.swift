//
//  MukjjibbaGame.swift
//  RockPaperScissors
//
//  Created by 강경 on 2021/03/05.
//

class MukjjibbaGame: RockPaperScissorsGame {
    var winner: GamePlayer
    
    init(winner: RockPaperScissorsGame.GamePlayer) {
        switch winner {
        case .computer:
            self.winner = .computer
        case .user:
            self.winner = .user
        }
    }
    
    override func gameResult(_ playersHand: Hand, vs computersHand: Hand) -> GameResult {
        if playersHand == computersHand {
            print("\(winner)의 승리!")
            switch winner {
            case .computer:
                return .computer
            case .user:
                return .user
            }
        } else if playersHand > computersHand {
            winner = .user
            print("\(winner)의 턴입니다")
            return .none
        } else {
            winner = .computer
            print("\(winner)의 턴입니다")
            return .none
        }
    }
        
    override func getHandByPlayer() throws -> Hand? {
        print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
        guard let playerInput = readLine() else {
            throw GameError.invalidInput
        }
        
        if playerInput == "0" {
            return nil
        }
        
        guard let playerHand = Hand(rawValue: playerInput) else {
            throw GameError.invalidInput
        }

        return playerHand
    }
}
