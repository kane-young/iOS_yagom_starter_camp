//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 강경 on 2021/03/05.
//

class RockPaperScissorsGame {
    enum GamePlayer: CustomStringConvertible {
        case user
        case computer
        
        var description: String {
            switch self {
            case .user:
                return "플레이어"
            case .computer:
                return "컴퓨터"
            }
        }
    }
    
    enum Hand: String, CaseIterable, Comparable {
        static func < (lhs: Hand, rhs: Hand) -> Bool {
            if (lhs == .scissors && rhs == .rock)
            || (lhs == .paper && rhs == .scissors)
            || (lhs == .rock && rhs == .paper) {
                return true
            } else {
                return false
            }
        }
        
        case scissors = "1"
        case rock = "2"
        case paper = "3"
    }
    
    enum GameError: Error {
        case invalidInput
    }
    
    func startGame() {
        var isRepeated = false
        
        repeat {
            guard let computersHand = Hand.allCases.randomElement() else {
                continue
            }
            
            var playerHand: Hand
            do {
                if let handByPlayer = try getHandByPlayer() {
                    playerHand = handByPlayer
                } else {
                    print("게임종료")
                    break
                }
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                isRepeated = true
                continue
            }

            isRepeated = gameResult(playerHand, vs: computersHand)
        } while isRepeated
    }
    
    func gameResult(_ playersHand: Hand, vs computersHand: Hand) -> Bool {
        if playersHand == computersHand {
            print("비겼습니다.")
            return true
        } else if playersHand > computersHand {
            print("이겼습니다.")
            MukjjibbaGame(winner: .user).startGame()
            return false
        } else {
            print("졌습니다.")
            MukjjibbaGame(winner: .computer).startGame()
            return false
        }
    }
        
    func getHandByPlayer() throws -> Hand? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
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
